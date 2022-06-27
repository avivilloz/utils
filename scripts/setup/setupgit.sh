#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
    . ~/.variables
	for key in ${!git_users[@]}; do
		bash ~/git/utils/scripts/git/git_ssh_keygen.sh ${key} ${git_users[${key}]}
	done
fi
