#!/bin/bash

echo -------------------------------------------------------------------------
echo setup obs-studio
echo -------------------------------------------------------------------------

echo do you want to setup obs-studio? [y/n]
read ans
if [ $ans  = "y" ]; then
	ln -sf ~/git/utils/dotfiles/config/obs-studio ~/.config/obs-studio
fi
