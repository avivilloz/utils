#!/bin/bash

. ~/.session_variables

if [ "$base_distro" = "arch" ];then

    sudo envycontrol --dm $display_manager -s $1

elif [ "$base_distro" = "fedora" ];then

    if [ "$1" = "nvidia" ]; then
        sudo sed -i 's/#Option "PrimaryGPU" "yes"/Option "PrimaryGPU" "yes"/g' /etc/X11/xorg.conf.d/nvidia.conf > /dev/null
    elif [ "$1" = "hybrid" ]; then
        if ! grep -Fq '#Option "PrimaryGPU" "yes"' /etc/X11/xorg.conf.d/nvidia.conf; then
            sudo sed -i 's/Option "PrimaryGPU" "yes"/#Option "PrimaryGPU" "yes"/g' /etc/X11/xorg.conf.d/nvidia.conf > /dev/null
        fi
    fi

fi

echo do you want to reboot the system? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo reboot
fi
