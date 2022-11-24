#!/bin/bash

echo -------------------------------------------------------------------------
echo setup vim
echo -------------------------------------------------------------------------

echo do you want to setup vim? [y/n]
read ans
if [ $ans  = "y" ]; then
	vim_dotfiles=~/git/utils/dotfiles/vim

	ln -sf $vim_dotfiles/.vimrc ~/.vimrc

	mkdir ~/.vim
	mkdir ~/.vim/autoload
	mkdir ~/.vim/plugged
	mkdir ~/.vim/.backup
	mkdir ~/.vim/.undo
	mkdir ~/.vim/.swap

	git clone https://github.com/junegunn/vim-plug.git
	mv vim-plug/plug.vim ~/.vim/autoload/
	rm -rf vim-plug

	vim -c PlugInstall -c q -c q!

	sudo ln -sf $vim_dotfiles/.vimrc /root/.vimrc
	sudo ln -sf ~/.vim /root/.vim
fi
