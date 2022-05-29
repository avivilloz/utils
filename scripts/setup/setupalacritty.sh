#!/bin/bash

echo -------------------------------------------------------------------------
echo alacritty setup
echo -------------------------------------------------------------------------

echo do you want to setup alacritty? [y/n]
read ans
if [ $ans  = "y" ]; then
	mkdir -p ~/.config/alacritty
	ln -sf ~/git/utils/dotfiles/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi
