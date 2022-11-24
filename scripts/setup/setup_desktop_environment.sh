#!/bin/bash

echo -------------------------------------------------------------------------
echo setup desktop environment
echo -------------------------------------------------------------------------

echo which desktop environment would you like to install? [gnome/kde]
read ans

if [ $ans  = "kde" ]; then
    sudo pacman -S sddm plasma kdeconnect ark dolphin konsole gwenview okular \
        spectacle yakuake packagekit-qt5 --needed
    yay -S kwin-bismuth discover-snap --needed

	sudo systemctl enable sddm
fi

if [ $ans  = "gnome" ]; then
fi
