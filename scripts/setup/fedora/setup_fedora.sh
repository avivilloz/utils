#!/bin/bash

echo blacklist pcspkr | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null

echo hostname:
read new_hostname
sudo hostnamectl set-hostname "$new_hostname"

sudo passwd root

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

sudo dnf groupupdate multimedia --setup="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

# nvidia settings
sudo dnf install -y \
	akmod-nvidia \
	xorg-x11-drv-nvidia-cuda \
	xorg-x11-drv-nvidia-cuda-libs \
	xorg-x11-drv-nvidia-power
sudo systemctl enable nvidia-{suspend,resume,hibernate}
sudo dnf install vulkan -y
sudo dnf install vdpauinfo libva-vdpau-driver libva-utils -y

sudo mkdir -p /etc/X11/xorg.conf.d/
echo "\
#This file is provided by xorg-x11-drv-nvidia
#Do not edit

Section \"OutputClass\"
	Identifier \"nvidia\"
	MatchDriver \"nvidia-drm\"
	Driver \"nvidia\"
	Option \"AllowEmptyInitialConfiguration\"
	Option \"SLI\" \"Auto\"
	Option \"BaseMosaic\" \"on\"
	#Option \"PrimaryGPU\" \"yes\"
EndSection

Section \"ServerLayout\"
	Identifier \"layout\"
	Option \"AllowNVIDIAGPUScreens\"
EndSection" | sudo tee -a /etc/X11/xorg.conf.d/nvidia.conf > /dev/null

# gdm settings
mkdir -p /etc/systemd/system/gdm.service.d/
echo "\
[Service]
ExecStartPre=/bin/cp $HOME/.config/monitors.xml /var/lib/gdm/.config/monitors.xml" | sudo tee -a /etc/systemd/system/gdm.service.d/override.conf > /dev/null

echo "\
[org/gnome/desktop/peripherals/touchpad]
tap-to-click=true" | sudo tee -a /etc/dconf/db/gdm.d/06-tap-to-click > /dev/null

sudo dnf install -y numlockx
echo "\
if [ -x /usr/bin/numlockx ]; then
      /usr/bin/numlockx on
fi" | tee -a ~/.xprofile > /dev/null

bash ~/git/utils/scripts/setup/fedora/setup_applications.sh
bash ~/git/utils/scripts/setup/setup_base.sh
bash ~/git/utils/scripts/setup/setup_mpd.sh
