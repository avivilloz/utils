#!/bin/bash

echo blacklist pcspkr | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null

echo hostname:
read new_hostname
sudo hostnamectl set-hostname "$new_hostname"

sudo passwd root

bash ~/git/utils/scripts/setup/setup_base.sh

echo "\
# Added for speed:
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null

dnf clean all
sudo dnf update -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

# nvidia settings
sudo dnf install -y \
	akmod-nvidia \
	xorg-x11-drv-nvidia-cuda \
	xorg-x11-drv-nvidia-cuda-libs \
	xorg-x11-drv-nvidia-power \
sudo systemctl enable nvidia-{suspend,resume,hibernate}
sudo dnf install vulkan -y
sudo dnf install vdpauinfo libva-vdpau-driver libva-utils -y

sudo mkdir -p /etc/X11/xorg.conf.d/
echo "\
#This file is provided by xorg-x11-drv-nvidia
#Do not edit

Section "OutputClass"
	Identifier "nvidia"
	MatchDriver "nvidia-drm"
	Driver "nvidia"
	Option "AllowEmptyInitialConfiguration"
	Option "SLI" "Auto"
	Option "BaseMosaic" "on"
	#Option "PrimaryGPU" "yes"
EndSection

Section "ServerLayout"
	Identifier "layout"
	Option "AllowNVIDIAGPUScreens"
EndSection" | sudo tee -a /etc/X11/xorg.conf.d/nvidia.conf > /dev/null


# gdm settings
sudo ln -sf ~/.config/monitors.xml /var/lib/gdm/.config/monitors.xml
#follow https://www.reddit.com/r/gnome/comments/gppye4/w for tap-to-click true
#follow https://askubuntu.com/questions/977903/how-do-i-turn-numlock-on-for-login-screen-ubuntu-17-10-wayland for numlock-state on

bash ~/git/utils/scripts/setup/fedora/setup_applications.sh
bash ~/git/utils/scripts/setup/setup_mpd.sh
