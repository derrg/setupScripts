if (-Not(Get-Command "choco" -ErrorAction SilentlyContinue)) {
    # Install Chocolatey
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Reload PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

# Array of programs to install
[string[]] $programs = @(
    "7zip.install", "adobereader", "audacity", "awscli", "bleachbit", "blender", "cpu-z", "cue", "deluge", "dep",
    "docker", "dotnet4.7", "everything", "firefox", "gifcam", "gimp", "git", "git-lfs", "golang", "googlechrome",
    "gradle", "groovy", "hwinfo", "itunes", "jdk11", "jetbrainstoolbox", "k-litecodecpackfull", "kindle", "krita", "kubernetes-cli", "kubernetes-helm"
    "libreoffice", "lmms", "microsoft-windows-terminal", "mingw", "openjdk", "openjdk11", "openssh", "origin",
    "procexp", "python", "quicklook", "r.project", "sharex", "signal", "spotify", "steam", "streamlabs-obs", "sysinternals",
    "telegram", "terraform", "thunderbird", "unity", "visualstudiocode", "vlc", "vscode", "windirstat", "winmerge",
    "winscp", "wireshark", "xmlstartlet"
)
# Install packages for development
foreach ($program in $programs) {
    Write-Host "Attempting to install $program..."
    choco.exe install $program -y
    Write-Host "End attempt to install $program..."
}
