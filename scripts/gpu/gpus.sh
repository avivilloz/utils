#!/bin/bash

if [ "$1" = "nvidia" ]; then
    sed -i 's/#export GBM_BACKEND/export GBM_BACKEND/g' ~/.bash_profile > /dev/null
    sed -i 's/#export __GLX_VENDOR_LIBRARY_NAME/export __GLX_VENDOR_LIBRARY_NAME/g' ~/.bash_profile > /dev/null
#    sudo sed -i 's/#WaylandEnable/WaylandEnable/g' /etc/gdm/custom.conf > /dev/null
elif [ "$1" = "integrated" ]; then
    if grep -Fxq "#export GBM_BACKEND=nvidia-drm" ~/.bash_profile; then
        echo GBM_BACKEND is already commented
    else
        sed -i 's/export GBM_BACKEND/#export GBM_BACKEND/g' ~/.bash_profile > /dev/null
    fi

    if grep -Fxq "#export __GLX_VENDOR_LIBRARY_NAME=nvidia" ~/.bash_profile; then
        echo __GLX_VENDOR_LIBRARY_NAME is already commented
    else
        sed -i 's/export __GLX_VENDOR_LIBRARY_NAME/#export __GLX_VENDOR_LIBRARY_NAME/g' ~/.bash_profile > /dev/null
    fi
        
#    if grep -Fxq "#WaylandEnable=false" /etc/gdm/custom.conf; then
#        echo WaylandEnable is already commented
#    else
#        sudo sed -i 's/WaylandEnable/#WaylandEnable/g' /etc/gdm/custom.conf > /dev/null
#    fi
fi

. ~/.session_variables

sudo envycontrol --dm $display_manager -s $1

echo do you want to reboot the system? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo reboot
fi
