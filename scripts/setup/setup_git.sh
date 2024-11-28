#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
	vim ~/.session_variables
	. ~/.session_variables

	git config --global user.name $git_name
	git config --global user.email $git_email

	if [ "$base_distro" = "arch" ]; then
		sudo pacman -S openssh -needed
	fi
fi
