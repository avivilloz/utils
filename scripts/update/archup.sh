#!/bin/bash

yay -Syu
yay -Yc
yay -Scc
flatpak update
flatpak uninstall --unused
sudo snap refresh
