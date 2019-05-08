#!/usr/bin/env sh 

echo "================================="
echo "### Setup Linux Environment"
echo "================================="

echo "## Detect package manager"
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
DNF_CMD=$(which dnf)
PKG='UNKNOWN'

if [[ ! -z $YUM_CMD  ]]; then
    PKG='yum '
elif [[ ! -z $APT_GET_CMD  ]]; then
    PKG='apt-get '
elif [[ ! -z $DNF_CMD  ]]; then
    PKG='dnf '
else
    echo "### !!! WARNING: Package manager type is Uknown"
fi

echo "### ** Default package manager is $PKG ** ## "

echo "## Update sources list"

