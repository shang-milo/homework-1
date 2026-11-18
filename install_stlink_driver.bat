@echo off
setlocal

REM ============================================
REM  ST-Link driver installer (self-elevating)
REM ============================================

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Running with administrator rights.
echo Installing ST-Link USB drivers...
echo.

set "DRV=C:\Users\milo\AppData\Local\stm32cube\bundles\stlink-usb-driver\2.1.2+st.5\bin"

if not exist "%DRV%\dpinst_amd64.exe" (
    echo ERROR: driver folder not found:
    echo %DRV%
    goto END
)

"%DRV%\dpinst_amd64.exe" /q /S
echo dpinst finished. Exit code: %errorlevel%

echo.
echo ============================================
echo  Done. Now please:
echo   1. Unplug the ST-Link USB cable
echo   2. Wait 3 seconds
echo   3. Plug it back in
echo   4. Check Device Manager - ST-LINK should
echo      appear under "STMicroelectronics"
echo ============================================

:END
echo.
pause
