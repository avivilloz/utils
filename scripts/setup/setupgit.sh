#!/bin/bash

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
    . ~/.variables
    #git config --global user.email $git_user_email
    #git config --global user.name $git_user_name
	mkdir -p ~/.ssh
	cd ~/.ssh
	cp -rf ~/git/utils/dotfiles/ssh/.ssh/config .
	ssh-keygen -t ed25519 -C "$git_user_email" -f id_ed25519_avivilloz

	sudo ln -sf ~/git /root/git
fi
