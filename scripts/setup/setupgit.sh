#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
    . ~/.variables

	mkdir -p ~/.ssh
	cd ~/.ssh
	cp -rf ~/git/utils/dotfiles/ssh/config .

	for key in ${!git_users[@]}; do
		ssh-keygen -t ed25519 -C "${git_users[${key}]}" -f "id_ed25519_${key}"
	done
fi
