#!/bin/bash
#
# File:    pcenv-setup-gh.sh
# Author:  Toshihiko SHIMOKAWA <toshi@smkwlab.net>
# Created: 2026-10-21
#
# Installs the GitHub CLI (gh) on Ubuntu/Debian. On Windows this must run
# inside WSL: the lab's repository creation script runs there, and a gh
# installed on the Windows side is not on PATH in WSL.
#
# The command below is the official procedure, copied verbatim from
#   https://github.com/cli/cli/blob/trunk/docs/install_linux.md#installing-gh-on-linux-and-bsd
# Keep it that way. Editing it means a later upstream change arrives as a
# diff mixed with our own edits, and nothing here tracks upstream to
# tell us apart.
#
# This file is the only copy of the command. pcenv/index.md section 9.5.1
# and pcenv-setup-stage2.bat both run this script rather than repeating it.

set -eu

if command -v gh >/dev/null 2>&1; then
    echo "gh is already installed: $(gh --version | head -1)"
    exit 0
fi

echo "Install GitHub CLI"
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

echo ""
echo "======================================================"
echo "  gh installed. Authenticate with:  gh auth login"
echo "======================================================"
