#Requires -Version 5.1
<#
.SYNOPSIS
    Interactive menu system for PHIS installation and management.

.DESCRIPTION
    Provides a user-friendly menu interface for all PHIS operations.

.EXAMPLE
    .\PHIS-Menu.ps1
#>

[CmdletBinding()]
param()

$ErrorActionPreference = "Continue"

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

function Show-Menu {
    Clear-Host
    Write-Host @"
╔═══════════════════════════════════════════════════════════════════════╗
║                                                                       ║
║                     PHIS Installation & Management                    ║
║                          Interactive Menu                             ║
║                                                                       ║
╚═══════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    if ($isAdmin) {
        Write-Host "  Running as Administrator" -ForegroundColor Green
    } else {
        Write-Host "  Running as User (some operations may require admin)" -ForegroundColor Yellow
    }
    
    Write-Host "`n━━━ Installation Options ━━━" -ForegroundColor Yellow
    Write-Host "  1. " -NoNewline; Write-Host "Complete Installation (New VM + PHIS)" -ForegroundColor White
    Write-Host "  2. " -NoNewline; Write-Host "Install on Existing VM" -ForegroundColor White
    Write-Host "  3. " -NoNewline; Write-Host "Create Azure VM Only" -ForegroundColor White
    
    Write-Host "`n━━━ Management Options ━━━" -ForegroundColor Yellow
    Write-Host "  4. " -NoNewline; Write-Host "Check Installation Status" -ForegroundColor White
    Write-Host "  5. " -NoNewline; Write-Host "Connect to VM (SSH)" -ForegroundColor White
    Write-Host "  6. " -NoNewline; Write-Host "VM Power Management" -ForegroundColor White
    Write-Host "  7. " -NoNewline; Write-Host "View Service Logs" -ForegroundColor White
    
    Write-Host "`n━━━ Utilities ━━━" -ForegroundColor Yellow
    Write-Host "  8. " -NoNewline; Write-Host "Run Diagnostics" -ForegroundColor White
    Write-Host "  9. " -NoNewline; Write-Host "Generate SSH Key" -ForegroundColor White
    Write-Host " 10. " -NoNewline; Write-Host "Install Azure PowerShell Module" -ForegroundColor White
    Write-Host " 11. " -NoNewline; Write-Host "View Documentation" -ForegroundColor White
    
    Write-Host "`n  0. " -NoNewline; Write-Host "Exit" -ForegroundColor Red
    Write-Host "`n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
}

function Get-VMIPAddress {
    $ip = $null
    
    # Check for saved connection info
    if (Test-Path ".\phis-vm-connection-info.json") {
        $info = Get-Content ".\phis-vm-connection-info.json" | ConvertFrom-Json
        Write-Host "`nFound saved VM information:" -ForegroundColor Green
        Write-Host "  VM Name: $($info.VMName)" -ForegroundColor Gray
        Write-Host "  IP Address: $($info.PublicIP)" -ForegroundColor Gray
        
        $useSaved = Read-Host "`nUse this VM? (Y/n)"
        if ($useSaved -ne 'n') {
            return $info.PublicIP
        }
    }
    
    $ip = Read-Host "`nEnter VM IP address"
    return $ip
}

function Invoke-Installation {
    param([string]$Type)
    
    Write-Host "`n━━━ Starting $Type ━━━" -ForegroundColor Green
    
    switch ($Type) {
        "Full" {
            if (Test-Path ".\Install-PHIS.ps1") {
                & ".\Install-PHIS.ps1" -Action FullInstall
            } else {
                Write-Host "Error: Install-PHIS.ps1 not found!" -ForegroundColor Red
            }
        }
        "ExistingVM" {
            $ip = Get-VMIPAddress
            if ($ip) {
                if (Test-Path ".\Install-PHIS.ps1") {
                    & ".\Install-PHIS.ps1" -Action InstallOnly -UseExistingVM -VMIPAddress $ip
                } else {
                    Write-Host "Error: Install-PHIS.ps1 not found!" -ForegroundColor Red
                }
            }
        }
        "VMOnly" {
            if (Test-Path ".\Install-PHIS.ps1") {
                & ".\Install-PHIS.ps1" -Action VMOnly
            } else {
                Write-Host "Error: Install-PHIS.ps1 not found!" -ForegroundColor Red
            }
        }
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Show-Status {
    Write-Host "`n━━━ Checking Installation Status ━━━" -ForegroundColor Green
    
    $ip = Get-VMIPAddress
    if ($ip) {
        if (Test-Path ".\Install-PHIS.ps1") {
            & ".\Install-PHIS.ps1" -Action Status -VMIPAddress $ip
        } else {
            Write-Host "Error: Install-PHIS.ps1 not found!" -ForegroundColor Red
        }
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Connect-ToVM {
    Write-Host "`n━━━ Connect to VM via SSH ━━━" -ForegroundColor Green
    
    if (Test-Path ".\Manage-AzurePHISVM.ps1") {
        & ".\Manage-AzurePHISVM.ps1" -Action Connect
    } else {
        # Manual connection
        $ip = Get-VMIPAddress
        if ($ip) {
            $keyPath = Read-Host "Enter SSH key path (or press Enter for default)"
            if (-not $keyPath) { $keyPath = "~/.ssh/id_ed25519" }
            
            $sshCmd = "ssh -i `"$keyPath`" azureuser@$ip"
            Write-Host "`nConnecting with: $sshCmd" -ForegroundColor Yellow
            Invoke-Expression $sshCmd
        }
    }
}

function Manage-VMPower {
    Write-Host "`n━━━ VM Power Management ━━━" -ForegroundColor Green
    Write-Host "1. Start VM"
    Write-Host "2. Stop VM (save costs)"
    Write-Host "3. Restart VM"
    Write-Host "0. Back to main menu"
    
    $choice = Read-Host "`nSelect option"
    
    if ($choice -eq "0") { return }
    
    $action = switch ($choice) {
        "1" { "Start" }
        "2" { "Stop" }
        "3" { "Restart" }
        default { $null }
    }
    
    if ($action -and (Test-Path ".\Manage-AzurePHISVM.ps1")) {
        & ".\Manage-AzurePHISVM.ps1" -Action $action
    } else {
        Write-Host "Invalid option or management script not found" -ForegroundColor Red
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Show-Logs {
    Write-Host "`n━━━ Service Logs ━━━" -ForegroundColor Green
    Write-Host "This will connect to the VM and show PHIS logs."
    
    $ip = Get-VMIPAddress
    if ($ip) {
        $keyPath = Read-Host "Enter SSH key path (or press Enter for default)"
        if (-not $keyPath) { $keyPath = "~/.ssh/id_ed25519" }
        
        $sshCmd = "ssh -i `"$keyPath`" azureuser@$ip 'sudo docker logs opensilex-docker-opensilexapp --tail 100 -f'"
        Write-Host "`nFetching logs (Ctrl+C to stop)..." -ForegroundColor Yellow
        Invoke-Expression $sshCmd
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Run-Diagnostics {
    Write-Host "`n━━━ Running Diagnostics ━━━" -ForegroundColor Green
    
    if (Test-Path ".\Test-PHISInstallation.ps1") {
        $ip = Read-Host "Enter VM IP address (or press Enter to skip remote checks)"
        if ($ip) {
            & ".\Test-PHISInstallation.ps1" -VMIPAddress $ip
        } else {
            & ".\Test-PHISInstallation.ps1" -LocalChecksOnly
        }
    } else {
        Write-Host "Diagnostic script not found. Running basic checks..." -ForegroundColor Yellow
        
        # Basic checks
        Write-Host "`nPowerShell Version: $($PSVersionTable.PSVersion)" -ForegroundColor Gray
        
        $azModule = Get-Module -ListAvailable -Name Az
        if ($azModule) {
            Write-Host "Azure Module: Installed (v$($azModule.Version))" -ForegroundColor Green
        } else {
            Write-Host "Azure Module: Not installed" -ForegroundColor Red
        }
        
        $sshExists = Test-Path "~/.ssh/id_*"
        if ($sshExists) {
            Write-Host "SSH Keys: Found" -ForegroundColor Green
        } else {
            Write-Host "SSH Keys: Not found" -ForegroundColor Red
        }
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function New-SSHKeyInteractive {
    Write-Host "`n━━━ Generate SSH Key ━━━" -ForegroundColor Green
    
    if (Test-Path ".\New-SSHKey.ps1") {
        & ".\New-SSHKey.ps1"
    } else {
        Write-Host "SSH key generator script not found. Using ssh-keygen directly..." -ForegroundColor Yellow
        
        $keyType = Read-Host "Key type (ed25519/rsa/ecdsa) [ed25519]"
        if (-not $keyType) { $keyType = "ed25519" }
        
        $keyPath = Read-Host "Key path [~/.ssh/id_$keyType]"
        if (-not $keyPath) { $keyPath = "~/.ssh/id_$keyType" }
        
        $sshCmd = "ssh-keygen -t $keyType -f `"$keyPath`""
        if ($keyType -eq "ed25519") { $sshCmd += " -a 100" }
        
        Write-Host "`nGenerating key..." -ForegroundColor Yellow
        Invoke-Expression $sshCmd
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Install-AzureModule {
    Write-Host "`n━━━ Install Azure PowerShell Module ━━━" -ForegroundColor Green
    
    if (-not $isAdmin) {
        Write-Host "This operation requires administrator privileges." -ForegroundColor Yellow
        Write-Host "Please run this script as Administrator or use:" -ForegroundColor Yellow
        Write-Host "  Install-Module -Name Az -Repository PSGallery -Force -Scope CurrentUser" -ForegroundColor Cyan
    } else {
        Write-Host "Installing Azure PowerShell module..." -ForegroundColor Yellow
        try {
            Install-Module -Name Az -Repository PSGallery -Force -AllowClobber
            Write-Host "Azure module installed successfully!" -ForegroundColor Green
        }
        catch {
            Write-Host "Error installing module: $_" -ForegroundColor Red
        }
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Show-Documentation {
    Write-Host "`n━━━ Documentation ━━━" -ForegroundColor Green
    
    $docs = @(
        "README.md",
        "ORCHESTRATOR-README.md"
    )
    
    $found = $false
    foreach ($doc in $docs) {
        if (Test-Path $doc) {
            Write-Host "`nFound: $doc" -ForegroundColor Yellow
            $view = Read-Host "View this file? (Y/n)"
            if ($view -ne 'n') {
                Get-Content $doc | Out-Host -Paging
            }
            $found = $true
        }
    }
    
    if (-not $found) {
        Write-Host "No documentation files found in current directory." -ForegroundColor Yellow
        Write-Host "`nKey Information:" -ForegroundColor Green
        Write-Host "- Default URL: http://YOUR_VM_IP:28081/phis/app/" -ForegroundColor Gray
        Write-Host "- Default Login: admin@opensilex.org / admin" -ForegroundColor Gray
        Write-Host "- Change password after first login!" -ForegroundColor Yellow
    }
    
    Write-Host "`nPress any key to return to menu..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Main loop
while ($true) {
    Show-Menu
    $choice = Read-Host "`nSelect option (0-11)"
    
    switch ($choice) {
        "1" { Invoke-Installation -Type "Full" }
        "2" { Invoke-Installation -Type "ExistingVM" }
        "3" { Invoke-Installation -Type "VMOnly" }
        "4" { Show-Status }
        "5" { Connect-ToVM }
        "6" { Manage-VMPower }
        "7" { Show-Logs }
        "8" { Run-Diagnostics }
        "9" { New-SSHKeyInteractive }
        "10" { Install-AzureModule }
        "11" { Show-Documentation }
        "0" { 
            Write-Host "`nThank you for using PHIS Installation Manager!" -ForegroundColor Green
            exit 
        }
        default { 
            Write-Host "`nInvalid option. Please select 0-11." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
}