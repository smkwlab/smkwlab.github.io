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

echo "Install Visual Studio Code"
brew install --cask visual-studio-code

echo "Install Git"
brew install git

echo "Install GitHub Desktop"
brew install --cask github

echo "Install VS Code extensions"
CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
if [[ ! -x "$CODE" ]]; then
    echo "ERROR: code command not found at $CODE"
    echo "VS Code may not be installed properly."
    exit 1
fi
"$CODE" --install-extension ms-vscode-remote.vscode-remote-extensionpack
"$CODE" --install-extension MS-CEINTL.vscode-language-pack-ja

echo "Install Docker Desktop"
brew install --cask docker

echo ""
echo "======================================================"
echo "  Setup completed."
echo "  On first launch, Docker Desktop will request license"
echo "  acceptance and your admin password."
echo "======================================================"
