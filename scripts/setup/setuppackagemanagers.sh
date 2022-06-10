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

echo do you want to setup flatpak? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

echo do you want to setup snaps? [y/n]
read ans
if [ $ans  = "y" ]; then
    git clone https://aur.archlinux.org/snapd.git
    cd snapd
    makepkg -si
    cd ..
    rm -rf snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
fi
