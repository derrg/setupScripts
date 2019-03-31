if (-Not(Get-Command "choco" -ErrorAction SilentlyContinue)) {
    # Install Chocolatey
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Reload PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

# Array of programs to install
[string[]] $programs = @(
    "7zip.install", "adobereader", "audacity", "awscli", "blender", "ccleaner", "cmder", "cpu-z", "cue", "deluge",
    "dep", "docker", "dotnet4.7", "everything", "firefox", "gifcam", "gimp", "git", "git-lfs", "golang",
    "googlechrome", "gradle", "hexchat", "inkscape", "jdk11", "jdk8", "jetbrainstoolbox", "k-litecodecpackfull", "kindle", "krita",
    "libreoffice", "lmms", "mingw", "obs-studio", "openjdk", "openjdk11", "openssh", "origin", "poshgit", "postman",
    "procexp", "python", "quicklook", "r.project", "sharex", "signal", "speccy", "spotify", "steam", "sysinternals",
    "telegram", "teracopy", "terraform", "thunderbird", "unity", "visualstudiocode", "vlc", "vscode", "windirstat", "winmerge",
    "winscp", "wireshark"
)
# Install packages for development
foreach ($program in $programs) {
    Write-Host "Attempting to install $program..."
    choco.exe install $program -y
    Write-Host "End attempt to install $program..."
}
