#!/bin/bash

echo -------------------------------------------------------------------------
echo Dnf
echo -------------------------------------------------------------------------
sudo dnf upgrade --refresh
sudo dnf autoremove
sudo dnf clean packages
echo -------------------------------------------------------------------------
echo Flatpak
echo -------------------------------------------------------------------------
flatpak update
flatpak uninstall --unused