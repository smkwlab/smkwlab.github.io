@echo off

:: Self-elevate to administrator if not already
net session >nul 2>&1
if errorlevel 1 (
    echo This batch requires administrator privileges.
    echo Click "Yes" on the UAC dialog.
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

:: Enable WSL if not already functional
wsl --status >nul 2>&1
if errorlevel 1 (
    echo Enable WSL
    wsl --install --no-distribution
    if errorlevel 1 goto :error

    :: After install, check again. If still not functional, reboot is required.
    wsl --status >nul 2>&1
    if errorlevel 1 (
        echo.
        echo ======================================================
        echo  WSL has been enabled. Restart your PC,
        echo  then run this batch again.
        echo ======================================================
        pause
        exit /b 0
    )
)

echo Install Visual Studio Code
winget install -e --id Microsoft.VisualStudioCode --source winget --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto :error

echo Install Git with custom options for Visual Studio Code, External OpenSSH, and LF line endings
winget install --id Git.Git -e --override "/VERYSILENT /NORESTART /NOCANCEL /SP- /o:EditorOption=VisualStudioCode /o:SSHOption=ExternalOpenSSH /o:CRLFOption=LFOnly" --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto :error

echo Install GitHub Desktop
winget install -e --id GitHub.GitHubDesktop --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto :error

echo Install Ubuntu distribution for WSL
wsl --install -d Ubuntu
if errorlevel 1 goto :error

set "CODE=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
if not exist "%CODE%" set "CODE=%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
echo Install VS Code extensions
if not exist "%CODE%" (
    echo ERROR: code.cmd not found at %CODE%
    echo VS Code may not be installed properly.
    pause
    exit /b 1
)
"%CODE%" --install-extension ms-vscode-remote.vscode-remote-extensionpack
if errorlevel 1 goto :error
"%CODE%" --install-extension ms-azuretools.vscode-docker
if errorlevel 1 goto :error
"%CODE%" --install-extension MS-CEINTL.vscode-language-pack-ja
if errorlevel 1 goto :error

echo Install Docker Desktop
winget install -e --id Docker.DockerDesktop --source winget --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto :error

echo.
echo ======================================================
echo  Setup completed.
echo  To use Docker Desktop, sign out and sign in,
echo  or restart your PC.
echo ======================================================
pause
exit /b 0

:error
echo.
echo ======================================================
echo  ERROR: A package installation failed. Aborting.
echo ======================================================
pause
exit /b 1
