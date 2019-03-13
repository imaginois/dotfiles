#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Restoring dotfiles and conf files."
echo -e "========================================================================="
echo -e "\\n\\n\\n"


echo -e "Restore .ssh"
ln -s $DOTFILES/dot/.ssh/* $HOME/.ssh/
if [ ! -f $HOME/.ssh/id_rsa ]; then
	echo "Looks like you don't have a public/private keypair"
	ssh-keygen -f $HOME/.ssh/id_rsa
fi
ssh-add -K ~/.ssh/id_rsa

echo -e "Restore .config"
if [ ! -d $HOME/.config ]; then
	echo "~/.config doesn't exist. Creating symlink"
	ln -s $DOTFILES/dot/.config $HOME
fi

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Done with restore."
echo -e "========================================================================="
echo -e "\\n\\n\\n"
