@echo off
REM PHIS Master Controller - Windows Launcher
REM Double-click this file to start the PHIS installation and management system

title PHIS Master Controller

echo ============================================================
echo              PHIS Master Controller v2.0
echo ============================================================
echo.

REM Check if PowerShell script exists
if not exist "PHIS.ps1" (
    echo ERROR: PHIS.ps1 not found!
    echo Please ensure the script is in the same directory.
    echo.
    pause
    exit /b 1
)

REM Check if template exists for deployment functions
if not exist "template-vm.json" (
    echo WARNING: template-vm.json not found!
    echo VM deployment functions will not be available.
    echo You can still install PHIS on existing VMs.
    echo.
    pause
)

REM Check for command line arguments
if "%~1"=="" goto MENU

REM If arguments provided, pass them through
echo Running command: %*
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\PHIS.ps1" %*
goto END

:MENU
REM No arguments - run interactive menu
echo Starting interactive menu...
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\PHIS.ps1" -Command Menu

:END
echo.
echo ============================================================
echo Process completed. Check the output above for any errors.
echo ============================================================
pause