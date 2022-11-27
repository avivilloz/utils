#!/bin/bash

. ~/.session_variables

# in = install package
# rm = remove package
# up = update all packages and remove uneeded ones/cache
# l = list all packages
# lg = grep fomr list of all packages
# q = query through database

if [ "$base_distro" == "debian" ]; then
    if [ "$1" == "in" ]; then
        sudo apt install $2
    elif [ "$1" == "rm" ]; then
        sudo apt remove $2
    elif [ "$1" == "up" ]; then
        sudo apt update
        sudo apt upgrade
        sudo apt autoremove
    fi
elif [ "$base_distro" == "fedora" ]; then
    if [ "$1" == "in" ]; then
        sudo dnf install $2 -y
    elif [ "$1" == "rm" ]; then
        sudo dnf remove $2 -y
        flatpak uninstall $2
    elif [ "$1" == "up" ]; then
        sudo dnf upgrade --refresh -y
        sudo dnf autoremove -y
        sudo dnf clean packages -y
        flatpak update
        flatpak uninstall --unused
    elif [ "$1" == "l" ]; then
        sudo dnf list installed
        flatpak list
    elif [ "$1" == "lg" ]; then
        sudo dnf list installed | grep $2
        flatpak list | grep $2
    fi
elif [ "$base_distro" == "arch" ]; then
    if [ "$1" == "in" ]; then
        yay -Syy
        yay -S --needed $2
    elif [ "$1" == "rm" ]; then
        yay -Rns $2
    elif [ "$1" == "up" ]; then
        yay -Syu
        yay -Yc
        yay -Scc
    elif [ "$1" == "l" ]; then
        yay -Qe
    elif [ "$1" == "lg" ]; then
        yay -Qe | grep $2
    elif [ "$1" == "q" ]; then
        yay -Ss $2
    fi
fi

exit 0
