#!/bin/bash

echo -------------------------------------------------------------------------
echo setup network
echo -------------------------------------------------------------------------

echo do you want to setup network? [y/n]
read ans
if [ $ans  = "y" ]; then
	echo "wifi host:"
	read host
	echo "password:"
	read password
	echo "sudo nmcli device wifi connect $host password $password"
	nmcli device wifi connect $host password $password
fi
