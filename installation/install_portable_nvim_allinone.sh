#!/usr/bin/env bash
nodeversion="v17.9.0"
rgversion="13.0.0"
fdversion="v8.3.2"
nvim_version="v0.8.0"


# Export path (may change to zsh if needed)
mkdir -p "$HOME/.local" && mkdir -p "$HOME/.local/bin"

if [[ "$PATH" != *"$HOME/.local/bin"* || "$PATH" != *"$HOME/.local/nodejs/bin"* ]]; then
    echo "Adding paths..."
    cp "$HOME/.bashrc" "$HOME/.bashrc_bkup"
    echo "export 'PATH=$HOME/.local/bin:$HOME/.local/nodejs/bin:$PATH'" >> "$HOME/.bashrc"
    exec bash
fi

# -----------------------------------------------------------------------------
# Dependecies
# -----------------------------------------------------------------------------
# sudo apt install python3-dev python3-pip curl automake cmake curl
pip install --user pynvim


# -----------------------------------------------------------------------------
# Install nodejs
# -----------------------------------------------------------------------------
echo "Install NodeJS..."

# Download nodejs
wget "https://nodejs.org/dist/${nodeversion?}/node-${nodeversion?}-linux-x64.tar.xz"
tar xvf "node-${nodeversion?}-linux-x64.tar.xz" -C "$HOME/.local"
rm "node-${nodeversion?}-linux-x64.tar.xz"

# Remove old nodejs if exists
if [[ -f "$HOME/.local/node-js" ]]; then
    rm -rf "$HOME/.local/nodejs"
fi

# Link binary
ln -sf "$HOME/.local/node-${nodeversion?}-linux-x64" "$HOME/.local/nodejs"


# -----------------------------------------------------------------------------
# Install ripgrep
# -----------------------------------------------------------------------------
echo "Installing ripgrep..."
wget -qO- "https://github.com/BurntSushi/ripgrep/releases/download/${rgversion?}/ripgrep-${rgversion?}-x86_64-unknown-linux-musl.tar.gz" | tar -zxv
cp "ripgrep-${rgversion?}-x86_64-unknown-linux-musl/rg" "$HOME/.local/bin/"
rm -rf "ripgrep-${rgversion?}-x86_64-unknown-linux-musl"


# -----------------------------------------------------------------------------
# Install fd-find
# -----------------------------------------------------------------------------
echo "Installing fd-find..."
wget -qO- "https://github.com/sharkdp/fd/releases/download/${fdversion?}/fd-${fdversion?}-x86_64-unknown-linux-gnu.tar.gz" | tar -zxv
cp "fd-${fdversion?}-x86_64-unknown-linux-gnu/fd" "$HOME/.local/bin"
rm -rf "fd-${fdversion?}-x86_64-unknown-linux-gnu"


# -----------------------------------------------------------------------------
# Install universal ctags (not exuberant-ctags)
# Ref: https://github.com/universal-ctags/ctags
# -----------------------------------------------------------------------------
# echo "Installing universal-ctags..."
# git clone https://github.com/universal-ctags/ctags.git
# pushd ctags || exit
# ./autogen.sh
# ./configure --prefix="$HOME/.local"  # defaults to /usr/local
# make
# make install # may require extra privileges depending on where to install
# popd || exit
# rm -rf ctags


# -----------------------------------------------------------------------------
# Install linters for style check
# -----------------------------------------------------------------------------
# echo "Installing linters..."

# Python
# pip install --user pycodestyle pylama black

# Shell
# scversion="stable" # or "v0.4.7", or "latest"
# wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
# cp "shellcheck-${scversion?}/shellcheck" "$HOME/.local/bin/"
# rm -rf "shellcheck-${scversion?}"

# C, C++
# pip install cpplint
# git clone https://github.com/danmar/cppcheck
# pushd cppcheck || exit
# mkdir build
# pushd build || exit
# cmake ..
# cmake --build .
# cp -r bin/* "$HOME/.local/bin"
# popd || exit
# popd || exit
# rm -rf cppcheck


# -----------------------------------------------------------------------------
# Install package manager
# -----------------------------------------------------------------------------
# git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"


# -----------------------------------------------------------------------------
# Download nvim
# -----------------------------------------------------------------------------
echo "Installing nvim..."
wget "https://github.com/neovim/neovim/releases/download/${nvim_version?}/nvim-linux64.tar.gz"
tar zxvf nvim-linux64.tar.gz
cp -r nvim-linux64/* "$HOME/.local"
rm -r nvim-linux64
rm nvim-linux64.tar.gz


# -----------------------------------------------------------------------------
# Get configuration
# -----------------------------------------------------------------------------
if [[ -f "./nvim.tar.gz" ]]; then
    tar zxvf ./nvim.tar.gz --directory="$HOME/.config"
    nvim
else
    echo "Set up your own vim config"
fi
