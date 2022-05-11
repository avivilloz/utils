#!/bin/bash

yay -Syu
yay -Yc
flatpak update
flatpak uninstall --unused
sudo snap refresh
