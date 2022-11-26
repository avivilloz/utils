#!/bin/bash

echo -------------------------------------------------------------------------
echo setup package managers
echo -------------------------------------------------------------------------

echo do you want to enable multilib? [y/n]
read ans
if [ $ans = "y" ]; then
    sudo sed -i -z 's/#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf
fi

echo do you want to setup chaotic aur? [y/n]
read ans
if [ $ans = "y" ]; then
    sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
    sudo pacman-key --lsign-key FBA220DFC880C036
    sudo pacman -U --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf > /dev/null
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
    sudo pacman -Syy
fi

echo do you want to setup yay? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo pacman -S yay
    yay -Syy
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
