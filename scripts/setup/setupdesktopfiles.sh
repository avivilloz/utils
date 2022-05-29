#!/bin/bash

echo -------------------------------------------------------------------------
echo setup desktop files
echo -------------------------------------------------------------------------

echo do you want to setup desktop files? [y/n]
read ans
if [ $ans  = "y" ]; then
	mkdir -p ~/local/share/applications
	rm -rf ~/local/share/applications/df
	ln -sf ~/git/utils/dotfiles/df ~/.local/share/applications/df
fi
