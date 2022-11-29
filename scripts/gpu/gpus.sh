#!/bin/bash

. ~/.session_variables

if [ "$base_distro" = "arch" ];then

    if [ "$1" = "nvidia" ]; then
        sudo envycontrol --dm $display_manager -s $1
        sudo sed -i 's/#WaylandEnable/WaylandEnable/g' /etc/gdm/custom.conf > /dev/null
    else
        if ! grep -Fq "#WaylandEnable=false" /etc/gdm/custom.conf; then
            sudo sed -i 's/WaylandEnable/#WaylandEnable/g' /etc/gdm/custom.conf > /dev/null
        fi
    fi

elif [ "$base_distro" = "fedora" ];then

    if [ "$1" = "nvidia" ]; then
        sudo sed -i 's/#Option "PrimaryGPU" "yes"/Option "PrimaryGPU" "yes"/g' /etc/X11/xorg.conf.d/nvidia.conf > /dev/null
        sudo sed -i 's/#WaylandEnable/WaylandEnable/g' /etc/gdm/custom.conf > /dev/null
    elif [ "$1" = "hybrid" ]; then

        if ! grep -Fq '#Option "PrimaryGPU" "yes"' /etc/X11/xorg.conf.d/nvidia.conf; then
            sudo sed -i 's/Option "PrimaryGPU" "yes"/#Option "PrimaryGPU" "yes"/g' /etc/X11/xorg.conf.d/nvidia.conf > /dev/null
        fi

        if ! grep -Fq "#WaylandEnable=false" /etc/gdm/custom.conf; then
            sudo sed -i 's/WaylandEnable/#WaylandEnable/g' /etc/gdm/custom.conf > /dev/null
        fi

    fi

fi

echo do you want to reboot the system? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo reboot
fi
