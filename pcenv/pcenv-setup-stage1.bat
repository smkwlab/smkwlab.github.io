@echo off

:: Self-elevate to administrator if not already
fsutil dirty query %systemdrive% >nul 2>&1
if errorlevel 1 (
    echo This batch requires administrator privileges.
    echo Click "Yes" on the UAC dialog.
    set "BAT_PATH=%~f0"
    powershell -NoProfile -Command "try { Start-Process -FilePath $env:BAT_PATH -Verb RunAs -ErrorAction Stop } catch { exit 1 }"
    if errorlevel 1 (
        echo.
        echo ERROR: Failed to elevate to administrator.
        echo Cancel was clicked on the UAC dialog or PowerShell is unavailable.
        pause
        exit /b 1
    )
    exit /b
)

cd /d "%~dp0"

echo Enable WSL
wsl --install --no-distribution
if errorlevel 1 (
    echo.
    echo ======================================================
    echo  ERROR: Failed to enable WSL. Aborting.
    echo ======================================================
    pause
    exit /b 1
)

echo Install Git with custom options for Visual Studio Code, External OpenSSH, and LF line endings
winget install --id Git.Git -e --override "/VERYSILENT /NORESTART /NOCANCEL /SP- /o:EditorOption=VisualStudioCode /o:SSHOption=ExternalOpenSSH /o:CRLFOption=LFOnly" --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto error

echo Install GitHub Desktop
winget install -e --id GitHub.GitHubDesktop --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto error

echo Install Docker Desktop
echo.
echo ******************************************************
echo  IMPORTANT: When the Docker Desktop installer opens,
echo  make sure "Use WSL 2 instead of Hyper-V (recommended)"
echo  is CHECKED. If it is not, check it before continuing.
echo ******************************************************
echo.
winget install -e --id Docker.DockerDesktop --source winget --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto error

echo Install Visual Studio Code
winget install -e --id Microsoft.VisualStudioCode --source winget --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto error

echo.
echo ======================================================
echo  Stage 1 completed.
echo  Restart your PC, then run pcenv-setup-stage2.bat.
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
