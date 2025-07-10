@echo off
REM Deploy PHIS VM to Azure - Batch wrapper for PowerShell script
REM This makes it easy to double-click and run the deployment

echo ====================================
echo     PHIS Azure VM Deployment
echo ====================================
echo.

REM Check if PowerShell script exists
if not exist "Deploy-AzurePHISVM.ps1" (
    echo ERROR: Deploy-AzurePHISVM.ps1 not found!
    echo Please ensure the script is in the same directory.
    pause
    exit /b 1
)

REM Check if template exists
if not exist "template-vm.json" (
    echo ERROR: template-vm.json not found!
    echo Please ensure the template file is in the same directory.
    pause
    exit /b 1
)

echo Starting Azure VM deployment...
echo.

REM Run the PowerShell script with execution policy bypass for this session only
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Deploy-AzurePHISVM.ps1"

echo.
echo ====================================
echo Deployment script completed
echo ====================================
pause