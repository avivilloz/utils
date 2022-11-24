#!/bin/bash

echo -------------------------------------------------------------------------
echo setup package managers
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
    yay -Syu
fi

echo do you want to setup flatpak? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S --needed flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak update
fi

echo do you want to setup snap? [y/n]
read ans
if [ $ans  = "y" ]; then
    git clone https://aur.archlinux.org/snapd.git
    cd snapd
    makepkg -si
    cd ..
    rm -rf snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    sudo snap refresh
fi

echo do you want to setup app-image? [y/n]
read ans
if [ $ans  = "y" ]; then
    yay -S --needed appimagelauncher
fi
