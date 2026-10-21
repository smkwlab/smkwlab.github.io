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

echo Install GitHub CLI inside Ubuntu
:: Piped through stdin rather than fetched or path-translated: no network
:: dependency, no quoting of the script's own double quotes, and no need
:: to know which drive this directory is on. Run as root so the script's
:: sudo calls do not stop for the password just set during Ubuntu setup.
if not exist "pcenv-setup-gh.sh" (
    echo ERROR: pcenv-setup-gh.sh not found next to this batch file.
    echo Download it from https://www.nw.is.kyusan-u.ac.jp/pcenv/ and retry.
    pause
    exit /b 1
)
type pcenv-setup-gh.sh | wsl -d Ubuntu -u root -- bash
if errorlevel 1 goto error

echo.
echo ======================================================
echo  Two steps remain and must be done by hand.
echo  See sections 9.4 and 9.5.3 of the guide:
echo    https://www.nw.is.kyusan-u.ac.jp/pcenv/
echo.
echo  1. Docker Desktop: Settings - Resources -
echo     WSL Integration. Enable Ubuntu and press Apply.
echo     Without it, "docker" is not found inside Ubuntu.
echo.
echo  2. Open Ubuntu and run "gh auth login" to
echo     authenticate the GitHub CLI.
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
