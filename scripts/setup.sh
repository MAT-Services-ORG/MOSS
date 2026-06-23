# Script tested on Ubuntu Server 26.04 AMD64 via on virtual machine VirtualBox 7.2.8 for Windows.
# Script runned as superuser.

#!/bin/bash

# Only for keyboard changes.
# dpkg-reconfigure keyboard-configuration
# setupcon

apt update
apt remove snapd
apt install wayland-protocols xwayland # GUI
apt install kwin_wayland # Wayland compositor
