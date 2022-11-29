#!/bin/bash

echo are you logged as user? [y/n]
read ans
if [ $ans = "n" ]; then
	echo please login as user and not as root to continue!
	exit 1
fi

bash ~/git/utils/scripts/setup/arch/setup_wifi.sh
bash ~/git/utils/scripts/setup/setup_bash.sh
bash ~/git/utils/scripts/setup/setup_vim.sh
bash ~/git/utils/scripts/setup/arch/setup_package_managers.sh
bash ~/git/utils/scripts/setup/arch/setup_drivers.sh
bash ~/git/utils/scripts/setup/arch/setup_desktop_environment.sh
bash ~/git/utils/scripts/setup/arch/setup_applications.sh
bash ~/git/utils/scripts/setup/setup_mpd.sh
