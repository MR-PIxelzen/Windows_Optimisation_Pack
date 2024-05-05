<# made by pix for win10

.NOTES
    Author         : PiXZeN @MR-PIxelzen
    Runspace Author: @DeveloperDurp
    GitHub         : https://github.com/MR-PIxelzen
    Version        : 0.0.21
#>


# Allow powershell scripts from anywhere
Set-ExecutionPolicy unrestricted -Force

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed."
    # Check if Chocolatey is installed, if not, install it
Write-Host "Seems Chocolatey is not installed, installing now"
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop
powershell choco feature enable -n allowGlobalConfirmation
} else {
    Write-Host "Chocolatey is already installed."
}


# Check if Winget is already installed
if (-not (Get-Command "winget" -ErrorAction SilentlyContinue)) {
    # If not installed, proceed with installation
    $repoUrl = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    $latestRelease = Invoke-WebRequest -Uri $repoUrl -UseBasicParsing | ConvertFrom-Json
    $downloadUrl = $latestRelease.assets | Where-Object { $_.name -eq "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" } | Select-Object -ExpandProperty browser_download_url
    $downloadPath = "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    Add-AppxPackage -Path $downloadPath
} else {
    Write-Host "Winget is already installed."
}


#choco install visualstudio2022community

#vcredist.exe /ai
$url = "https://github.com/MR-PIxelzen/Windows_Optimisation_Pack/raw/main/vcredist.exe"
$outputFile = "vcredist.exe"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $outputFile

# Start the process with arguments and wait for it to finish
Start-Process -FilePath $outputFile -ArgumentList "/ai" -Wait

#making argument variables cus im too lazy #

$wingetarg = --Force 

# Install other packages (replace with actual package names if available)
# Thorium AVX
winget install --id Alex313031.Thorium.AVX -y -wait

# Lenovo Legion Toolkit
winget install --id BartoszCichecki.LenovoLegionToolkit --Force

# Install WizTree version 4.16.0
choco install wiztree --version 4.16.0 -y -wait

# Install specific versions of NVIDIA software
choco install nvidia-display-driver --version 546.65 -y -wait
choco install geforce-experience --version 3.27.0.120 -y -wait
choco install geforce-game-ready-driver --version 546.65 -y -wait

# Install SyncTrayzor version 1.1.29
choco install synctrayzor  -y -wait

# Install Playnite version 10.32.0
choco install playnite  -y -wait

# Install Steam version 2.10.91.91221129
choco install steam  -y -wait

# Install Steam Cleaner version 2.4
choco install steam-cleaner  -y -wait

# Install Epic Games Launcher version 1.3.93
choco install epicgameslauncher  -y -wait

# Install uTorrent version 3.5.5.45271
choco install utorrent  -y -wait

# Install Git version 2.43.0
choco install git --version 2.43.0 -y -wait
choco install git.install --version 2.43.0 -y -wait

# Install GitHub Desktop version 3.3.6
choco install github-desktop --version 3.3.6 -y -wait

# Install various versions of Microsoft Visual C++ Redistributable

# Install Lively version 2.0.7.4
choco install lively --version 2.0.7.4 -y -wait

# Install DotPeek version 2023.3.2
choco install dotpeek --version 2023.3.2 -y -wait

# Install DNSpy version 6.1.8
choco install dnspy --version 6.1.8 -y -wait

# Install Cheat Engine version 7.5
choco install cheatengine --version 7.5 -y -wait

# Install WinCheat version 1.7.4680.2
choco install wincheat --version 1.7.4680.2 -y -wait

# Install Discord version 1.0.9005
choco install discord --version 1.0.9005 -y -wait

# Install Cemu version 2.0.20220910
choco install cemu --version 2.0.20220910 -y -wait

# Install WinFetch version 2.5.1
choco install winfetch --version 2.5.1 -y -wait

# Install EarTrumpet version 2.3.0
choco install eartrumpet --version 2.3.0 -y -wait

# Install PowerToys version 0.77.0
choco install powertoys --version 0.77.0 -y -wait

# Install AutoHotkey version 1.1.37.1
choco install autohotkey --version 1.1.37.1 -y -wait
choco install autohotkey-compiler --version 1.0 -y -wait

# Install 7-Zip version 23.1.0
choco install 7zip --version 23.1.0 -y -wait

# Install WinRAR version 6.24
choco install winrar --version 6.24 -y -wait

# Install Everything version 1.4.11024
choco install everything --version 1.4.11024 -y -wait

# Install Bulk Crap Uninstaller version 5.7.0
choco install bulk-crap-uninstaller --version 5.7.0 -y -wait

# Install VB5 Runtime version 5.0
choco install vb5runtime --version 5.0 -y -wait

# Install .NET runtimes for various versions
choco install dotnet-runtime --version 8.0.1 -y -wait
choco install dotnet-5.0-runtime --version 5.0.17 -y -wait
choco install dotnet-6.0-runtime --version 6.0.26 -y -wait
choco install dotnet-7.0-runtime --version 7.0.15 -y -wait
choco install dotnet-8.0-runtime --version 8.0.1 -y -wait
choco install dotnetcore-2.1-runtime --version 2.1.30 -y -wait
choco install dotnetcore-3.0-runtime --version 3.0.3 -y -wait
choco install dotnetcore-2.0-runtime --version 2.0.9 -y -wait
choco install dotnetcore-2.2-runtime --version 2.2.8 -y -wait
choco install dotnetcore-3.1-runtime --version 3.1.32 -y -wait

# Install Malwarebytes version 4.6.0.352
choco install malwarebytes --version 4.6.0.352 -y -wait

# Install JDownloader version 2.0.0.2023
choco install jdownloader --version 2.0.0.2023 -y -wait

# Install VLC version 3.0.20
choco install vlc --version 3.0.20 -y -wait

# Install Razer Synapse 3 version 1.15.0.504
choco install razer-synapse-3 --version 1.15.0.504 -y -wait

# Install PIX version 2310.30.0
choco install pix --version 2310.30.0 -y -wait

# Install DirectX version 9.29.1974.20210222
choco install directx --version 9.29.1974.20210222 -y -wait

# Install CompactGUI version 2.6.2
choco install compactgui --version 2.6.2 -y -wait

# Install ShareX version 15.0.0
choco install sharex --version 15.0.0 -y -wait

# Install OBS Studio version 30.0.2
choco install obs-studio --version 30.0.2 -y -wait