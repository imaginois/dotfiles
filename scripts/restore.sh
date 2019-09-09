#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

echo -e "========================================================================="
echo -e "### Restoring dotfiles and conf files."
echo -e "========================================================================="

if [ ! -d $HOME/.ssh ];then
  mkdir -p $HOME/.ssh
  echo -e "## Restore .ssh"
  ln -s $DOTFILES/dot/.ssh/* $HOME/.ssh/
fi

if [ ! -f $HOME/.ssh/id_rsa ]; then
	echo "## Looks like you don't have a public/private keypair"
	ssh-keygen -f $HOME/.ssh/id_rsa
    ssh-add -K ~/.ssh/id_rsa
fi

echo -e "## Restore .config"
if [ ! -d $HOME/.config ]; then
	echo "# ~/.config doesn't exist. Creating symlink"
	ln -s $DOTFILES/dot/.config $HOME
fi

echo -e "##Restore .atom"
if [ ! -d $HOME/.atom ]; then
	echo "# ~/.atom doesn't exist. Creating symlink"
	ln -s $DOTFILES/dot/.atom $HOME
fi


echo -e "## Restore Sublime Text Packages and settings"
if [ -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages ]; then
	echo "# delete Packages dir"
	rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
fi

echo "## Symlynk dropbox folder to Sublime packages"
ln -s ~/Dropbox/Sublime/Packages ~/Library/Application\ Support/Sublime\ Text\ 3/Packages

echo -e "## Restore .todo"
if [ ! -d $HOME/.todo ]; then
	echo "# ~/.todo doesn't exist. Creating symlink"
	ln -s $DOTFILES/dot/.todo $HOME
fi

echo -e "========================================================================="
echo -e "### Done with restore."
echo -e "========================================================================="
