#!/usr/bin/env bash

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Setting up tmux."
echo -e "========================================================================="
echo -e "\\n\\n\\n"


echo "Symlink $DOTFILES/dot/.tmux.conf $HOME/"
ln -s -f $DOTFILES/dot/.tmux.conf $HOME/

echo "Symlink .tmux.conf.local into home dir"
ln -s -f $DOTFILES/dot/.tmux.conf.local $HOME/