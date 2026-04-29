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

# Set up Homebrew environment (Apple Silicon / Intel)
if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

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
    echo "VS Code のインストールが正しく完了していない可能性があります。"
    exit 1
fi
"$CODE" --install-extension ms-vscode-remote.vscode-remote-extensionpack
"$CODE" --install-extension MS-CEINTL.vscode-language-pack-ja

echo "Install Docker Desktop"
brew install --cask docker

echo ""
echo "======================================================"
echo "  セットアップが完了しました。"
echo "  Docker Desktop は初回起動時にライセンス同意と"
echo "  権限付与（管理者パスワード入力）が必要です。"
echo "======================================================"
