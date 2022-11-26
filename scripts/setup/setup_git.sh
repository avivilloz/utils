#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
	vim ~/.variables
	. ~/.variables
	git config --global user.name $git_name
	git config --global user.email $git_email
	for key in ${!git_users[@]}; do
		bash ~/git/utils/scripts/git/git_ssh_keygen.sh ${key} ${git_users[${key}]}
	done
fi
