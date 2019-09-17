#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "## Setup xcode tools"
xcode-select --install

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "========================================================================="
echo -e "### Installing dotfiles."
echo -e "========================================================================="

echo "## Setup the git repository"

if [ ! -d $DOTFILES ]; then
    git clone git@github.com:imaginois/dotfiles.git $DOTFILES
fi

cd $DOTFILES



#echo "Initializing submodule(s)"
#git submodule update --init --recursive

# Generic commands to execute
echo "## Install pip"
sudo easy_install pip

echo "## Symling the ~/bin directory"
ln -s $DOTFILES/bin $HOME

echo "## Restore .alias"
ln -s $DOTFILES/dot/.alias $HOME

echo  "## Restore .exports"
ln -s $DOTFILES/dot/.exports $HOME

echo -e "\n==================================================================\n"

source scripts/backup.sh
source scripts/restore.sh
source scripts/git.sh
source scripts/zsh.sh
source scripts/tmux.sh
source scripts/vim.sh
source scripts/docker-compose.sh
# source scripts/link.sh
           
echo -e "======== OSTYPE IS ========"
case "$OSTYPE" in
    solaris*) echo "SOLARIS" ;;
    darwin*)  echo "OSX" ;; 
    linux*)   echo "LINUX" ;;
    bsd*)     echo "BSD" ;;
    msys*)    echo "WINDOWS" ;;
    *)        echo "unknown: $OSTYPE" ;;
esac

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n ## Running on macOS"
fi

if [[ "$OSTYPE" == "linux-gnu"  ]]; then
    # ...                  
    echo "## Install LINUX files"
    source scripts/linux.sh
elif [[ "$OSTYPE" == "darwin"*  ]]; then 
    # Mac OSX
    echo "## Install MAC files"
    source scripts/osx.sh            
#elif [[ "$OSTYPE" == "cygwin"  ]]; then
    # POSIX compatibility layer and Linux environment
    # emulation for Windows
#elif [[ "$OSTYPE" == "msys"  ]]; then
    # Lightweight shell and GNU utilities
    # compiled for Windows (part of MinGW)
#elif [[ "$OSTYPE" == "win32"  ]]; then
    # I'm not sure this can happen.
#elif [[ "$OSTYPE" == "freebsd"*  ]];then
    # ...
else
    # Unknown.
    echo -e "\n\n#####################################################"
    echo -e "\n\n### !!! WARNING: Operating system was not recognized"
    echo -e "\n\n#####################################################"
fi

if ! command_exists zsh; then
    echo "## zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "## Configuring zsh as default shell"
    chsh -s "$(command -v zsh)"
fi


echo -e "\n\n\n\n\n"
echo -e "==========================="
echo -e "+++++++++++++++++++++++++++"
echo -e "\n\nDone. Reload your terminal.\n\n"
echo -e "+++++++++++++++++++++++++++"
echo -e "==========================="
