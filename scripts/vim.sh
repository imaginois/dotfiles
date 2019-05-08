#!/usr/bin/env bash

echo -e "========================================================================="
echo -e "### Install oh-my-vim."
echo -e "========================================================================="

sudo -v

rm -rf /tmp/oh-my-vim-install.log

# Install some needed tools
# For Mac OS, you can just run the script. It will install some necessory tools and the latest vim (7.4) with lua support.
 
curl -L -s https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/prepare_mac.sh >> /tmp/oh-my-vim-install.log | sh  >> /tmp/oh-my-vim-install.log 

# Install oh-my-vim
# It will be installed to ~/.oh-my-vim folder.

curl -L -s https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh >> /tmp/oh-my-vim-install.log | sh >> /tmp/oh-my-vim-install.log 

echo "## Remove and overwrite the default .vimrc file"
rm -vf $HOME/.vimrc
ln -s -v $DOTFILES/dot/.vimrc $HOME
