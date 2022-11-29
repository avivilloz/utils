#!/bin/bash

bash ~/git/utils/scripts/setup/setup_git.sh

. ~/.session_variables

if [ "$display_manager" = "gdm" ]; then
    sudo mkdir -p /etc/systemd/system/gdm.service.d/
    echo "\
    [Service]
    ExecStartPre=/bin/cp $HOME/.config/monitors.xml /var/lib/gdm/.config/monitors.xml" | sudo tee -a /etc/systemd/system/gdm.service.d/override.conf > /dev/null
fi

sudo systemctl enable bluetooth
