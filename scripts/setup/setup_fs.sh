#!/bin/bash

echo -------------------------------------------------------------------------
echo setup your file system
echo -------------------------------------------------------------------------

echo do you want to link files from utils to your file system? [y/n]
read ans
if [ $ans  = "y" ]; then
	echo "username:"
	read username
	real_user="/home/$username"
	utils_fs_dir="$real_user/git/utils/fs"

	etc="$utils_fs_dir/etc"
	for file in $etc/*; do
		if [ -f $file ]; then
			link=${file#"$utils_fs_dir"}
			rm -rf $link
			ln -sf $file $link
		fi
	done

	usr_share="$utils_fs_dir/usr/share"
	for file in $usr_share/*; do
		if [ -f $file ] || [ -d $file ]; then
			link=${file#"$utils_fs_dir"}
			rm -rf $link
			ln -sf $file $link
		fi
	done

	#only files in home/user
	user="$utils_fs_dir/home/user"
	for file in $user/* $user/.[^.]*; do
		if [ -f $file ]; then
			user_link="$real_user${file#"$user"}"
			root_link="/root${file#"$user"}"
			rm -rf $user_link
			ln -sf $file $user_link
			rm -rf $root_link
			ln -sf $file $root_link
		fi
	done

	user_config="$user/.config"
	real_user_config="$real_user/.config"
	for file in $user_config/*; do
		if [ -f $file ] || [ -d $file ]; then
			link="$real_user_config${file#"$user_config"}"
			rm -rf $link
			ln -sf $file $link
		fi
	done

	user_local_share="$user/.local/share"
	real_user_local_share="$real_user/.local/share"
	for file in $user_local_share/*; do
		if [ -f $file ] || [ -d $file ]; then
			link="$real_user_local_share${file#"$user_local_share"}"
			rm -rf $link
			ln -sf $file $link
		fi
	done

	#directories in home/user
	rm -rf $real_user/.fonts
	ln -sf $user/.fonts $real_user/.fonts
fi
