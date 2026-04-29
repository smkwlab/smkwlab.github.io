@echo off
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
echo  WSL installation completed.
echo  Restart your PC, then run pcenv-setup-all.bat.
echo ======================================================
pause
