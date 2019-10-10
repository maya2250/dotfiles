Set-Location $PSScriptRoot

Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

if (-Not (Get-Command git -ErrorAction SilentlyContinue)) {
    choco install -y git
    refreshenv
}

if (-Not (git rev-parse --git-dir 2>&1 | Out-Null)) {
    git clone https://github.com/maya2250/dotfiles $Env:HOMEPATH\.dotfiles
    Set-Location $Env:HOMEPATH\.dotfiles\win10
    git remote set-url origin git@github.com:maya2250/dotfiles.git
}

choco install -y (Get-content -Path .\choco_packages.txt)
refreshenv

ForEach ($extension in (Get-Content -Path ..\vscode\extensions.txt)) {
    code --install-extension $extension --force
}
New-Item -Force -ItemType SymbolicLink -Path $Env:APPDATA\Code\User\settings.json -Target ..\vscode\settings.json

New-Item -Force -ItemType SymbolicLink -Path $profile -Target .\profile.ps1

reg import .\my.reg
