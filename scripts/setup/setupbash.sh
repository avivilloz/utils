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
echo save system bashrc
echo -------------------------------------------------------------------------

echo do you want to move current .bashrc to .bashrc_system? [y/n]
read ans
if [ $ans  = "y" ]; then
    mv ~/.bashrc ~/.bashrc_system
fi

echo -------------------------------------------------------------------------
echo setup bash
echo -------------------------------------------------------------------------

echo do you want to create bash links? [y/n]
read ans
if [ $ans  = "y" ]; then
    ln -sf ~/git/utils/dotfiles/.bashrc ~/.bashrc
    ln -sf ~/git/utils/dotfiles/.aliases ~/.aliases
    ln -sf ~/git/utils/dotfiles/.variables ~/.variables
fi

exit 0
