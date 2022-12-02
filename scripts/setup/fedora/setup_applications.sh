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
	steam \
	steam-devices \
	lutris \
	gamemode \
	mangohud \
	protontricks \
	antimicrox \
	transmission \
	gnome-tweaks

flatpak install \
	us.zoom.Zoom \
	md.obsidian.Obsidian \
	com.bitwarden.desktop \
	com.stremio.Stremio \
	com.visualstudio.code \
	com.mattjakeman.ExtensionManager \
	com.rafaelmardojai.Blanket \
	net.davidotek.pupgui2

sudo dnf remove -y \
	totem \
	gnome-photos \
	cheese

#	davinci-resolve \
#	aseprite \
#	pureref
