#!/usr/bin/env bash
if [ -z "$1" ]; then
    NVIM_VERSION="v0.5.1"
else
    NVIM_VERSION=$1
fi
DOTFILES_ROOT="$HOME/.dotfiles"

echo "Install NeoVim..."

# Dependecies
bash ./install_nodejs.sh
sudo apt install python3-dev python3-pip curl exuberant-ctags shellcheck cppcheck
pip3 install --user pynvim neovim flake8 msgpack pycodestyle

# Download nvim
wget "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz"
tar zxvf nvim-linux64.tar.gz
cp -r nvim-linux64/* "$HOME"/.local
rm -r nvim-linux64
rm nvim-linux64.tar.gz

# Get config
pushd "$DOTFILES_ROOT" || exit
stow nvim
popd || exit
