#!/bin/bash

. ~/.session_variables

# r = refresh repos
# ss = show status
# in = install package
# rm = remove package
# u = update specific package
# up = update all packages and remove uneeded ones/cache
# l = list all packages
# lg = grep -i from list of all packages
# q = query through database

if [ "$base_distro" == "debian" ]; then

    if [ "$1" == "in" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo apt install $2
            fi
        done
    elif [ "$1" == "rm" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo apt remove $2
            fi
        done
    elif [ "$1" == "up" ]; then
        sudo apt update
        sudo apt upgrade
        sudo apt autoremove
    fi

elif [ "$base_distro" == "fedora" ]; then

    if [ "$1" == "in" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo dnf install $pkg -y
            fi
        done
    elif [ "$1" == "rm" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo dnf remove $2 -y
            fi
        done
    elif [ "$1" == "up" ]; then
        sudo dnf upgrade --refresh -y
        sudo dnf autoremove -y
        sudo dnf clean packages -y
    elif [ "$1" == "l" ]; then
        dnf list installed
    elif [ "$1" == "lg" ]; then
        dnf list installed | grep -i $2
    fi

elif [ "$base_distro" == "arch" ]; then
    if [ "$1" == "r" ]; then
        yay -Syy
    elif [ "$1" == "ss" ]; then
        yay -Syy
        yay -Sua
    elif [ "$1" == "u" ]; then
        yay -S $2
    elif [ "$1" == "in" ]; then
        yay -Syy
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                yay -S --needed $2
            fi
        done
    elif [ "$1" == "rm" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                yay -Rns $2
            fi
        done
    elif [ "$1" == "up" ]; then
        yay -Syu
        yay -Yc
        yay -Scc
    elif [ "$1" == "l" ]; then
        yay -Qe
    elif [ "$1" == "lg" ]; then
        yay -Qe | grep -i $2
    elif [ "$1" == "q" ]; then
        yay -Ss $2
    fi

fi

exit 0
