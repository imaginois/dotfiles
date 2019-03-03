#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

command_exists() {
    type "$1" > /dev/null 2>&1
}

xcode-select --install

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "\n\n\n"
echo -e "========================================================================="
echo -e "Installing dotfiles."
echo -e "========================================================================="

#echo "Initializing submodule(s)"
#git submodule update --init --recursive

source scripts/backup.sh
# source scripts/link.sh
source scripts/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\\n\\nRunning on macOS"
    source scripts/brew.sh
    source scripts/osx.sh
fi

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s "$(command -v zsh)"
fi


echo -e "\n\n\n\n\n"
echo -e "==========================="
echo -e "+++++++++++++++++++++++++++"
echo -e "\n\nDone. Reload your terminal.\n\n"
echo -e "+++++++++++++++++++++++++++"
echo -e "==========================="
