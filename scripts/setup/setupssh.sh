#!/bin/bash

echo -------------------------------------------------------------------------
echo setup ssh
echo -------------------------------------------------------------------------

echo do you want to setup ssh? [y/n]
read ans
if [ $ans  = "y" ]; then
	rm -rf ~/.ssh
	ln -sf ~/git/utils/dotfiles/ssh/.ssh ~/.ssh
fi
