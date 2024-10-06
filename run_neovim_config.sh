#!/bin/bash

# Define a timestamp function
TIMESTAMP() {
    date +"%s"
}

echo "Installing Neovim config ..."
wget -O /tmp/neovim_config.zip https://github.com/Uraxii/kickstart.nvim/archive/refs/heads/master.zip # Neovimecho "Installing Neovim config ..."
unzip /tmp/neovim_config.zip -d /tmp
mv ~/.config/nvim ~/.config/nvim.bak.$(TIMESTAMP)
mv /tmp/kickstart.nvim-master ~/.config/nvim
