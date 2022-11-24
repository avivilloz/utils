#!/bin/bash

echo -------------------------------------------------------------------------
echo setup package managers
echo -------------------------------------------------------------------------

echo do you want to edit pacman.conf? [y/n]
read ans
if [ $ans = "y" ]; then
    sudo vim /etc/pacman.conf
fi

echo do you want to setup chaotic aur? [y/n]
read ans
if [ $ans = "y" ]; then
    pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key FBA220DFC880C036
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
        'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    echo "[chaotic-aur]" >> /etc/pacman.conf
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
fi

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
    sudo pacman -S --needed flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
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
fi

echo do you want to setup app-image? [y/n]
read ans
if [ $ans  = "y" ]; then
    yay -S --needed appimagelauncher
fi
