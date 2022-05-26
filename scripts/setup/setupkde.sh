#!/bin/bash

echo -------------------------------------------------------------------------
echo setup kde
echo -------------------------------------------------------------------------

echo do you want to do a complete install of kde on arch - includes fonts installation, and needs yay installed? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S plasma sddm kdeconnect ark dolphin konsole gwenview okular spectacle kcolorchooser --neAeded
    yay -S nerd-fonts-complete kwin-bismuth kclock --needed
fi

echo do you want to setup kde with config files, etc? [y/n]
read ans
if [ $ans  = "y" ]; then
    . ~/.variables
    bash $scriptsdir/sync/synckde.sh -d gtl
fi
