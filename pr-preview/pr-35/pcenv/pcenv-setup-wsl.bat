@echo off

:: Self-elevate to administrator if not already
fsutil dirty query %systemdrive% >nul 2>&1
if errorlevel 1 (
    echo This batch requires administrator privileges.
    echo Click "Yes" on the UAC dialog.
    set "BAT_PATH=%~f0"
    powershell -NoProfile -Command "Start-Process -FilePath $env:BAT_PATH -Verb RunAs"
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

wsl --install --no-distribution
if errorlevel 1 (
    echo.
    echo ======================================================
    echo  WSL installation failed.
    echo  Check the error and try again.
    echo ======================================================
    pause
    exit /b 1
)

echo.
echo ======================================================
echo  WSL has been enabled. Restart your PC
echo  before continuing with the setup.
echo ======================================================
pause
