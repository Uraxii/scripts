#!/bin/bash

# ===== SCRIPT VARS =====
GODOT_VERSION="4"
NODE_VERSION="v22.9.0"

#===== Install Repos and GPG Keys =====#
echo "Getting GPG keys and adding external repositoreis ..."
# Neovim
add-apt-repository ppa:neovim-ppa/unstable -y

# Wine
wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main' 

# Unity Hub
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'

mkdir /tmp/uraxii_setup

# ===== DOWNLOAD PACKAGES ======
echo "Downloading internet packages ..."
echo "Node.js ..."
wget -O /tmp/uraxii_setup/node-$NODE_VERSION.tar.gz https://nodejs.org/dist/latest/node-$NODE_VERSION.tar.gz # Node.js
echo "Neovim config..."
wget -O /tmp/uraxii_setup/neovim_config.zip https://github.com/Uraxii/kickstart.nvim/archive/refs/heads/master.zip # Neovim

# ===== INSTALL APPLICATIONS =====
echo "Running apt-get update ..."
apt-get update
echo "Running apt-get upgrade ..."
apt-get upgrade

echo "Installing applications ..."
echo "Unzip"
apt-get install unzip # Used for zip files
echo "build-essential ..."
apt-get install build-essential # Need for Make, C compiler, etc
echo "Discord ..."
snap install discord # Discord
echo "Git ..."
apt install git # Git
echo "gnome-shell-extension-manager ..."
apt install gnome-shell extension-manager
echo "Godot ..."
snap install godot-$GODOT_VERSION # Godot
echo "Neovim ..."
apt install neovim # Neovim
echo "Python venv ..."
apt install python3.12-venv
echo "Steam ..."
snap install steam # Steam
echo "Unity Hub ..."
apt-get install unityhub # Unity Hub
echo "Wine ..."
sudo apt install --install-recommends winehq-stable # Wine
echo "Xsel ..."
apt install xsel # Lets Neovim access the clipboard

# Node.js Install
echo "Node.js ..."
apt isntall nodejs

# NOT WORKING?
#tar -xvzf /tmp/uraxii_setup/node-$NODE_VERSION.tar.gz --directory /tmp/uraxii_setup
#cd /tmp/uraxii_setup/node-$NODE_VERSION
#./configure
#make
#sudo make install
#which node
#cd -
