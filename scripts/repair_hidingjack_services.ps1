# Elevated Windows Service Repair Script for Hiding Jack / HidingJackson
# Requires Administrator privileges (run via UAC -Verb RunAs)

$ErrorActionPreference = "Continue"
$LogPath = "C:\Users\asus\.gemini\antigravity\scratch\service_repair.log"
$AppDataDir = "C:\Users\asus\AppData\Roaming\io.github.hiding-jack-rev.hiding-jack-rev"

function Write-Log {
    param([string]$Msg)
    $line = "[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Msg
    Add-Content -Path $LogPath -Value $line -Encoding UTF8
    Write-Output $line
}

Set-Content -Path $LogPath -Value "=== Hiding Jack Service Repair Started ===" -Encoding UTF8

# 1. Verify Administrator token (no bypass)
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($identity)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Script must run as Administrator."
    exit 5
}
Write-Log "Running elevated as Administrator ($($identity.Name))."

# 2. Stop HidingJackson desktop app and clear stale singleton locks
Write-Log "Stopping HidingJackson.exe if running..."
Get-Process -Name "HidingJackson" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Milliseconds 500
foreach ($lockName in @("singleton-instance.lock", "singleton-instance.json")) {
    $lp = Join-Path $AppDataDir $lockName
    if (Test-Path $lp) {
        Remove-Item $lp -Force -ErrorAction SilentlyContinue
        Write-Log "Removed lock file: $lp"
    }
}
Get-ChildItem -Path $AppDataDir -Filter "singleton-instance.json.tmp-*" -ErrorAction SilentlyContinue | ForEach-Object {
    Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
    Write-Log "Removed temp lock file: $($_.FullName)"
}

# 3. Stop and delete conflicting clash_verge_service
$cvQuery = & sc.exe query clash_verge_service 2>&1 | Out-String
if ($LASTEXITCODE -eq 0) {
    Write-Log "Stopping conflicting service clash_verge_service..."
    & sc.exe stop clash_verge_service 2>&1 | Out-Null
    for ($i = 0; $i -lt 15; $i++) {
        $q = & sc.exe query clash_verge_service 2>&1 | Out-String
        if ($q -match "STOPPED") { break }
        Start-Sleep -Milliseconds 400
    }
    Write-Log "Deleting conflicting service clash_verge_service..."
    $delOut = & sc.exe delete clash_verge_service 2>&1 | Out-String
    Write-Log ("sc delete clash_verge_service: " + $delOut.Trim())
} else {
    Write-Log "clash_verge_service already absent."
}

# 4. Stop hiding_jack_service temporarily and clear any leftover/orphaned service or mihomo processes
Write-Log "Stopping hiding_jack_service cleanly before process cleanup..."
& sc.exe stop hiding_jack_service 2>&1 | Out-Null
Start-Sleep -Seconds 1

foreach ($procName in @("hiding-jack-service", "clash-verge-service", "verge-mihomo")) {
    $procs = Get-Process -Name $procName -ErrorAction SilentlyContinue
    if ($procs) {
        foreach ($p in $procs) {
            Write-Log "Terminating leftover process $($p.ProcessName) (PID $($p.Id))..."
            Stop-Process -Id $p.Id -Force -ErrorAction SilentlyContinue
        }
    }
}
Start-Sleep -Seconds 1

# Wait briefly for pipe teardown
for ($i = 0; $i -lt 10; $i++) {
    $pipes = [System.IO.Directory]::GetFiles("\\.\pipe\") | Where-Object { $_ -match "hiding-jack" }
    if (-not $pipes) { break }
    Start-Sleep -Milliseconds 300
}

# 5. Ensure hiding_jack_service exists, is AUTO_START, and starts cleanly
$hjQc = & sc.exe qc hiding_jack_service 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Log "ERROR: hiding_jack_service is not registered (`sc qc` exit $LASTEXITCODE)."
    Write-Log $hjQc.Trim()
    exit 2
}
Write-Log "hiding_jack_service config:`n$($hjQc.Trim())"

& sc.exe config hiding_jack_service start= auto 2>&1 | Out-Null
Write-Log "Starting hiding_jack_service..."
$startOut = & sc.exe start hiding_jack_service 2>&1 | Out-String
Write-Log ("sc start hiding_jack_service: " + $startOut.Trim())

$running = $false
for ($i = 0; $i -lt 20; $i++) {
    $svc = Get-Service -Name "hiding_jack_service" -ErrorAction SilentlyContinue
    if ($svc -and $svc.Status -eq "Running") {
        $running = $true
        break
    }
    Start-Sleep -Milliseconds 500
}

# Wait briefly for named pipe \\.\pipe\hiding-jack-service
$pipeReady = $false
for ($i = 0; $i -lt 15; $i++) {
    $pipes = [System.IO.Directory]::GetFiles("\\.\pipe\") | Where-Object { $_ -match "hiding-jack" }
    if ($pipes -contains "\\.\pipe\hiding-jack-service") {
        $pipeReady = $true
        break
    }
    Start-Sleep -Milliseconds 300
}

# 6. Final verification diagnostics
$cvAfter = & sc.exe query clash_verge_service 2>&1 | Out-String
$cvExit = $LASTEXITCODE
$hjAfter = & sc.exe query hiding_jack_service 2>&1 | Out-String
$pipesAfter = ([System.IO.Directory]::GetFiles("\\.\pipe\") | Where-Object { $_ -match "hiding-jack|mihomo" }) -join ", "
$portsAfter = (& netstat -ano | Select-String ":(7897|7900|9097)\s") | Out-String

Write-Log "Verification clash_verge_service query (exit=$cvExit): $($cvAfter.Trim())"
Write-Log "Verification hiding_jack_service query:`n$($hjAfter.Trim())"
Write-Log "Named pipes: $pipesAfter"
Write-Log "Ports 7897/7900/9097:`n$($portsAfter.Trim())"

if ($running -and $pipeReady -and ($cvExit -eq 1060)) {
    Write-Log "SUCCESS: hiding_jack_service is Running, pipe is active, and clash_verge_service is removed."
    exit 0
} elseif ($running -and $pipeReady) {
    Write-Log "PARTIAL_SUCCESS: hiding_jack_service is Running and pipe is active, but clash_verge_service exit=$cvExit."
    exit 1
} else {
    Write-Log "FAILURE: running=$running pipeReady=$pipeReady cvExit=$cvExit"
    exit 1
}
