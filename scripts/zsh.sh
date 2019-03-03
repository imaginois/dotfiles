#!/usr/bin/env bash

sudo -v

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Install oh-my-zsh."
echo -e "========================================================================="
echo -e "\\n\\n\\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Remove and overwrite the default .zshrc file"
rm -f $HOME/.zshrc
cp $DOTFILES/dot/.zshrc

echo  "Change your default shell"
chsh -s /bin/zsh




