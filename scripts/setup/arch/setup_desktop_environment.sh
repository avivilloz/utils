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
    
    # gdm settings
    mkdir -p /etc/systemd/system/gdm.service.d/
    echo "\
    [Service]
    ExecStartPre=/bin/cp /home/avivilloz/.config/monitors.xml /var/lib/gdm/.config/monitors.xml" | sudo tee -a /etc/systemd/system/gdm.service.d/override.conf > /dev/null

    mkdir -p /etc/dconf/db/gdm.d/
    echo "\
    [org/gnome/desktop/peripherals/touchpad]
    tap-to-click=true" | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click > /dev/null

    sudo pacman -S numlockx --needed
    echo "\
    if [ -x /usr/bin/numlockx ]; then
          /usr/bin/numlockx on
    fi" | tee -a ~/.xprofile > /dev/null

fi
