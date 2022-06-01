#!/bin/bash

sudo dnf upgrade --refresh
sudo dnf autoremove
sudo dnf clean packages
flatpak update
flatpak uninstall --unused
