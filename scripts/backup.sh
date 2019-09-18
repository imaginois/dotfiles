#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

set -e # Exit immediately if a command exits with a non-zero status.

echo -e "========================================================================="
echo -e "### Backup current dotfiles and conf files."
echo -e "========================================================================="

echo "## Creating backup directory at $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "## List of files:"
ls -la

if [ -d "$HOME/.config" ]; then
  echo "## Backup ${HOME}.config"
  cp -rv ~/.config $BACKUP_DIR/
  rm -rf $HOME/.config
fi

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

files=(
  .zshrc
  .gitconfig
  .gitignore_global
  .bashrc
)

dirs=(
  .atom
  .config
)


for file in ${files[@]}; do
    source="$HOME/$file"
    destination="$BACKUP_DIR/$file"
    if [ -f "$source" && ! ]; then
        echo "## backing up $file"
        cp -v "$source" "$destination"
    else
        echo -e "## $file does not exist at this location or is a symlink"
    fi
done


for dir in ${dirs[@]}; do
    source="$HOME/$dir"
    if [ -d "$source" ]; then
        echo "## backing up $dir"
        # cp -rv "$source" "$BACKUP_DIR"
        rsync -av --progress $source $BACKUP_DIR --exclude *cache*
    else
        echo -e "## $dir does not exist at this location or is a symlink"
    fi
done


echo -e "========================================================================="
echo -e "### Done with backup."
echo -e "========================================================================="
