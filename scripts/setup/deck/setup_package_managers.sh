#!/bin/bash

echo -------------------------------------------------------------------------
echo setup package managers
echo -------------------------------------------------------------------------

sudo pacman -Sy
sudo pacman -S --overwrite \* fakeroot
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

yay -Syy
