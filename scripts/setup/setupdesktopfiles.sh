#!/bin/bash

echo -------------------------------------------------------------------------
echo setup desktop files
echo -------------------------------------------------------------------------

echo do you want to setup desktop files? [y/n]
read ans
if [ $ans  = "y" ]; then
	gitdesktopfiles=~/git/utils/dotfiles/desktopfiles
	localdesktopfiles=~/.local/share/applications
	mkdir -p $localdesktopfiles
	cd $gitdesktopfiles
	for file in *;
	do
		ln -sf $gitdesktopfiles/$file $localdesktopfiles/$file
	done
fi
