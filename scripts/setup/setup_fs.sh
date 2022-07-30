#!/bin/bash

echo -------------------------------------------------------------------------
echo setup your file system
echo -------------------------------------------------------------------------

echo do you want to link files from utils to your file system? [y/n]
read ans
if [ $ans  = "y" ]; then
	echo "username:"
	read username
	real_home="/home/$username"
	utils_fs_dir="$real_home/git/utils/fs"

	etc="$utils_fs_dir/etc"
	if [ -f $etc ]; then
		for file in $etc/*; do
			if [ -f $file ]; then
				link=${file#"$utils_fs_dir"}
				rm -rf $link
				ln -sf $file $link
			fi
		done
	fi

	usr_share="$utils_fs_dir/usr/share"
	if [ -f $usr_share ]; then
		for file in $usr_share/*; do
			if [ -f $file ] || [ -d $file ]; then
				link=${file#"$utils_fs_dir"}
				rm -rf $link
				ln -sf $file $link
			fi
		done
	fi

	#only files in home
	home="$utils_fs_dir/home"
	for file in $home/* $home/.[^.]*; do
		if [ -f $file ]; then
			home_link="$real_home${file#"$home"}"
			root_link="/root${file#"$home"}"
			rm -rf $home_link
			ln -sf $file $home_link
			rm -rf $root_link
			ln -sf $file $root_link
		fi
	done

	#directories in home
	rm -rf $real_home/.fonts
	ln -sf $home/.fonts $real_home/.fonts

	home_config="$home/.config"
	real_home_config="$real_home/.config"
	mkdir -p $real_home_config
	for file in $home_config/*; do
		if [ -f $file ] || [ -d $file ]; then
			link="$real_home_config${file#"$home_config"}"
			rm -rf $link
			ln -sf $file $link
		fi
	done

	home_local_share="$home/.local/share"
	real_home_local_share="$real_home/.local/share"
	mkdir -p $real_home_local_share
	for file in $home_local_share/*; do
		if [ -f $file ] || [ -d $file ]; then
			link="$real_home_local_share${file#"$home_local_share"}"
			rm -rf $link
			ln -sf $file $link
		fi
	done
fi
