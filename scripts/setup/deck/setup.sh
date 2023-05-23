#!/bin/bash


echo Is initial setup? [y/n]
read ans
if [ $ans  = "y" ]; then
    bash ~/git/utils/scripts/setup/setup_base.sh
fi

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux

sudo cp /home/deck/git/utils/dotfiles/pacman/pacman.conf /etc

bash ~/git/utils/scripts/setup/deck/setup_package_managers.sh
bash ~/git/utils/scripts/setup/deck/setup_applications.sh
