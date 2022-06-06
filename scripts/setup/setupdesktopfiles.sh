#!/bin/bash

echo -------------------------------------------------------------------------
echo setup desktop files
echo -------------------------------------------------------------------------

echo do you want to setup desktop files? [y/n]
read ans
if [ $ans  = "y" ]; then
	desktopfilespath="~/git/utils/dotfiles/desktopfiles"
	applicationspath="~/.local/share/applications"
	mkdir -p $applicationspath
	for file in $desktopfilespath/*;
	do
		ln -sf $desktopfilespath/$file $applicationspath/$file
	done
fi
