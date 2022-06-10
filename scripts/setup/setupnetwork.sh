#!/bin/bash

echo -------------------------------------------------------------------------
echo setup network
echo -------------------------------------------------------------------------

echo do you want to setup network? [y/n]
read ans
if [ $ans  = "y" ]; then
	host=
	password=
	sudo nmcli device wifi connect $host password $password
fi
