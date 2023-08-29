#!/bin/bash

echo -------------------------------------------------------------------------
echo setup package pacman
echo -------------------------------------------------------------------------

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
pacman -S glibc linux-api-headers
