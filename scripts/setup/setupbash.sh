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
echo setup bash
echo -------------------------------------------------------------------------

echo do you want to create bash links? [y/n]
read ans
if [ $ans  = "y" ]; then
    #home
    ln -sf ~/git/utils/dotfiles/bash/.bashrc ~/.bashrc
    ln -sf ~/git/utils/dotfiles/bash/.aliases ~/.aliases
    ln -sf ~/git/utils/dotfiles/bash/.variables ~/.variables

    #root
    sudo ln -sf ~/git/utils/dotfiles/bash/.bashrc /root/.bashrc
    sudo ln -sf ~/git/utils/dotfiles/bash/.aliases /root/.aliases
    sudo ln -sf ~/git/utils/dotfiles/bash/.variables /root/.variables
fi
