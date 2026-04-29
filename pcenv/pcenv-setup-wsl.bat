@echo off

:: Self-elevate to administrator if not already
fsutil dirty query %systemdrive% >nul 2>&1
if errorlevel 1 (
    echo This batch requires administrator privileges.
    echo Click "Yes" on the UAC dialog.
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
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

:: Check if reboot is required
wsl --status >nul 2>&1
if errorlevel 1 (
    echo.
    echo ======================================================
    echo  WSL has been enabled. Restart your PC,
    echo  then run pcenv-setup-all.bat.
    echo ======================================================
) else (
    echo.
    echo ======================================================
    echo  WSL installation completed.
    echo  You can now run pcenv-setup-all.bat.
    echo ======================================================
)
pause
