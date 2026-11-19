@echo off
setlocal

REM ============================================
REM  ST-Link driver installer - interactive mode
REM  (silent mode fails with 0xE0000242 because
REM   the ST signing publisher is not yet trusted)
REM ============================================

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set "DRV=C:\Users\milo\AppData\Local\stm32cube\bundles\stlink-usb-driver\2.1.2+st.5\bin"

echo.
echo ============================================
echo   ST-Link driver installation
echo ============================================
echo.
echo A driver installation wizard will open now.
echo If Windows asks about the publisher, choose:
echo   "Always trust this software and install"
echo   (or "Install anyway" / "Yes")
echo Then click Next / Install to finish.
echo.
echo It may appear up to 3 times - once per driver.
echo.
pause

"%DRV%\dpinst_amd64.exe"

echo.
echo ============================================
echo  Wizard finished. Now please:
echo   1. Unplug the ST-Link USB cable
echo   2. Wait 3 seconds
echo   3. Plug it back in
echo   4. Come back and tell me you are done
echo ============================================
echo.
pause
