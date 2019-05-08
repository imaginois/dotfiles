#!/usr/bin/env bash

sudo -v

echo -e "========================================================================="
echo -e "### Install oh-my-zsh."
echo -e "========================================================================="

echo "## Running sh -c $(curl -fsSL https://raw.../oh-my-zsh/install.sh)"
echo "# Check /tmp/oh-my-zsh-install.log for details"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" | tee -a /tmp/oh-my-zsh-install.log >/dev/null

if [ ! -e ~/.oh-my-zsh/custom/themes ]; then
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi 

echo "Remove and overwrite the default .zshrc file"
rm -vf $HOME/.zshrc
ln -s -v $DOTFILES/dot/.zshrc $HOME

# echo  "Change your default shell"
# chsh -s /bin/zsh




