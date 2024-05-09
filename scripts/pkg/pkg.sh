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
                if  [[ ! $(dnf list installed | grep -i $pkg) ]]; then
                    flatpak install $pkg
                fi
            fi
        done
    elif [ "$1" == "rm" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo dnf remove $2 -y
                flatpak uninstall $2
            fi
        done
    elif [ "$1" == "up" ]; then
        sudo dnf upgrade --refresh -y
        sudo dnf autoremove -y
        sudo dnf clean packages -y
        flatpak update
        flatpak uninstall --unused
    elif [ "$1" == "l" ]; then
        dnf list installed
        flatpak list
    elif [ "$1" == "lg" ]; then
        dnf list installed | grep -i $2
        flatpak list --app | grep -i $2
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
                if  [[ ! $(yay -Qe | grep -i $pkg) ]]; then
                    flatpak install $pkg
                fi
            fi
        done
    elif [ "$1" == "rm" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                yay -Rns $2
                flatpak uninstall $2
            fi
        done
    elif [ "$1" == "up" ]; then
        yay -Syu
        yay -Yc
        yay -Scc
        flatpak update
        flatpak uninstall --unused
    elif [ "$1" == "l" ]; then
        yay -Qe
        flatpak list
    elif [ "$1" == "lg" ]; then
        yay -Qe | grep -i $2
        flatpak list --app | grep -i $2
    elif [ "$1" == "q" ]; then
        yay -Ss $2
    fi

elif [ "$base_distro" == "deck" ]; then
    if [ "$1" == "r" ]; then
        sudo pacman -Syy
    elif [ "$1" == "ss" ]; then
        sudo pacman -Syy
        sudo pacman -Sua
    elif [ "$1" == "u" ]; then
        sudo pacman -S $2
    elif [ "$1" == "in" ]; then
        sudo pacman -Syy
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo pacman -S --needed $2
                if  [[ ! $(sudo pacman -Qe | grep -i $pkg) ]]; then
                    flatpak install $pkg
                fi
            fi
        done
    elif [ "$1" == "rm" ]; then
        for pkg in "$@"; do
            if [ "$pkg" != "$1" ]; then
                sudo pacman -Rns $2
                flatpak uninstall $2
            fi
        done
    elif [ "$1" == "up" ]; then
        sudo pacman -Syu
        sudo pacman -Yc
        sudo pacman -Scc
        flatpak update
        flatpak uninstall --unused
    elif [ "$1" == "l" ]; then
        sudo pacman -Qe
        flatpak list
    elif [ "$1" == "lg" ]; then
        sudo pacman -Qe | grep -i $2
        flatpak list --app | grep -i $2
    elif [ "$1" == "q" ]; then
        sudo pacman -Ss $2
    fi

fi

exit 0
