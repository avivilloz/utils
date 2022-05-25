#!/bin/bash

echo -------------------------------------------------------------------------
echo setup vim
echo -------------------------------------------------------------------------

echo do you want to setup vim? [y/n]
read ans
if [ $ans  = "y" ]; then
    ln -sf ~/git/utils/dotfiles/.vimrc ~/.vimrc

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

    #root
    sudo ln -sf ~/.vim /root/.vim
fi
