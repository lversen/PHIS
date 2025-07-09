@echo off
REM PHIS Interactive Menu Launcher
REM Double-click this file to start the PHIS management menu

title PHIS Installation and Management Menu

echo Starting PHIS Interactive Menu System...
echo.

REM Check if menu script exists
if not exist "PHIS-Menu.ps1" (
    echo ERROR: PHIS-Menu.ps1 not found!
    echo Please ensure all installation files are in the same directory.
    echo.
    pause
    exit /b 1
)

REM Run the interactive menu
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\PHIS-Menu.ps1"

REM Script has exited
echo.
echo Menu closed.
pause