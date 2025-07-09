#Requires -Version 5.1
<#
.SYNOPSIS
    Deploys a PHIS VM to Azure using the ARM template with automatic SSH key detection.

.DESCRIPTION
    This script automatically searches for SSH keys, validates Azure connectivity,
    and deploys the PHIS VM using the provided ARM template.

.PARAMETER ResourceGroupName
    The name of the resource group (default: RG-PHIS)

.PARAMETER VMName
    The name of the virtual machine (default: phis)

.PARAMETER AdminUsername
    The admin username for the VM (default: azureuser)

.PARAMETER Location
    Azure region for deployment (default: westeurope)

.PARAMETER TemplateFile
    Path to the ARM template file (default: template-vm.json)

.PARAMETER SkipPrerequisiteCheck
    Skip checking for Azure PowerShell module

.PARAMETER DebugSSHKeys
    Show detailed SSH key search information

.EXAMPLE
    .\Deploy-AzurePHISVM.ps1
    
.EXAMPLE
    .\Deploy-AzurePHISVM.ps1 -VMName "phis-dev" -ResourceGroupName "RG-PHIS-DEV"

.EXAMPLE
    .\Deploy-AzurePHISVM.ps1 -DebugSSHKeys
#>

[CmdletBinding()]
param(
    [string]$ResourceGroupName = "RG-PHIS",
    [string]$VMName = "phis",
    [string]$AdminUsername = "azureuser",
    [string]$Location = "westeurope",
    [string]$TemplateFile = "template-vm.json",
    [switch]$SkipPrerequisiteCheck,
    [switch]$DebugSSHKeys
)

# Script configuration
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# Color functions for output
function Write-ColorOutput {
    param([string]$Message, [ConsoleColor]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

function Write-Success { Write-ColorOutput $args[0] Green }
function Write-Info { Write-ColorOutput $args[0] Cyan }
function Write-Warning { Write-ColorOutput $args[0] Yellow }
function Write-Error { Write-ColorOutput $args[0] Red }

# Function to find SSH keys
function Find-SSHKeys {
    Write-Info "`nSearching for SSH public keys..."
    
    $sshPaths = @(
        "$env:USERPROFILE\.ssh",
        "$env:HOMEDRIVE$env:HOMEPATH\.ssh",
        "$HOME\.ssh"
    )
    
    $foundKeys = @()
    
    foreach ($path in $sshPaths | Where-Object { Test-Path $_ }) {
        if ($DebugSSHKeys) {
            Write-Info "Searching in: $path"
        }
        
        # Only search for .pub files
        $pubKeys = Get-ChildItem -Path $path -Filter "*.pub" -ErrorAction SilentlyContinue
        
        if ($DebugSSHKeys -and $pubKeys) {
            Write-Info "Found files: $($pubKeys.Name -join ', ')"
        }
        
        foreach ($key in $pubKeys) {
            # Skip known_hosts files
            if ($key.Name -match "known_hosts") { 
                if ($DebugSSHKeys) {
                    Write-Info "Skipping: $($key.Name)"
                }
                continue 
            }
            
            try {
                $keyContent = Get-Content $key.FullName -Raw -ErrorAction Stop
                
                # Validate it's a valid SSH public key
                if ($keyContent -match "^(ssh-rsa|ssh-ed25519|ecdsa-sha2|ssh-dss)") {
                    # Determine key type from content
                    $keyType = switch -Regex ($keyContent) {
                        "^ssh-ed25519" { "ED25519" }
                        "^ssh-rsa" { "RSA" }
                        "^ecdsa-sha2" { "ECDSA" }
                        "^ssh-dss" { "DSA" }
                        default { "Unknown" }
                    }
                    
                    $foundKeys += [PSCustomObject]@{
                        Path = $key.FullName
                        Type = $keyType
                        Content = $keyContent.Trim()
                        Name = $key.Name
                    }
                    
                    if ($DebugSSHKeys) {
                        Write-Info "Added key: $($key.Name) (Type: $keyType)"
                    }
                }
            }
            catch {
                Write-Warning "Could not read key file: $($key.FullName)"
            }
        }
    }
    
    # Remove duplicates based on content
    $uniqueKeys = $foundKeys | Group-Object -Property Content | ForEach-Object { $_.Group[0] }
    
    if ($DebugSSHKeys) {
        Write-Info "Total unique keys found: $($uniqueKeys.Count)"
    }
    
    return $uniqueKeys
}

# Function to select SSH key
function Select-SSHKey {
    param($Keys)
    
    if ($Keys.Count -eq 0) {
        Write-Error "No SSH public keys found! Please generate an SSH key first."
        Write-Info "To generate a new SSH key, run:"
        Write-Info "  ssh-keygen -t ed25519 -a 100"
        exit 1
    }
    
    if ($Keys.Count -eq 1) {
        Write-Success "Found 1 SSH public key: $($Keys[0].Path)"
        Write-Info "Key type: $($Keys[0].Type)"
        return $Keys[0]
    }
    
    Write-Info "Found $($Keys.Count) SSH public keys:"
    for ($i = 0; $i -lt $Keys.Count; $i++) {
        Write-Host "[$($i+1)] $($Keys[$i].Name) (Type: $($Keys[$i].Type))"
        Write-Host "    Path: $($Keys[$i].Path)" -ForegroundColor Gray
    }
    
    do {
        $selection = Read-Host "`nSelect key number (1-$($Keys.Count))"
        try {
            $index = [int]$selection - 1
            $valid = $index -ge 0 -and $index -lt $Keys.Count
        } catch {
            $valid = $false
        }
    } while (-not $valid)
    
    return $Keys[$index]
}

# Function to check prerequisites
function Test-Prerequisites {
    Write-Info "Checking prerequisites..."
    
    # Check for Azure PowerShell module
    if (-not (Get-Module -ListAvailable -Name Az)) {
        Write-Error "Azure PowerShell module not found!"
        Write-Info "To install, run as Administrator:"
        Write-Info "  Install-Module -Name Az -Repository PSGallery -Force"
        Write-Info ""
        Write-Info "Or use Azure CLI instead. Installation instructions:"
        Write-Info "  https://docs.microsoft.com/en-us/cli/azure/install-azure-cli"
        exit 1
    }
    
    # Check template file
    if (-not (Test-Path $TemplateFile)) {
        Write-Error "Template file not found: $TemplateFile"
        Write-Info "Please ensure template-vm.json is in the current directory"
        exit 1
    }
    
    Write-Success "Prerequisites check passed"
}

# Function to ensure Azure connection
function Connect-AzureAccount {
    Write-Info "`nChecking Azure connection..."
    
    try {
        $context = Get-AzContext
        if ($null -eq $context) {
            Write-Info "Not connected to Azure. Initiating login..."
            Connect-AzAccount
        } else {
            Write-Success "Connected to Azure as: $($context.Account)"
            Write-Info "Subscription: $($context.Subscription.Name)"
            
            $confirm = Read-Host "`nContinue with this subscription? (Y/N)"
            if ($confirm -ne 'Y') {
                Write-Info "Please select subscription:"
                $subscriptions = Get-AzSubscription
                $subscriptions | Format-Table -Property Name, Id, State
                $subId = Read-Host "Enter Subscription ID"
                Set-AzContext -SubscriptionId $subId
            }
        }
    }
    catch {
        Write-Error "Failed to connect to Azure: $_"
        exit 1
    }
}

# Function to create resource group
function New-ResourceGroupIfNotExists {
    param($Name, $Location)
    
    Write-Info "`nChecking resource group..."
    $rg = Get-AzResourceGroup -Name $Name -ErrorAction SilentlyContinue
    
    if ($null -eq $rg) {
        Write-Info "Creating resource group: $Name in $Location"
        New-AzResourceGroup -Name $Name -Location $Location | Out-Null
        Write-Success "Resource group created"
    } else {
        Write-Success "Resource group exists: $Name"
    }
}

# Function to validate deployment
function Test-Deployment {
    param($ResourceGroupName, $TemplateFile, $Parameters)
    
    Write-Info "`nValidating deployment template..."
    
    try {
        $validation = Test-AzResourceGroupDeployment `
            -ResourceGroupName $ResourceGroupName `
            -TemplateFile $TemplateFile `
            -TemplateParameterObject $Parameters
        
        if ($validation) {
            Write-Error "Template validation failed:"
            $validation | Format-List
            return $false
        }
        
        Write-Success "Template validation passed"
        return $true
    }
    catch {
        Write-Error "Template validation error: $_"
        return $false
    }
}

# Main script execution
function Main {
    Write-Host "`n====================================" -ForegroundColor Cyan
    Write-Host "    Azure PHIS VM Deployment" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan
    
    # Check prerequisites
    if (-not $SkipPrerequisiteCheck) {
        Test-Prerequisites
    }
    
    # Find and select SSH key
    $sshKeys = Find-SSHKeys
    $selectedKey = Select-SSHKey -Keys $sshKeys
    Write-Success "Using SSH key: $($selectedKey.Name)"
    
    # Connect to Azure
    Connect-AzureAccount
    
    # Create resource group
    New-ResourceGroupIfNotExists -Name $ResourceGroupName -Location $Location
    
    # Check for existing VM
    Write-Info "`nChecking for existing VM..."
    $existingVM = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -ErrorAction SilentlyContinue
    
    if ($existingVM) {
        Write-Warning "VM '$VMName' already exists!"
        $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip" -ErrorAction SilentlyContinue).IpAddress
        
        if ($publicIP) {
            Write-Success "Existing VM Public IP: $publicIP"
            Write-Info "You can connect using: ssh $AdminUsername@$publicIP"
        }
        
        Write-Warning "`nCannot redeploy over existing VM with different SSH keys."
        Write-Info "Options:"
        Write-Host "1. Use the existing VM"
        Write-Host "2. Delete existing VM first: .\Manage-AzurePHISVM.ps1 -Action Delete"
        Write-Host "3. Use a different name: .\Deploy-AzurePHISVM.ps1 -VMName 'phis-new'"
        exit 1
    }
    
    # Prepare deployment parameters
    $deploymentParams = @{
        vmName = $VMName
        adminUsername = $AdminUsername
        sshPublicKey = $selectedKey.Content
    }
    
    Write-Info "`nDeployment parameters:"
    Write-Host "  VM Name: $VMName"
    Write-Host "  Admin Username: $AdminUsername"
    Write-Host "  Resource Group: $ResourceGroupName"
    Write-Host "  Location: $Location"
    Write-Host "  SSH Key: $($selectedKey.Name)"
    
    # Validate deployment
    if (-not (Test-Deployment -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -Parameters $deploymentParams)) {
        exit 1
    }
    
    # Confirm deployment
    Write-Warning "`nThis will create Azure resources that may incur costs."
    $confirm = Read-Host "Proceed with deployment? (Y/N)"
    if ($confirm -ne 'Y') {
        Write-Info "Deployment cancelled"
        exit 0
    }
    
    # Deploy template
    Write-Info "`nDeploying VM (this may take 5-10 minutes)..."
    $deploymentName = "phis-deployment-$(Get-Date -Format 'yyyyMMddHHmmss')"
    
    try {
        $deployment = New-AzResourceGroupDeployment `
            -Name $deploymentName `
            -ResourceGroupName $ResourceGroupName `
            -TemplateFile $TemplateFile `
            -TemplateParameterObject $deploymentParams `
            -Verbose
        
        if ($deployment.ProvisioningState -eq "Succeeded") {
            Write-Success "`nDeployment completed successfully!"
            
            # Get public IP
            $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip").IpAddress
            
            Write-Host "`n====================================" -ForegroundColor Green
            Write-Host "    Deployment Summary" -ForegroundColor Green
            Write-Host "====================================" -ForegroundColor Green
            Write-Host "VM Name: $VMName"
            Write-Host "Resource Group: $ResourceGroupName"
            Write-Host "Public IP: $publicIP"
            Write-Host "SSH Command: ssh -i $($selectedKey.Path -replace '\.pub$','') $AdminUsername@$publicIP"
            Write-Host ""
            Write-Host "Next steps:"
            Write-Host "1. Connect to VM: ssh $AdminUsername@$publicIP"
            Write-Host "2. Run dependency installer: ./openSILEX-dependencies.sh"
            Write-Host "3. Run PHIS installer: ./openSILEX-installer.sh"
            Write-Host "====================================" -ForegroundColor Green
            
            # Save connection info
            $connectionInfo = @{
                VMName = $VMName
                ResourceGroup = $ResourceGroupName
                PublicIP = $publicIP
                AdminUsername = $AdminUsername
                SSHKeyPath = $selectedKey.Path -replace '\.pub$',''
                DeploymentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            }
            
            $connectionInfo | ConvertTo-Json | Out-File "phis-vm-connection-info.json"
            Write-Info "`nConnection info saved to: phis-vm-connection-info.json"
        }
        else {
            Write-Error "Deployment failed: $($deployment.ProvisioningState)"
            exit 1
        }
    }
    catch {
        Write-Error "Deployment error: $_"
        Write-Info "`nCheck deployment details in Azure Portal"
        exit 1
    }
}

# Run main function
Main