#!/usr/bin/env bash

sudo -v

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Install oh-my-zsh."
echo -e "========================================================================="
echo -e "\\n\\n\\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "Remove and overwrite the default .zshrc file"
rm -vf $HOME/.zshrc
cp -v $DOTFILES/dot/.zshrc $HOME

echo  "Change your default shell"
chsh -s /bin/zsh




