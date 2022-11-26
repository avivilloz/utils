#!/bin/bash

if [ "$1" = "nvidia" ]; then
    echo nvidia
    echo export GBM_BACKEND=nvidia-drm >> ~/.bash_profile
    echo export __GLX_VENDOR_LIBRARY_NAME=nvidia >> ~/.bash_profile
    # uncomment in /etc/gdm/gdm.conf #WaylandEnable=False
elif [ "$1" = "integrated" ]; then
    echo integrated
    echo #export GBM_BACKEND=nvidia-drm >> ~/.bash_profile
    echo #export __GLX_VENDOR_LIBRARY_NAME=nvidia >> ~/.bash_profile
    # comment back in /etc/gdm/gdm.conf #WaylandEnable=False
fi

. ~/.session_variables

sudo envycontrol --dm $display_manager -s $1"
