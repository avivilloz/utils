#!/bin/bash

echo hostname:
read new_hostname
sudo hostnamectl set-hostname "$new_hostname"

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

sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y
sudo dnf install xorg-x11-drv-nvidia-cuda-libs -y
sudo dnf install xorg-x11-drv-nvidia-power -y
sudo systemctl enable nvidia-{suspend,resume,hibernate}
# Optional: tweak "nvidia options NVreg_TemporaryFilePath=/var/tmp" from /etc/modprobe.d/nvidia.conf as needed if you have issue with /tmp as tmpfs with nvidia suspend )
sudo dnf install vulkan -y
