# Script tested on Ubuntu Server 26.04 AMD64 via on virtual machine VirtualBox 7.2.8 for Windows.
# Script runned as superuser.

#!/bin/bash

apt update
apt remove snapd
apt install wayland-protocols xwayland # GUI
apt install kwin_wayland # Wayland compositor
apt install libwaykitgtk-6.0-4 # WebView

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
    apt install npm
    npm install --save-dev @tauri-apps/cli@latest
fi