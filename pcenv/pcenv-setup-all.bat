@echo off
echo "Install Visual Studio Code"
winget install -e --id Microsoft.VisualStudioCode --source winget --accept-package-agreements --accept-source-agreements

echo "Install Git with custom options for Visual Studio Code, External OpenSSH, and LF line endings"
winget install --id Git.Git -e --override "/VERYSILENT /NORESTART /NOCANCEL /SP- /o:EditorOption=VisualStudioCode /o:SSHOption=ExternalOpenSSH /o:CRLFOption=LFOnly" --accept-package-agreements --accept-source-agreements

echo "Install GitHub Desktop"
winget install -e --id GitHub.GitHubDesktop --accept-package-agreements --accept-source-agreements

wsl --status >nul 2>&1
if errorlevel 1 (
    echo ERROR: WSL is not enabled.
    echo Run pcenv-setup-wsl.bat as administrator,
    echo then restart your PC and run this batch again.
    pause
    exit /b 1
)
echo "Install Ubuntu distribution for WSL"
winget install -e --id Canonical.Ubuntu --accept-package-agreements --accept-source-agreements

set "CODE=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
if not exist "%CODE%" set "CODE=%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
echo "Install VS Code extensions"
if not exist "%CODE%" (
    echo ERROR: code.cmd not found at %CODE%
    echo VS Code may not be installed properly.
    pause
    exit /b 1
)
"%CODE%" --install-extension ms-vscode-remote.vscode-remote-extensionpack
"%CODE%" --install-extension MS-CEINTL.vscode-language-pack-ja

echo "Install Docker Desktop"
winget install -e --id Docker.DockerDesktop --source winget --accept-package-agreements --accept-source-agreements

echo.
echo ======================================================
echo  Setup completed.
echo  To use Docker Desktop, sign out and sign in,
echo  or restart your PC.
echo ======================================================
pause
