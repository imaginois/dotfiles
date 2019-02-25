#!/usr/bin/env bash

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/.dotfiles-backup

set -e # Exit immediately if a command exits with a non-zero status.

echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Backup current dotfiles and conf files."
echo -e "========================================================================="
echo -e "\\n\\n\\n"

echo "Creating backup directory at $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "List of files:"
ls -la

echo "Backup ~/.config"
cp -r ~/.config $BACKUP_DIR/

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

files=(
  .zshrc
  .gitconfig
  test
)

dirs=(
  .atom
)


for file in $files; do
    target="$HOME/$file"
    if [ -f "$target" ]; then
        echo "### backing up $file"
        cp -v "$target" "$BACKUP_DIR"
    else
        echo -e "$file does not exist at this location or is a symlink"
    fi
done


for dir in $dirs; do
    target="$HOME/$dir"
    if [ -d "$target" ]; then
        echo "### backing up $dir"
        cp -rv "$target" "$BACKUP_DIR"
    else
        echo -e "$dir does not exist at this location or is a symlink"
    fi
done

# for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
#     if [ ! -L "$filename" ]; then
#         echo "backing up $filename"
#         cp -rf "$filename" "$BACKUP_DIR"
#     else
#         echo -e "$filename does not exist at this location or is a symlink"
#     fi
# done


echo -e "\\n\\n\\n"
echo -e "========================================================================="
echo -e "Done with backup."
echo -e "========================================================================="
echo -e "\\n\\n\\n"
