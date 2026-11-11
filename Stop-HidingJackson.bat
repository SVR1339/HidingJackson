@echo off
title HidingJackson - Stopping Proxy & Resetting Internet
echo ==============================================================================
echo                 HIDINGJACKSON - CLEAN SHUTDOWN & PROXY RESET
echo ==============================================================================
echo [1/3] Terminating HidingJackson Core Engines...
taskkill /F /IM verge-mihomo.exe >nul 2>&1
taskkill /F /IM HidingJackson.exe >nul 2>&1
taskkill /F /IM clash-verge.exe >nul 2>&1

echo [2/3] Resetting Windows Internet Proxy Settings to Direct Connection...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul

echo [3/3] Purging Stale Single-Instance Locks...
del /q "%APPDATA%\io.github.hiding-jack-rev.hiding-jack-rev\singleton-instance.*" >nul 2>&1

echo ==============================================================================
echo [SUCCESS] HidingJackson has been safely stopped.
echo           - Windows System Proxy: DISABLED (Direct Native Internet)
echo           - Core Daemons & Locks: Cleaned up
echo ==============================================================================
timeout /t 3
exit
