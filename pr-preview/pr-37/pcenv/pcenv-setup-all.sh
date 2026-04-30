#!/bin/bash
#
# File:    pcenv-setup-all.sh
# Author:  Toshihiko SHIMOKAWA <toshi@smkwlab.net>
# Created: 2026-04-27
#
set -euo pipefail

# Install Homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Install Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Set up Homebrew environment
BREW_BIN="$(command -v brew || true)"
if [[ -z "$BREW_BIN" ]]; then
    if [[ -x /opt/homebrew/bin/brew ]]; then
        BREW_BIN="/opt/homebrew/bin/brew"
    elif [[ -x /usr/local/bin/brew ]]; then
        BREW_BIN="/usr/local/bin/brew"
    else
        echo "ERROR: brew command not found after Homebrew installation."
        exit 1
    fi
fi
eval "$("$BREW_BIN" shellenv)"

echo "Install Git"
brew install git

echo "Install GitHub Desktop"
brew install --cask github

echo "Install Docker Desktop"
brew install --cask docker

echo "Install Visual Studio Code"
brew install --cask visual-studio-code

echo "Install VS Code extensions"
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-azuretools.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-ja

echo ""
echo "======================================================"
echo "  Setup completed."
echo "  On first launch, Docker Desktop will request license"
echo "  acceptance and your admin password."
echo "======================================================"
