#!/usr/bin/env sh

echo "Put docker-compose.yml in the ~/www folder"
if [ ! -d $HOME/www ]; then
  echo "Creating ~/www"
  mkdir -p $HOME/www
fi

if [ ! -f $HOME/www/docker-compose.yml ];then
  echo "Symlink docker-compose.yml"
  ls -s $DOTFILES/conf/docker-compose.yml
fi
