@echo off
REM PHIS Complete Installation - Batch wrapper for PowerShell script
REM This makes it easy to double-click and run the full installation

echo ============================================================
echo              PHIS Complete Installation System
echo ============================================================
echo.
echo This will install PHIS (OpenSILEX) on Azure infrastructure
echo.

REM Check if PowerShell script exists
if not exist "Install-PHIS.ps1" (
    echo ERROR: Install-PHIS.ps1 not found!
    echo Please ensure all installation files are in the same directory.
    pause
    exit /b 1
)

REM Check for required files
set MISSING_FILES=0

if not exist "Deploy-AzurePHISVM.ps1" (
    echo WARNING: Deploy-AzurePHISVM.ps1 not found - VM creation will not be available
    set MISSING_FILES=1
)

if not exist "template-vm.json" (
    echo WARNING: template-vm.json not found - VM creation will not be available
    set MISSING_FILES=1
)

if %MISSING_FILES%==1 (
    echo.
    echo Some files are missing. You can still install on an existing VM.
    echo.
)

echo Select installation type:
echo.
echo 1. Full Installation (Create VM + Install PHIS)
echo 2. Install on Existing VM
echo 3. Create VM Only
echo 4. Check Installation Status
echo 5. Exit
echo.

set /p CHOICE="Enter your choice (1-5): "

if "%CHOICE%"=="1" goto FULL_INSTALL
if "%CHOICE%"=="2" goto EXISTING_VM
if "%CHOICE%"=="3" goto VM_ONLY
if "%CHOICE%"=="4" goto CHECK_STATUS
if "%CHOICE%"=="5" goto END

echo Invalid choice. Please run again.
pause
exit /b 1

:FULL_INSTALL
echo.
echo Starting full installation...
echo This will create a new Azure VM and install PHIS.
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Install-PHIS.ps1" -Action FullInstall
goto END

:EXISTING_VM
echo.
set /p VM_IP="Enter the IP address of your existing VM: "
echo.
echo Starting installation on existing VM at %VM_IP%...
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Install-PHIS.ps1" -Action InstallOnly -UseExistingVM -VMIPAddress "%VM_IP%"
goto END

:VM_ONLY
echo.
echo Creating Azure VM only...
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Install-PHIS.ps1" -Action VMOnly
goto END

:CHECK_STATUS
echo.
echo Checking installation status...
echo.
set /p STATUS_IP="Enter the IP address of the VM (or press Enter to use saved info): "
if "%STATUS_IP%"=="" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Install-PHIS.ps1" -Action Status
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\Install-PHIS.ps1" -Action Status -VMIPAddress "%STATUS_IP%"
)
goto END

:END
echo.
echo ============================================================
echo Process completed. Check the output above for any errors.
echo ============================================================
pause