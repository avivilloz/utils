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
		sweeper \
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
        fragments \
        extension-manager \
        gnome-tweaks \
        gdm-settings

    sudo pacman -Rns \
        epiphany

	sudo systemctl enable gdm

    sudo sed -i 's/LABEL="gdm_prefer_xorg"/#LABEL="gdm_prefer_xorg"/g' /usr/lib/udev/rules.d/61-gdm.rules > /dev/null
    sudo sed -i 's/LABEL="gdm_disable_wayland"/#LABEL="gdm_disable_wayland"/g' /usr/lib/udev/rules.d/61-gdm.rules > /dev/null
    
    echo "To enable tap-to-click on gdm, follow the link: https://www.reddit.com/r/gnome/comments/gppye4/why_is_tap_to_click_not_enabled_by_default_on_gdm/"
    echo "To copy monitor configurations of gnome to gdm, link ~/.config/monitors.xml to /var/lib/gdm/.config/monitors.xml"
fi