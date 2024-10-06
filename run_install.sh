#!/bin/bash

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

# ===== WGET DOWNLOADS ======
echo "Downloading internet packages ..."
echo "Node.js ..."
wget -O /usr/local/src/node-latest.tar.gz https://nodejs.org/dist/latest/node-v22.9.0.tar.gz # Node.js
echo "Neovim ..."
wget -O /tmp/neovim_config.zip https://github.com/Uraxii/kickstart.nvim/archive/refs/heads/master.zip # Neovim

# ===== INSTALL APPLICATIONS =====
echo "Running apt-get update ..."
apt-get update
echo "Running apt-get upgrade ..."
apt-get upgrade

echo "Installing applications ..."
echo "Unzip"
apt-get install unzip
echo "build-essential ..."
apt-get install build-essential # Need for Make, C compiler, etc.
echo "Discord ..."
snap install discord
echo "Git ..."
apt install git # Git
echo "Neovim ..."
apt install neovim # Neovim
mkdir ~/.config/nvim
echo "Steam ..."
snap install steam # Steam
echo "Unity Hub ..."
apt-get install unityhub # Unity Hub
echo "Wine ..."
sudo apt install --install-recommends winehq-stable # Wine

# Node.js Install
echo "Node.js ..."
tar -xvzf /usr/local/src/node-latest
cd /usr/local/src/node-latest
./configure
make
sudo make install
which node
cd -
rm /usr/local/src/node-latest
rm /usr/local/src/node-latest.tar.gz
