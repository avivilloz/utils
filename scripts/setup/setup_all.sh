#!/bin/bash

# run as user (not root) after arch install and reboot
bash ~/git/utils/scripts/setup/setup_wifi.sh
bash ~/git/utils/scripts/setup/setup_bash.sh
bash ~/git/utils/scripts/setup/setup_vim.sh
bash ~/git/utils/scripts/setup/setup_git.sh
bash ~/git/utils/scripts/setup/setup_package_managers.sh
bash ~/git/utils/scripts/setup/setup_desktop_environment.sh
bash ~/git/utils/scripts/setup/setup_applications.sh
