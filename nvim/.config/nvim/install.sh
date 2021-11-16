#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Install package manager
# -----------------------------------------------------------------------------
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# -----------------------------------------------------------------------------
# Install language servers
# -----------------------------------------------------------------------------
# Python
npm install -g pyright

# C, C++
sudo apt install clangd-12
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

# Latex, Bibtex, markdown, R, Org
wget https://github.com/valentjn/ltex-ls/releases/download/15.1.0/ltex-ls-15.1.0-linux-x64.tar.gz
tar zxvf ltex-ls-15.1.0-linux-x64.tar.gz
rm ltex-ls-15.1.0-linux-x64.tar.gz
mv ltex-ls-15.1.0 ~/.local
cd ~/.local/bin || exit
ln -s ../ltex-ls-15.1.0/bin/ltex-cli .
ln -s ../ltex-ls-15.1.0/bin/ltex-ls .


# -----------------------------------------------------------------------------
# Install linters
# -----------------------------------------------------------------------------
# Python
pip install --user pycodestyle==2.6.0

# C, C++
sudo apt install cppcheck

# Shell
sudo apt install shellcheck
