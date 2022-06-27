#!/bin/bash

echo -------------------------------------------------------------------------
echo setup ssh
echo -------------------------------------------------------------------------

echo do you want to setup ssh? [y/n]
read ans
if [ $ans  = "y" ]; then
	. ~/.variables
	mkdir -p ~/.ssh
	cd ~/.ssh
	cp ~/git/utils/dotfiles/ssh/.ssh/config .
	ssh-keygen -t ed25519 -C "$git_user_email" -f id_ed25519_avivilloz
fi
