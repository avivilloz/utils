#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
	vim ~/.variables

	. ~/.variables
	. ~/.session_variables

	git config --global user.name $git_name
	git config --global user.email $git_email

	if [ "$base_distro" = "arch" ]; then
		sudo pacman -S openssh -needed
	fi

	for key in ${!git_users[@]}; do
		bash ~/git/utils/scripts/git/git_ssh_keygen.sh ${key} ${git_users[${key}]}
	done

	cd ~/git/utils
	git remote set-url origin git@github.com:avivilloz/utils.git
fi
