#!/usr/bin/env bash
NVIM_VERSION="v0.4.4"

echo "Install NeoVim..."

# Dependecies
bash ./install_nodejs.sh
sudo apt install python3-dev python3-pip curl exuberant-ctags shellcheck
pip3 install --user pynvim neovim flake8 msgpack

# Download nvim
wget "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz"
tar zxvf nvim-linux64.tar.gz
cp -r nvim-linux64/* $HOME/.local
rm -r nvim-linux64
rm nvim-linux64.tar.gz

ln -sf $HOME/dotfiles/nvim ~/.config/nvim
nvim
