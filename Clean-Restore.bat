@echo off
title HidingJackson - Total System Restoration
echo ==============================================================================
echo           HIDINGJACKSON - CLEAN SYSTEM RESTORATION & ROLLBACK
echo ==============================================================================
echo [1/5] Terminating Active HidingJackson Processes...
taskkill /F /IM HidingJackson.exe 2>nul
taskkill /F /IM verge-mihomo.exe 2>nul
taskkill /F /IM verge-mihomo-alpha.exe 2>nul
taskkill /F /IM hiding-jack-service.exe 2>nul
taskkill /F /IM clash-verge-service.exe 2>nul

echo [2/5] Resetting Windows System Proxy to Native Direct Internet...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /f 2>nul

echo [3/5] Stopping and Removing Windows Services 'hiding_jack_service' and 'clash_verge_service'...
net stop hiding_jack_service 2>nul
sc.exe stop hiding_jack_service 2>nul
sc.exe delete hiding_jack_service 2>nul
net stop clash_verge_service 2>nul
sc.exe stop clash_verge_service 2>nul
sc.exe delete clash_verge_service 2>nul

echo [4/5] Removing ProgramData Service Remnants...
if exist "C:\ProgramData\hiding-jack-service" (
    rmdir /s /q "C:\ProgramData\hiding-jack-service" 2>nul
)
if exist "C:\ProgramData\clash-verge-service" (
    rmdir /s /q "C:\ProgramData\clash-verge-service" 2>nul
)

echo [5/5] Flushing DNS & Resetting WinSock Sockets...
ipconfig /flushdns >nul

echo ==============================================================================
echo [SUCCESS] Windows Network Settings Have Been Fully Restored to Native State!
echo ==============================================================================
exit /b 0
