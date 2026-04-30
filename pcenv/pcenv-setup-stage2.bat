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

echo Install Ubuntu distribution for WSL
wsl --install -d Ubuntu
if errorlevel 1 goto error

echo Install VS Code extensions
where code >nul 2>&1
if errorlevel 1 (
    echo ERROR: code command not found on PATH.
    echo VS Code may not be installed properly, or you forgot to restart
    echo your PC after running pcenv-setup-stage1.bat.
    pause
    exit /b 1
)
call code --install-extension ms-vscode-remote.vscode-remote-extensionpack
if errorlevel 1 goto error
call code --install-extension ms-azuretools.vscode-docker
if errorlevel 1 goto error
call code --install-extension MS-CEINTL.vscode-language-pack-ja
if errorlevel 1 goto error

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
