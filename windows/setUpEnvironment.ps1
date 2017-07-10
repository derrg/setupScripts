# Set up Windows development environment
# Author: Ken Van Dalsum <kenvandalsum@gmail.com>
# Last Modified: 7/10/17

# Set the execution policy for the machine to RemoteSigned
Set-ExecutionPolicy RemoteSigned


# Install Chocolatey and desired packages
. ".\installChocolatey.ps1"

# Copy alias file into home directory
Copy-Item ".\aliases.ps1" "$HOME\OneDrive\Documents\WindowsPowerShell\aliases.ps1"

# Add useful aliases to profile
Add-Content $profile.CurrentUserAllHosts "`n# Custom Aliases`n"
Add-Content $profile.CurrentUserAllHosts -Value (Get-Content "$HOME\OneDrive\Documents\WindowsPowerShell\aliases.ps1")

# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
