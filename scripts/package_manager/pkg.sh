#!/bin/bash

. ~/.session_variables

# in = install package
# rm = remove package
# up = update all packages and remove uneeded ones
# l = list all packages

if [ "$session" == "debian" ]; then
    if [ "$1" == "in" ]; then
        sudo apt install $2
    elif [ "$1" == "rm" ]; then
        sudo apt remove $2
    elif [ "$1" == "up" ]; then
        sudo apt update
        sudo apt upgrade
        sudo apt autoremove
    fi
elif [ "$session" == "ubuntu" ]; then
    if [ "$1" == "in" ]; then
        sudo snap install $2
    elif [ "$1" == "rm" ]; then
        sudo snap remove $2
    elif [ "$1" == "up" ]; then
        sudo snap refresh
    elif [ "$1" == "l" ]; then
        snap list
    fi
fi

exit 0
