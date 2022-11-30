# apps
sudo dnf install -y \
	vim \
	git \
	mpv \
	mpc \
	mpd \
	ncmpcpp \
	htop \
	tree \
	ranger \
	neofetch \
	audacity \
	obs-studio \
	gimp \
	godot \
	flameshot \
	timeshift \
	discord \
	stacer \
	google-chrome-stable \
	solaar \
	inkscape \
	blender \
	fragments \
	steam \
	steam-devices \
	gamemode \
	mangohud \
	protontricks \
	antimicrox \
	gnome-tweaks

sudo sed -i 's/PrefersNonDefaultGPU=true/#PrefersNonDefaultGPU=true/g' /usr/share/applications/steam.desktop
sudo sed -i 's/X-KDE-RunOnDiscreteGpu=true/#X-KDE-RunOnDiscreteGpu=true/g' /usr/share/applications/steam.desktop

flatpak install \
	us.zoom.Zoom \
	md.obsidian.Obsidian \
	com.bitwarden.desktop \
	com.stremio.Stremio \
	com.visualstudio.code \
	com.mattjakeman.ExtensionManager \
	com.rafaelmardojai.Blanket \
	net.davidotek.pupgui2

#	davinci-resolve \
#	aseprite \
#	pureref
