# Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Array of programs to install
[string[]] $programs = @(
                "awscli", "ccleaner", "cmake", "cmder", "docker", "dotnet4.7",
                "everything", "git", "git-lfs.install", "gradle", "jdk8", "poshgit",
                "procexp", "python", "r.project", "speccy", "virtualbox", "vlc",
                "visualstudiocode", "windirstat", "winmerge"
            )

# Install packages for development
foreach ($program in $programs) {
    Write-Host "Attempting to install $program..."
    choco install $program -y
    Write-Host "End attempt to install $program..."
}
