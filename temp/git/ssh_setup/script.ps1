# ----------------------------- Helper Functions -----------------------------

$modulePath = Join-Path $env:SCRIPTS_REPO_PATH "scripts/utils/common.psm1"
if (-not (Test-Path $modulePath)) {
    Write-Error "Error: Common module not found at $modulePath"
    exit 1
}
Import-Module $modulePath -Force

# ------------------------------- Pre Actions -------------------------------

Write-Separator -title "Checking Parameters"
$KeyLabel = if ($args[0]) { $args[0] } else { $null }
$GitHost = if ($args[1]) { $args[1] } else { $null }

Test-Parameter -key "KeyLabel" -value $KeyLabel
Test-Parameter -key "GitHost" -value $GitHost

$SshDir = Join-Path $env:USERPROFILE "\.ssh"
$IdentityFile = Join-Path $SshDir $KeyLabel
$IdentityFileTilde = "~/.ssh/$KeyLabel"
$ConfigFile = Join-Path $SshDir "config"

# ------------------------------- Main Script -------------------------------

Write-Separator -title "Creating .ssh directory if it doesn't exist"

New-Item -Path $SshDir -ItemType Directory -Force | Out-Null
# Set directory permissions to equivalent of 700
$acl = Get-Acl $SshDir
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule($env:USERNAME, "FullControl", "Allow")
$acl.AddAccessRule($rule)
Set-Acl $SshDir $acl

Write-Separator -title "Generating SSH Key"

try {
    ssh-keygen -t ed25519 -f $IdentityFile -N '""'
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to generate SSH key"
        exit 1
    }

    # Set key file permissions to equivalent of 400
    $acl = Get-Acl $IdentityFile
    $acl.SetAccessRuleProtection($true, $false)
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($env:USERNAME, "Read", "Allow")
    $acl.AddAccessRule($rule)
    Set-Acl $IdentityFile $acl

    Write-Separator -title "Adding SSH configuration"

    $ConfigContent = @"

Host $GitHost
    User git
    HostName $GitHost
    PreferredAuthentications publickey
    IdentityFile $IdentityFileTilde
"@

    Add-Content -Path $ConfigFile -Value $ConfigContent
    
    # Set config file permissions to equivalent of 600
    $acl = Get-Acl $ConfigFile
    $acl.SetAccessRuleProtection($true, $false)
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($env:USERNAME, "Read,Write", "Allow")
    $acl.AddAccessRule($rule)
    Set-Acl $ConfigFile $acl

} catch {
    Write-Error "Error during SSH setup: $_"
    exit 1
}

# ------------------------------- Post Actions -------------------------------

Write-Separator -title "SSH key generated successfully"

Write-Host "Please copy and paste this SSH key to your Git hosting service:"
Write-Host ""
Get-Content "${IdentityFile}.pub"
Write-Host ""
