#!/bin/bash

echo -------------------------------------------------------------------------
echo bash
echo -------------------------------------------------------------------------

echo do you want to make bash your default terminal session? [y/n]
read ans
if [ $ans  = "y" ]; then
    chsh -s /bin/bash
fi

echo do you want to create links to customized bash files? [y/n]
read ans
if [ $ans  = "y" ]; then
    bash_dotfiles=~/git/utils/dotfiles/bash

    ln -sf $bash_dotfiles/bashrc ~/.bashrc
    ln -sf $bash_dotfiles/aliases ~/.aliases
    ln -sf $bash_dotfiles/variables ~/.variables
    cp $bash_dotfiles/session_variables ~/.session_variables
    vim ~/.session_variables

    sudo ln -sf $bash_dotfiles/bashrc /root/.bashrc
    sudo ln -sf $bash_dotfiles/aliases /root/.aliases
    sudo ln -sf $bash_dotfiles/variables /root/.variables
    sudo ln -sf ~/session_variables /root/.session_variables
fi
