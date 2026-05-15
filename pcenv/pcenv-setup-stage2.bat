@echo off

:: Both VS Code extension installs and wsl --install -d Ubuntu (after
:: WSL is already enabled) are user-level operations, so this stage
:: does not require administrator privileges. The manual guide in
:: pcenv/index.md happens to run these commands from an elevated
:: Windows Terminal as continuity with the surrounding steps, but
:: elevation is not required here.

cd /d "%~dp0"

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

echo.
echo ======================================================
echo  VS Code extensions installed.
echo.
echo  Next, Ubuntu will be installed. This is the final
echo  step. After the installer finishes, the Ubuntu window
echo  opens and asks you to set a Linux user name and
echo  password. Follow the prompts. Once you reach the
echo  Ubuntu shell prompt, type "exit" or close the Ubuntu
echo  window to finish.
echo ======================================================
pause

echo Update WSL to the latest version
wsl --update
if errorlevel 1 goto error

echo Install Ubuntu distribution for WSL
wsl --install -d Ubuntu
if errorlevel 1 goto error
exit /b 0

:error
echo.
echo ======================================================
echo  ERROR: A package installation failed. Aborting.
echo ======================================================
pause
exit /b 1
