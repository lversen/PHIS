#Requires -Version 5.1
<#
.SYNOPSIS
    Master orchestrator script for complete PHIS installation on Azure.

.DESCRIPTION
    This script automates the entire PHIS installation process including:
    - Optional Azure VM creation
    - SSH connectivity setup
    - Dependencies installation on VM
    - PHIS/OpenSILEX deployment
    - Service configuration and startup
    
.PARAMETER Action
    The action to perform:
    - FullInstall: Complete installation from scratch (default)
    - VMOnly: Create VM only
    - InstallOnly: Install PHIS on existing VM
    - Status: Check installation status

.PARAMETER VMName
    Name of the VM (default: phis)

.PARAMETER ResourceGroupName
    Name of the resource group (default: RG-PHIS)

.PARAMETER UseExistingVM
    Skip VM creation and use existing VM

.PARAMETER VMIPAddress
    IP address of existing VM (required if UseExistingVM)

.PARAMETER AdminUsername
    SSH username (default: azureuser)

.PARAMETER SSHKeyPath
    Path to SSH private key (auto-detected if not specified)

.PARAMETER SkipDependencies
    Skip dependencies installation

.PARAMETER SkipServiceStart
    Skip starting the PHIS service

.EXAMPLE
    .\Install-PHIS.ps1
    # Full installation with VM creation

.EXAMPLE
    .\Install-PHIS.ps1 -UseExistingVM -VMIPAddress "20.50.100.200"
    # Install on existing VM

.EXAMPLE
    .\Install-PHIS.ps1 -Action Status -VMIPAddress "20.50.100.200"
    # Check status of existing installation
#>

[CmdletBinding()]
param(
    [ValidateSet('FullInstall', 'VMOnly', 'InstallOnly', 'Status')]
    [string]$Action = 'FullInstall',
    
    [string]$VMName = "phis",
    [string]$ResourceGroupName = "RG-PHIS",
    [switch]$UseExistingVM,
    [string]$VMIPAddress,
    [string]$AdminUsername = "azureuser",
    [string]$SSHKeyPath,
    [switch]$SkipDependencies,
    [switch]$SkipServiceStart,
    [string]$Location = "westeurope"
)

# Script configuration
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# File URLs
$DependenciesScriptURL = "https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-dependencies.sh"
$InstallerScriptURL = "https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-installer.sh"
$ManagerScriptURL = "https://raw.githubusercontent.com/lversen/PHIS/main/opensilex-manager.sh"

# Local paths
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ConnectionInfoFile = Join-Path $ScriptDir "phis-vm-connection-info.json"

# Color functions
function Write-ColorOutput {
    param([string]$Message, [ConsoleColor]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

function Write-Success { Write-ColorOutput "✓ $($args[0])" Green }
function Write-Info { Write-ColorOutput "ℹ $($args[0])" Cyan }
function Write-Warning { Write-ColorOutput "⚠ $($args[0])" Yellow }
function Write-Error { Write-ColorOutput "✗ $($args[0])" Red }
function Write-Step { 
    Write-Host "`n" -NoNewline
    Write-ColorOutput "▶ $($args[0])" Magenta 
}

# Function to display banner
function Show-Banner {
    Clear-Host
    Write-Host @"

    ╔═══════════════════════════════════════════════════════════════╗
    ║                 PHIS Installation Orchestrator                 ║
    ║                                                                ║
    ║  Automated deployment of PHIS using OpenSILEX on Azure        ║
    ╚═══════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan
}

# Function to find SSH key
function Find-SSHKey {
    param([string]$ProvidedPath)
    
    if ($ProvidedPath -and (Test-Path $ProvidedPath)) {
        return $ProvidedPath
    }
    
    # Common SSH key locations
    $sshPaths = @(
        "$env:USERPROFILE\.ssh\id_ed25519",
        "$env:USERPROFILE\.ssh\id_rsa",
        "$env:USERPROFILE\.ssh\id_ecdsa",
        "$HOME/.ssh/id_ed25519",
        "$HOME/.ssh/id_rsa",
        "$HOME/.ssh/id_ecdsa"
    )
    
    foreach ($path in $sshPaths) {
        if (Test-Path $path) {
            Write-Info "Found SSH key: $path"
            return $path
        }
    }
    
    Write-Error "No SSH key found. Please generate one with ssh-keygen or specify with -SSHKeyPath"
    return $null
}

# Function to test SSH connection
function Test-SSHConnection {
    param(
        [string]$IPAddress,
        [string]$Username,
        [string]$KeyPath
    )
    
    Write-Info "Testing SSH connection to $IPAddress..."
    
    $sshCmd = "ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 -i `"$KeyPath`" $Username@$IPAddress 'echo CONNECTION_SUCCESS'"
    
    try {
        $result = Invoke-Expression $sshCmd 2>&1
        if ($result -match "CONNECTION_SUCCESS") {
            Write-Success "SSH connection successful"
            return $true
        }
    }
    catch {
        Write-Warning "SSH connection failed: $_"
    }
    
    return $false
}

# Function to execute command via SSH
function Invoke-SSHCommand {
    param(
        [string]$IPAddress,
        [string]$Username,
        [string]$KeyPath,
        [string]$Command,
        [switch]$ShowOutput = $true
    )
    
    $sshCmd = "ssh -o StrictHostKeyChecking=no -i `"$KeyPath`" $Username@$IPAddress '$Command'"
    
    if ($ShowOutput) {
        Invoke-Expression $sshCmd
    }
    else {
        $result = Invoke-Expression $sshCmd 2>&1
        return $result
    }
}

# Function to copy file via SCP
function Copy-FileToVM {
    param(
        [string]$IPAddress,
        [string]$Username,
        [string]$KeyPath,
        [string]$LocalPath,
        [string]$RemotePath
    )
    
    $scpCmd = "scp -o StrictHostKeyChecking=no -i `"$KeyPath`" `"$LocalPath`" $Username@${IPAddress}:$RemotePath"
    
    try {
        Invoke-Expression $scpCmd 2>&1 | Out-Null
        return $true
    }
    catch {
        Write-Warning "Failed to copy file: $_"
        return $false
    }
}

# Function to create VM
function New-PHISVM {
    Write-Step "Creating Azure VM"
    
    # Check if deployment script exists
    $deployScript = Join-Path $ScriptDir "Deploy-AzurePHISVM.ps1"
    if (-not (Test-Path $deployScript)) {
        Write-Error "Deploy-AzurePHISVM.ps1 not found in current directory"
        return $null
    }
    
    # Run deployment script
    try {
        & $deployScript -VMName $VMName -ResourceGroupName $ResourceGroupName -Location $Location
        
        # Read connection info
        if (Test-Path $ConnectionInfoFile) {
            $connInfo = Get-Content $ConnectionInfoFile | ConvertFrom-Json
            return $connInfo
        }
    }
    catch {
        Write-Error "VM deployment failed: $_"
        return $null
    }
}

# Function to get existing VM info
function Get-ExistingVMInfo {
    param([string]$IPAddress)
    
    if (-not $IPAddress -and (Test-Path $ConnectionInfoFile)) {
        Write-Info "Loading connection info from previous deployment..."
        $connInfo = Get-Content $ConnectionInfoFile | ConvertFrom-Json
        return $connInfo
    }
    elseif ($IPAddress) {
        return @{
            PublicIP = $IPAddress
            AdminUsername = $AdminUsername
            VMName = $VMName
            ResourceGroupName = $ResourceGroupName
        }
    }
    
    Write-Error "No VM IP address provided and no saved connection info found"
    return $null
}

# Function to install dependencies
function Install-Dependencies {
    param($ConnectionInfo, [string]$KeyPath)
    
    Write-Step "Installing system dependencies"
    
    Write-Info "Downloading dependencies script..."
    $cmd = "wget -q -O ~/openSILEX-dependencies.sh '$DependenciesScriptURL' && chmod +x ~/openSILEX-dependencies.sh"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $cmd -ShowOutput:$false
    
    Write-Info "Running dependencies installation (this may take several minutes)..."
    Write-Warning "You will see installation progress below:"
    
    # Run installation script
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command "./openSILEX-dependencies.sh"
    
    Write-Success "Dependencies installed"
    
    # Note about Docker group
    Write-Warning @"
Docker group changes require re-login. The script will handle this automatically.
If you encounter permission issues later, manually logout and login to the VM.
"@
}

# Function to install PHIS
function Install-PHIS {
    param($ConnectionInfo, [string]$KeyPath)
    
    Write-Step "Installing PHIS/OpenSILEX"
    
    Write-Info "Downloading PHIS installer script..."
    $cmd = "wget -q -O ~/openSILEX-installer.sh '$InstallerScriptURL' && chmod +x ~/openSILEX-installer.sh"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $cmd -ShowOutput:$false
    
    Write-Info "Downloading service manager script..."
    $cmd = "wget -q -O ~/opensilex-manager.sh '$ManagerScriptURL' && chmod +x ~/opensilex-manager.sh"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $cmd -ShowOutput:$false
    
    Write-Info "Running PHIS installation (this will take several minutes)..."
    Write-Warning "Installation progress will be shown below:"
    
    # Run with sudo to ensure Docker permissions work
    $installCmd = "sudo -E bash -c 'cd ~ && ./openSILEX-installer.sh'"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $installCmd
    
    Write-Success "PHIS installation completed"
}

# Function to check installation status
function Get-InstallationStatus {
    param($ConnectionInfo, [string]$KeyPath)
    
    Write-Step "Checking PHIS installation status"
    
    # Check Docker containers
    Write-Info "Docker containers status:"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command "sudo docker ps -a --format 'table {{.Names}}\t{{.Status}}'"
    
    # Check if PHIS is accessible
    Write-Info "`nChecking PHIS web interface..."
    $checkCmd = "curl -s -o /dev/null -w '%{http_code}' http://localhost:28081/phis/app/ || echo 'Failed'"
    $result = Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                                -KeyPath $KeyPath -Command $checkCmd -ShowOutput:$false
    
    if ($result -eq "200") {
        Write-Success "PHIS web interface is accessible"
    }
    else {
        Write-Warning "PHIS web interface is not responding (HTTP code: $result)"
    }
    
    # Display access information
    Write-Info "`nAccess Information:"
    Write-Host "  Web Interface: " -NoNewline
    Write-Host "http://$($ConnectionInfo.PublicIP):28081/phis/app/" -ForegroundColor Green
    Write-Host "  API Documentation: " -NoNewline
    Write-Host "http://$($ConnectionInfo.PublicIP):28081/phis/swagger-ui.html" -ForegroundColor Green
    Write-Host "  API Endpoint: " -NoNewline
    Write-Host "http://$($ConnectionInfo.PublicIP):28081/phis/rest" -ForegroundColor Green
    
    Write-Info "`nDefault Credentials:"
    Write-Host "  Username: " -NoNewline
    Write-Host "admin@opensilex.org" -ForegroundColor Yellow
    Write-Host "  Password: " -NoNewline
    Write-Host "admin" -ForegroundColor Yellow
    
    Write-Warning "`nIMPORTANT: Change the default password after first login!"
}

# Function to display next steps
function Show-NextSteps {
    param($ConnectionInfo)
    
    Write-Host "`n"
    Write-ColorOutput "═══════════════════════════════════════════════════════════════" Blue
    Write-ColorOutput "                    Installation Complete!                      " Green
    Write-ColorOutput "═══════════════════════════════════════════════════════════════" Blue
    
    Write-Info "`nNext Steps:"
    Write-Host "1. Access PHIS at: " -NoNewline
    Write-Host "http://$($ConnectionInfo.PublicIP):28081/phis/app/" -ForegroundColor Green
    
    Write-Host "2. Login with default credentials and change password immediately"
    
    Write-Host "3. SSH to VM for management: " -NoNewline
    Write-Host "ssh -i ~/.ssh/id_ed25519 $($ConnectionInfo.AdminUsername)@$($ConnectionInfo.PublicIP)" -ForegroundColor Yellow
    
    Write-Host "4. Manage service with: " -NoNewline
    Write-Host "./opensilex-manager.sh [start|stop|restart|status|logs]" -ForegroundColor Yellow
    
    Write-Info "`nUseful Commands:"
    Write-Host "  - Check status: " -NoNewline
    Write-Host ".\Install-PHIS.ps1 -Action Status" -ForegroundColor Gray
    Write-Host "  - View logs: " -NoNewline
    Write-Host ".\Manage-AzurePHISVM.ps1 -Action Connect" -ForegroundColor Gray
    Write-Host "  - Stop VM: " -NoNewline
    Write-Host ".\Manage-AzurePHISVM.ps1 -Action Stop" -ForegroundColor Gray
    
    Write-Info "`nDocumentation:"
    Write-Host "  - README.md in current directory"
    Write-Host "  - OpenSILEX docs: https://opensilex.github.io/"
}

# Main execution
function Main {
    Show-Banner
    
    # Validate parameters
    if ($UseExistingVM -and -not $VMIPAddress -and -not (Test-Path $ConnectionInfoFile)) {
        Write-Error "VMIPAddress is required when using existing VM"
        return
    }
    
    # Find SSH key
    $sshKey = Find-SSHKey -ProvidedPath $SSHKeyPath
    if (-not $sshKey) {
        return
    }
    
    # Get or create VM connection info
    $connectionInfo = $null
    
    switch ($Action) {
        'Status' {
            $connectionInfo = Get-ExistingVMInfo -IPAddress $VMIPAddress
            if ($connectionInfo) {
                Get-InstallationStatus -ConnectionInfo $connectionInfo -KeyPath $sshKey
            }
            return
        }
        
        'VMOnly' {
            $connectionInfo = New-PHISVM
            if ($connectionInfo) {
                Write-Success "VM created successfully"
                Get-InstallationStatus -ConnectionInfo $connectionInfo -KeyPath $sshKey
            }
            return
        }
        
        'InstallOnly' {
            $UseExistingVM = $true
        }
    }
    
    # Full installation flow
    if (-not $UseExistingVM) {
        $connectionInfo = New-PHISVM
        if (-not $connectionInfo) {
            Write-Error "VM creation failed. Exiting."
            return
        }
        
        # Wait for VM to be fully ready
        Write-Info "Waiting for VM to be fully ready..."
        Start-Sleep -Seconds 30
    }
    else {
        $connectionInfo = Get-ExistingVMInfo -IPAddress $VMIPAddress
    }
    
    if (-not $connectionInfo) {
        Write-Error "No VM connection information available"
        return
    }
    
    # Test SSH connection
    $retries = 5
    while ($retries -gt 0) {
        if (Test-SSHConnection -IPAddress $connectionInfo.PublicIP `
                              -Username $connectionInfo.AdminUsername `
                              -KeyPath $sshKey) {
            break
        }
        $retries--
        if ($retries -gt 0) {
            Write-Warning "SSH connection failed. Retrying in 10 seconds... ($retries attempts left)"
            Start-Sleep -Seconds 10
        }
        else {
            Write-Error "Could not establish SSH connection to VM"
            return
        }
    }
    
    # Install dependencies
    if (-not $SkipDependencies) {
        Install-Dependencies -ConnectionInfo $connectionInfo -KeyPath $sshKey
    }
    
    # Install PHIS
    Install-PHIS -ConnectionInfo $connectionInfo -KeyPath $sshKey
    
    # Check final status
    Get-InstallationStatus -ConnectionInfo $connectionInfo -KeyPath $sshKey
    
    # Show completion message
    Show-NextSteps -ConnectionInfo $connectionInfo
}

# Execute main function
Main