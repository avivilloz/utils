#!/bin/bash

echo -------------------------------------------------------------------------
echo make bash default
echo -------------------------------------------------------------------------

echo do you want to change terminal to bash? [y/n]
read ans
if [ $ans  = "y" ]; then
    chsh -s /bin/bash
fi

echo -------------------------------------------------------------------------
echo create link for directories on sda in home
echo -------------------------------------------------------------------------

echo do you want to create link to /mnt/sda1 in /? [y/n]
read ans
if [ $ans  = "y" ]; then
    sudo ln -sf /mnt/sda1 /sda1
fi

echo -------------------------------------------------------------------------
echo setup bash
echo -------------------------------------------------------------------------

echo do you want to move current .bashrc to .bashrc_system? [y/n]
read ans
if [ $ans  = "y" ]; then
    mv ~/.bashrc ~/.bashrc_system
fi

echo do you want to create bash links? [y/n]
read ans
if [ $ans  = "y" ]; then
    ln -sf ~/git/cfg/.bashrc ~/.bashrc
    ln -sf ~/git/cfg/.bash_aliases ~/.bash_aliases
    ln -sf ~/git/cfg/.bash_variables ~/.bash_variables
fi

echo -------------------------------------------------------------------------
echo setup vim
echo -------------------------------------------------------------------------

echo do you want to setup vim? [y/n]
read ans
if [ $ans  = "y" ]; then
    ln -sf ~/git/cfg/.vimrc ~/.vimrc
    mkdir ~/.vim
    mkdir ~/.vim/autoload
    mkdir ~/.vim/plugged
    mkdir ~/.vim/.backup
    mkdir ~/.vim/.undo
    mkdir ~/.vim/.swap
    git clone https://github.com/junegunn/vim-plug.git
    mv vim-plug/plug.vim ~/.vim/autoload/
    rm -rf vim-plug
fi

echo -------------------------------------------------------------------------
echo calling vim PlugInstall
echo -------------------------------------------------------------------------

echo do you want to call PlugInstall on vim? [y/n]
read ans
if [ $ans  = "y" ]; then
    vim -c PlugInstall -c q -c q!
fi

echo -------------------------------------------------------------------------
echo setup git
echo -------------------------------------------------------------------------

echo do you want to setup git? [y/n]
read ans
if [ $ans  = "y" ]; then
    . ~/.bash_variables
    git config --global user.email $git_user_email
    git config --global user.name $git_user_name
fi

echo -------------------------------------------------------------------------
echo setup alacritty
echo -------------------------------------------------------------------------

echo do you want to setup alacritty? [y/n]
read ans
if [ $ans  = "y" ]; then
    cp ~/git/cfg/.config/alacritty/alacritty.yml ~/.config/alacritty/
fi

cd

exit 0
