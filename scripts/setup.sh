# Script tested on Ubuntu Server 26.04 AMD64 via on virtual machine VirtualBox 7.2.8 for Windows.
# Script runned as superuser.
# TODO: move all the RM to the end of the script.

#!/bin/bash

echo $(uname -m) # Getting system archicture.

# System edition
sudo systemctl stop systemd-networkd-wait-online.service
sudo systemctl disable systemd-networkd-wait-online.service
apt remove snapd # Optional
sudo apt remove vim-gtk3 vim-nox vim-motif vim # Optional

# Installing depedencies
apt update
apt install flatpak
apt install 7zip
## TUI
apt install twin # Terminal window manager (Watning: Unstable, in constant development.)
curl -fsSL https://raw.githubusercontent.com/sinelaw/fresh/refs/heads/master/scripts/install.sh | sh
curl -fL --progress-bar -o edit-archive.tar.gz \
    "https://github.com/microsoft/edit/releases/download/v2.0.0/edit-2.0.0-$(uname -m)-linux-gnu.tar.gz"
tar -xzf edit-archive.tar.gz -C /usr/bin
rm edit*

## GUI
apt install wayland-protocols xwayland # Core
apt install kwin_wayland # Wayland compositor
apt install libwaykitgtk-6.0-4 # WebView
apt install kdialog # Dialgogs
apt install powerdevil # In tty battery Management
apt-get install plasma-workspace *snapd-*- snapd*-
# apt install polkit-kde-agent-1 # GUI user auth (not sure that's the good option... It's possible to create another one.)
apt install xdg-desktop-portal-kde # Flatpak GUI implentation
wget -O material-decoration.deb \
  "https://github.com/guiodic/material-decoration/releases/download/26.09.07/material-decoration-26.09.07-Linux.deb" # Material decoration

apt install ./material-decoration.deb
rm ./material-decoration.deb

# Apps
apt install konsole
apt install dolphin # To edit later, for development.

read -p "Change keyboard method ? [Y/n] " -n 1 -r # Only for keyboard changes.
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    dpkg-reconfigure keyboard-configuration
    setupcon
fi

read -p "Install Dev Tools ? [Y/n] " -n 1 -r # Developper Only. Check https://tauri.app/reference/cli/ for references.
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    apt install openssh-server
    apt install rustc
    apt install npm
    npm install --save-dev @tauri-apps/cli@latest
fi

cat load.sh >> # Setting up the file to load automatically as superuser on startup.