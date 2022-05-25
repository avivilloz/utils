#!/bin/bash

echo -------------------------------------------------------------------------
echo setup yay
echo -------------------------------------------------------------------------

echo do you want to setup yay? [y/n]
read ans
if [ $ans  = "y" ]; then
    git clone https://aur.archlinux.org/yay-git.git
    chown -R $USER ./yay-git
    cd yay-git/
    makepkg -si
    cd ..
    rm -rf yay-git/
fi

exit 0 
