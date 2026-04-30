@echo off

:: Both wsl --install -d Ubuntu (after WSL is already enabled) and
:: VS Code extension installs are user-level operations, so this stage
:: does not require administrator privileges.

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
