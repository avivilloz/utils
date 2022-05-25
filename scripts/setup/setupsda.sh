#!/bin/bash

echo -------------------------------------------------------------------------
echo create link for sda1
echo -------------------------------------------------------------------------

echo do you want to create link to /mnt/sda1 in /? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo ln -sf /mnt/sda1 /sda1
fi

exit 0
