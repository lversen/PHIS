#Requires -Version 5.1
<#
.SYNOPSIS
    Tests and displays information about SSH keys on the system.

.DESCRIPTION
    Helps troubleshoot SSH key issues by showing all keys found and their details.
#>

# Color output functions
function Write-Success { Write-Host $args[0] -ForegroundColor Green }
function Write-Info { Write-Host $args[0] -ForegroundColor Cyan }
function Write-Warning { Write-Host $args[0] -ForegroundColor Yellow }
function Write-Error { Write-Host $args[0] -ForegroundColor Red }

Write-Host "`n====================================" -ForegroundColor Cyan
Write-Host "    SSH Key Diagnostic Tool" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan

# Check SSH directories
$sshPaths = @(
    "$env:USERPROFILE\.ssh",
    "$env:HOMEDRIVE$env:HOMEPATH\.ssh",
    "$HOME\.ssh"
) | Select-Object -Unique

Write-Info "`nChecking SSH directories..."
foreach ($path in $sshPaths) {
    if (Test-Path $path) {
        Write-Success "✓ Found: $path"
        
        # List all files
        $files = Get-ChildItem -Path $path -Force
        Write-Info "  Contents:"
        foreach ($file in $files) {
            $icon = if ($file.PSIsContainer) { "📁" } else { "📄" }
            Write-Host "    $icon $($file.Name)" -ForegroundColor Gray
        }
    } else {
        Write-Warning "✗ Not found: $path"
    }
}

Write-Info "`nSearching for SSH public keys (.pub files)..."
$foundKeys = @()

foreach ($path in $sshPaths | Where-Object { Test-Path $_ }) {
    $pubKeys = Get-ChildItem -Path $path -Filter "*.pub" -ErrorAction SilentlyContinue
    
    foreach ($key in $pubKeys) {
        if ($key.Name -match "known_hosts") { continue }
        
        try {
            $content = Get-Content $key.FullName -Raw -ErrorAction Stop
            
            if ($content -match "^(ssh-rsa|ssh-ed25519|ecdsa-sha2|ssh-dss)") {
                $keyType = $matches[1]
                $keyInfo = [PSCustomObject]@{
                    Name = $key.Name
                    Path = $key.FullName
                    Type = $keyType
                    Size = $key.Length
                    Modified = $key.LastWriteTime
                    Valid = $true
                }
                $foundKeys += $keyInfo
            }
        }
        catch {
            Write-Warning "Could not read: $($key.FullName)"
        }
    }
}

if ($foundKeys.Count -eq 0) {
    Write-Warning "`nNo SSH public keys found!"
    Write-Info "`nTo generate a new SSH key, you can:"
    Write-Host "1. Run: .\New-SSHKey.ps1" -ForegroundColor Yellow
    Write-Host "2. Or run: ssh-keygen -t ed25519 -a 100" -ForegroundColor Yellow
} else {
    Write-Success "`nFound $($foundKeys.Count) SSH public key(s):"
    
    foreach ($key in $foundKeys) {
        Write-Host "`n  Key: $($key.Name)" -ForegroundColor Green
        Write-Host "  Type: $($key.Type)"
        Write-Host "  Path: $($key.Path)"
        Write-Host "  Modified: $($key.Modified)"
        Write-Host "  Size: $($key.Size) bytes"
        
        # Check for corresponding private key
        $privateKeyPath = $key.Path -replace '\.pub$', ''
        if (Test-Path $privateKeyPath) {
            Write-Success "  ✓ Private key exists"
        } else {
            Write-Warning "  ✗ Private key missing!"
        }
    }
}

Write-Info "`nChecking SSH client..."
$sshCommand = Get-Command ssh -ErrorAction SilentlyContinue
if ($sshCommand) {
    Write-Success "✓ SSH client found: $($sshCommand.Source)"
    
    # Get SSH version
    try {
        $sshVersion = & ssh -V 2>&1
        Write-Host "  Version: $sshVersion" -ForegroundColor Gray
    } catch {}
} else {
    Write-Warning "✗ SSH client not found"
}

Write-Host "`n====================================" -ForegroundColor Cyan