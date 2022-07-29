#!/bin/bash

echo -------------------------------------------------------------------------
echo setup kde
echo -------------------------------------------------------------------------

echo do you want to do a complete install of kde on arch -needs yay installed- ? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S sddm plasma kdeconnect ark dolphin konsole gwenview okular spectacle yakuake packagekit-qt5 --needed
    yay -S kwin-bismuth discover-snap --needed

	sudo systemctl enable sddm
fi