#!/bin/bash
#
# File:    networkenv-setup.sh
# Author:  Toshihiko SHIMOKAWA <toshi@smkwlab.net>
# Created: 2026-04-27
#
set -euo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Install Visual Studio Code"
brew install visual-studio-code

echo "Install Git"
brew install git

echo "Install GitHub Desktop"
brew install github

echo "Install Docker Desktop"
brew install --cask docker
