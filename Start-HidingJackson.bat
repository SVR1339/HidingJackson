@echo off
title HidingJackson - Launching Stealth Proxy Engine
echo ==============================================================================
echo                 HIDINGJACKSON - STEALTH EGRESS AND UNBLOCK ENGINE
echo ==============================================================================
echo [1/3] Checking Core Engine Status...

tasklist /FI "IMAGENAME eq verge-mihomo.exe" 2>NUL | find /I /N "verge-mihomo.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo   - Core engine is already active and running!
) else (
    echo   - Starting Mihomo Core Daemon...
    start /B "" "C:\Program Files\Clash Verge\verge-mihomo.exe" -f "%APPDATA%\io.github.clash-verge-rev.clash-verge-rev\profiles\hidingjackson-global.yaml" -d "%APPDATA%\io.github.clash-verge-rev.clash-verge-rev"
    timeout /t 2 /nobreak >nul
)

echo [2/3] Activating Windows System Proxy (127.0.0.1:7897)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "127.0.0.1:7897" /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "localhost;127.*;192.168.*;10.*;172.16.*;*.local;<local>" /f >nul

echo [3/3] Launching HidingJackson Interactive Dashboard...
start "" "%~dp0web\index.html"

echo ==============================================================================
echo [SUCCESS] HidingJackson is Active and Guarding your Connection!
echo           - Proxy Port: 127.0.0.1:7897
echo           - Controller API: http://127.0.0.1:9097
echo           - Web Dashboard: Opened in your browser
echo ==============================================================================
timeout /t 2 >nul
exit
