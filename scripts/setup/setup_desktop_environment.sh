#!/bin/bash

echo -------------------------------------------------------------------------
echo setup desktop environment
echo -------------------------------------------------------------------------

echo "do you want to install xorg? [y/n]"
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S --needed xorg xorg-xwayland
fi

echo which desktop environment would you like to install? [gnome/kde]
read ans

if [ $ans  = "kde" ]; then
    sudo pacman -S --needed \
        sddm \
        plasma \
        kdeconnect \
        ark \
        dolphin \
        konsole \
        gwenview \
        okular \
        spectacle \
        yakuake \
		kate \
		akregator \
		kcharselect \
		kcolorchooser \
		ktorrent \
		qalculate-gtk \
        packagekit-qt5

    yay -S --needed \
        kwin-bismuth \
        discover-snap

	sudo systemctl enable sddm
fi

if [ $ans  = "gnome" ]; then
    sudo pacman -S --needed \
        gnome \
        fragments

    sudo pacman -Rns \
        epiphany

	sudo systemctl enable gdm
fi
