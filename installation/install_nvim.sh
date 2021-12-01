#!/usr/bin/env bash
if [ -z "$1" ]; then
    NVIM_VERSION="v0.6.0"
else
    NVIM_VERSION=$1
fi
DOTFILES_ROOT="$HOME/.dotfiles"

echo "Install NeoVim..."


# -----------------------------------------------------------------------------
# Dependecies
# -----------------------------------------------------------------------------
bash ./install_nodejs.sh
sudo apt install python3-dev python3-pip curl exuberant-ctags
pip install --user pynvim neovim msgpack


# -----------------------------------------------------------------------------
# Download nvim
# -----------------------------------------------------------------------------
wget "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz"
tar zxvf nvim-linux64.tar.gz
cp -r nvim-linux64/* "$HOME"/.local
rm -r nvim-linux64
rm nvim-linux64.tar.gz


# -----------------------------------------------------------------------------
# Install package manager
# -----------------------------------------------------------------------------
git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"


# -----------------------------------------------------------------------------
# Install language servers (manually)
# -----------------------------------------------------------------------------
# Python
# npm install -g pyright

# Bash
# npm install -g bash-language-server

# C, C++
# sudo apt install clangd-12
# sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

# Latex, Bibtex, markdown, R, Org
# wget https://github.com/valentjn/ltex-ls/releases/download/15.1.0/ltex-ls-15.1.0-linux-x64.tar.gz
# tar zxvf ltex-ls-15.1.0-linux-x64.tar.gz
# rm ltex-ls-15.1.0-linux-x64.tar.gz
# mv ltex-ls-15.1.0 "$HOME/.local"
# pushd "$HOME/.local/bin" || exit
# ln -s ../ltex-ls-15.1.0/bin/ltex-cli .
# ln -s ../ltex-ls-15.1.0/bin/ltex-ls .
# popd || exit


# -----------------------------------------------------------------------------
# Install linters for style check
# -----------------------------------------------------------------------------
# Python
pip install --user pycodestyle

# Shell
sudo apt install shellcheck

# C, C++
sudo apt install cppcheck


# -----------------------------------------------------------------------------
# Get configuration
# -----------------------------------------------------------------------------
pushd "$DOTFILES_ROOT" || exit
stow nvim
popd || exit

echo "Please open nvim and type the command [:PackerInstall] to install the plugins"
