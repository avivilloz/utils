#!/bin/bash 

# gdm settings
mkdir -p /etc/systemd/system/gdm.service.d/
echo "\
[Service]
ExecStartPre=/bin/cp $HOME/.config/monitors.xml /var/lib/gdm/.config/monitors.xml" | sudo tee -a /etc/systemd/system/gdm.service.d/override.conf > /dev/null
