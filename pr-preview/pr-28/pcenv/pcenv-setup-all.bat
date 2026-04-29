@echo off
echo "Install Visual Studio Code"
winget install -e --id Microsoft.VisualStudioCode --source winget

echo "Install Git"
winget install --id Git.Git -e --override "/VERYSILENT /NORESTART /NOCANCEL /SP- /o:EditorOption=VisualStudioCode /o:SSHOption=ExternalOpenSSH /o:CRLFOption=LFOnly"

echo "Install GitHub Desktop"
winget install -e --id GitHub.GitHubDesktop

echo "Install Windows Subsystem for Linux (WSL) and Ubuntu"
winget install -e --id Canonical.Ubuntu

echo "Install Docker Desktop"
winget install -e --id Docker.DockerDesktop --source winget
