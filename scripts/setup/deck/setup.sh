#/bin/bash


echo Is initial setup? [y/n]
read ans
if [ $ans  = "y" ]; then
    echo 'choose deck password:'
    passwd
    echo 'choose su password:'
    sudo passwd

    mkdir ~/Documents/deck
    sudo mv /etc/bash.bashrc /home/deck/Documents/deck

    bash ~/git/utils/scripts/setup/setup_base.sh
fi

#sudo steamos-readonly disable

#bash ~/git/utils/scripts/setup/deck/setup_pacman.sh
#bash ~/git/utils/scripts/setup/deck/setup_package_managers.sh
#bash ~/git/utils/scripts/setup/deck/setup_applications.sh

