#Requires -Version 5.1
<#
.SYNOPSIS
    Manages the PHIS Azure VM with various utility functions.

.DESCRIPTION
    Provides utilities to connect, check status, start/stop, and manage the PHIS VM.

.PARAMETER Action
    The action to perform: Connect, Status, Start, Stop, Restart, Delete, ShowInfo

.PARAMETER ResourceGroupName
    The name of the resource group (default: RG-PHIS)

.PARAMETER VMName
    The name of the virtual machine (default: phis)

.EXAMPLE
    .\Manage-AzurePHISVM.ps1 -Action Connect
    
.EXAMPLE
    .\Manage-AzurePHISVM.ps1 -Action Status
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("Connect", "Status", "Start", "Stop", "Restart", "Delete", "ShowInfo", "GetIP", "OpenPorts")]
    [string]$Action = "ShowInfo",
    
    [string]$ResourceGroupName = "RG-PHIS",
    [string]$VMName = "phis"
)

$ErrorActionPreference = "Stop"

# Color output functions
function Write-Success { Write-Host $args[0] -ForegroundColor Green }
function Write-Info { Write-Host $args[0] -ForegroundColor Cyan }
function Write-Warning { Write-Host $args[0] -ForegroundColor Yellow }
function Write-Error { Write-Host $args[0] -ForegroundColor Red }

# Load connection info if exists
function Get-ConnectionInfo {
    $infoFile = "phis-vm-connection-info.json"
    if (Test-Path $infoFile) {
        $info = Get-Content $infoFile | ConvertFrom-Json
        return $info
    }
    return $null
}

# Ensure Azure connection
function Ensure-AzureConnection {
    $context = Get-AzContext
    if ($null -eq $context) {
        Write-Info "Connecting to Azure..."
        Connect-AzAccount
    }
}

# Get VM status
function Get-VMStatus {
    Ensure-AzureConnection
    
    Write-Info "Checking VM status..."
    try {
        $vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Status
        $powerState = ($vm.Statuses | Where-Object { $_.Code -like "PowerState/*" }).DisplayStatus
        
        Write-Info "VM Name: $VMName"
        Write-Info "Resource Group: $ResourceGroupName"
        Write-Info "Power State: $powerState"
        Write-Info "Location: $($vm.Location)"
        Write-Info "Size: $($vm.HardwareProfile.VmSize)"
        
        # Get public IP
        $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip" -ErrorAction SilentlyContinue).IpAddress
        if ($publicIP) {
            Write-Info "Public IP: $publicIP"
        }
        
        return $powerState
    }
    catch {
        Write-Error "Failed to get VM status: $_"
    }
}

# Connect to VM
function Connect-VM {
    $info = Get-ConnectionInfo
    
    if ($null -eq $info) {
        Write-Warning "No connection info found. Getting current VM details..."
        Ensure-AzureConnection
        $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip").IpAddress
        $adminUsername = "azureuser"
    } else {
        $publicIP = $info.PublicIP
        $adminUsername = $info.AdminUsername
    }
    
    Write-Info "Connecting to VM at $publicIP..."
    
    # Find SSH key
    $sshKeyPaths = @(
        "$env:USERPROFILE\.ssh\id_ed25519",
        "$env:USERPROFILE\.ssh\id_rsa",
        "$HOME\.ssh\id_ed25519",
        "$HOME\.ssh\id_rsa"
    )
    
    $sshKey = $sshKeyPaths | Where-Object { Test-Path $_ } | Select-Object -First 1
    
    if ($sshKey) {
        Write-Info "Using SSH key: $sshKey"
        $sshCommand = "ssh -i `"$sshKey`" $adminUsername@$publicIP"
    } else {
        $sshCommand = "ssh $adminUsername@$publicIP"
    }
    
    Write-Success "Executing: $sshCommand"
    Invoke-Expression $sshCommand
}

# Start VM
function Start-VM {
    Ensure-AzureConnection
    Write-Info "Starting VM..."
    
    try {
        Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
        Write-Success "VM started successfully"
    }
    catch {
        Write-Error "Failed to start VM: $_"
    }
}

# Stop VM
function Stop-VM {
    Ensure-AzureConnection
    Write-Warning "This will deallocate the VM to save costs."
    $confirm = Read-Host "Continue? (Y/N)"
    
    if ($confirm -eq 'Y') {
        Write-Info "Stopping VM..."
        try {
            Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Force
            Write-Success "VM stopped successfully"
        }
        catch {
            Write-Error "Failed to stop VM: $_"
        }
    }
}

# Restart VM
function Restart-VM {
    Ensure-AzureConnection
    Write-Info "Restarting VM..."
    
    try {
        Restart-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
        Write-Success "VM restarted successfully"
    }
    catch {
        Write-Error "Failed to restart VM: $_"
    }
}

# Delete VM and resources
function Remove-VMAndResources {
    Ensure-AzureConnection
    Write-Warning "This will permanently delete the VM and all associated resources!"
    Write-Warning "Resource Group: $ResourceGroupName"
    $confirm = Read-Host "Type 'DELETE' to confirm"
    
    if ($confirm -eq 'DELETE') {
        Write-Info "Deleting resource group and all resources..."
        try {
            Remove-AzResourceGroup -Name $ResourceGroupName -Force
            Write-Success "Resources deleted successfully"
            
            # Remove connection info file
            if (Test-Path "phis-vm-connection-info.json") {
                Remove-Item "phis-vm-connection-info.json"
            }
        }
        catch {
            Write-Error "Failed to delete resources: $_"
        }
    } else {
        Write-Info "Deletion cancelled"
    }
}

# Get public IP
function Get-PublicIP {
    Ensure-AzureConnection
    try {
        $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip").IpAddress
        Write-Success "Public IP: $publicIP"
        return $publicIP
    }
    catch {
        Write-Error "Failed to get public IP: $_"
    }
}

# Show port configuration
function Show-OpenPorts {
    Ensure-AzureConnection
    Write-Info "Checking Network Security Group rules..."
    
    try {
        $nsg = Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName -Name "$VMName-nsg"
        
        Write-Info "`nInbound Security Rules:"
        $nsg.SecurityRules | Where-Object { $_.Direction -eq "Inbound" } | 
            Sort-Object Priority |
            Format-Table -Property Name, Priority, SourceAddressPrefix, DestinationPortRange, Access -AutoSize
    }
    catch {
        Write-Error "Failed to get NSG rules: $_"
    }
}

# Show all info
function Show-AllInfo {
    Write-Host "`n====================================" -ForegroundColor Cyan
    Write-Host "    PHIS VM Information" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan
    
    $info = Get-ConnectionInfo
    if ($info) {
        Write-Info "Cached connection info:"
        Write-Host "  VM Name: $($info.VMName)"
        Write-Host "  Resource Group: $($info.ResourceGroup)"
        Write-Host "  Admin Username: $($info.AdminUsername)"
        Write-Host "  Deployment Time: $($info.DeploymentTime)"
        Write-Host ""
    }
    
    Get-VMStatus
    Write-Host ""
    
    Write-Info "Available actions:"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action Connect     # SSH to VM"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action Status      # Check VM status"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action Start       # Start VM"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action Stop        # Stop VM (save costs)"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action Restart     # Restart VM"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action GetIP       # Get public IP"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action OpenPorts   # Show open ports"
    Write-Host "  .\Manage-AzurePHISVM.ps1 -Action Delete      # Delete all resources"
    Write-Host "====================================" -ForegroundColor Cyan
}

# Main execution
switch ($Action) {
    "Connect"   { Connect-VM }
    "Status"    { Get-VMStatus }
    "Start"     { Start-VM }
    "Stop"      { Stop-VM }
    "Restart"   { Restart-VM }
    "Delete"    { Remove-VMAndResources }
    "GetIP"     { Get-PublicIP }
    "OpenPorts" { Show-OpenPorts }
    "ShowInfo"  { Show-AllInfo }
}