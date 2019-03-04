#!/usr/bin/env bash

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Install oh-my-vim."
echo -e "========================================================================="
echo -e "\\n\\n\\n"

sudo -v

# Install some needed tools
# For Mac OS, you can just run the script. It will install some necessory tools and the latest vim (7.4) with lua support.

curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/prepare_mac.sh | sh

# Install oh-my-vim
# It will be installed to ~/.oh-my-vim folder.

curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh



echo "Remove and overwrite the default .vimrc file"
rm -vf $HOME/.vimrc
ln -s -v $DOTFILES/dot/.vimrc $HOME
