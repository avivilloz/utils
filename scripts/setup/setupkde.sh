#!/bin/bash

echo -------------------------------------------------------------------------
echo setup kde
echo -------------------------------------------------------------------------

echo do you want to setup kde? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S plasma sddm kdeconnect ark dolphin konsole gwenview kronometer qalculate-gtk okular --needed
    yay -S nerd-fonts-complete kwin-bismuth --needed
    bash ~/git/utils/scripts/sync/synckde.sh -d gtl
fi
