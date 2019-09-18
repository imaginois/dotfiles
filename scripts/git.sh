#!/usr/bin/env bash

echo -e "========================================================================="
echo -e "### Setting up git."
echo -e "========================================================================="

# Must me done fist because variable depend on the conf giles
# make sure you run backup.sh first
if [ -f $HOME/.gitconfig ];then
  rm $HOME/.gitconfig
  rm $HOME/.gitignore_global
fi


ln -sv  $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -sv  $DOTFILES/git/gitignore_global $HOME/.gitignore_global

defaultName=$( git config --global user.name )
defaultEmail=$( git config --global user.email )
defaultGithub=$( git config --global github.user )

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email
read -rp "Github username [$defaultGithub] " github

git config --global user.name "${name:-$defaultName}"
git config --global user.email "${email:-$defaultEmail}"
git config --global github.user "${github:-$defaultGithub}"


if [[ "$( uname )" == "Darwin" ]]; then
    git config --global credential.helper "osxkeychain"
else
    read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
    if [[ $save =~ ^([Yy])$ ]]; then
        git config --global credential.helper "store"
    else
        git config --global credential.helper "cache --timeout 3600"
    fi
fi

echo -e "========================================================================="
echo -e "### Done with git."
echo -e "========================================================================="
