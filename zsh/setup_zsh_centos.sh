#!/usr/bin/env bash
# Set up zsh prerequisites for zshrc, need to set up zinit first
# The prerequisites are: zoxide, starship prompt, fzf, eza, bat, rg, yazi

FZF_VERSION="0.56.3"
EZA_VERSION="0.20.10"
BAT_VERSION="0.24.0"
RG_VERSION="14.1.1"
YAZI_VERSION="0.3.3"
# ZOXIDE_VERSION=""
# STARSHIP_VERSION=""

# ─────────────────────────────────────────────────────────────────────────────────────────────────
PREFIX="$HOME/.local"  # "/usr/local"
BIN_DIR="$PREFIX/bin"
MAN_DIR="$PREFIX/share/man"
COMP_DIR="$HOME/.local/share/zinit/completions/"

mkdir -p "$MAN_DIR"
mkdir -p "$MAN_DIR/man1"
mkdir -p "$MAN_DIR/man5"

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# starship
curl -sS https://starship.rs/install.sh | sh

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# fzf
wget "https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz"
tar zxf "fzf-${FZF_VERSION}-linux_amd64.tar.gz"
mv fzf "$BIN_DIR"
rm "fzf-${FZF_VERSION}-linux_amd64.tar.gz"

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# eza
wget "https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/eza_x86_64-unknown-linux-musl.tar.gz"
tar zxf eza_x86_64-unknown-linux-musl.tar.gz
mv eza "$BIN_DIR"
rm eza_x86_64-unknown-linux-musl.tar.gz

wget "https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/man-${EZA_VERSION}.tar.gz"
tar zxf "man-${EZA_VERSION}.tar.gz"
mv "target/man-${EZA_VERSION}/eza.1" "$MAN_DIR/man1"
mv "target/man-${EZA_VERSION}/eza_colors.5" "$MAN_DIR/man5"
mv "target/man-${EZA_VERSION}/eza_colors-explanation.5" "$MAN_DIR/man5"
rm -r "man-${EZA_VERSION}.tar.gz"

wget "https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/completions-${EZA_VERSION}.tar.gz"
tar zxf "completions-${EZA_VERSION}.tar.gz"
mv "target/completions-${EZA_VERSION}/_eza" "$COMP_DIR"
rm -r "completions-${EZA_VERSION}.tar.gz"

rm -r target

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# bat
wget "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat-v${BAT_VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar zxf "bat-v${BAT_VERSION}-x86_64-unknown-linux-musl.tar.gz"
pushd "bat-v${BAT_VERSION}-x86_64-unknown-linux-musl" || exit
mv bat "$BIN_DIR"
mv bat.1 "$MAN_DIR"
mv autocomplete/bat.zsh "$COMP_DIR"
popd || exit
rm "bat-v${BAT_VERSION}-x86_64-unknown-linux-musl.tar.gz"
rm -r "bat-v${BAT_VERSION}-x86_64-unknown-linux-musl"

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# rg
wget "https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar zxf "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
pushd "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl" || exit
mv rg "$BIN_DIR"
mv doc/rg.1 "$MAN_DIR"
mv complete/_rg "$COMP_DIR"
popd || exit
rm "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
rm -r "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl"

# ─────────────────────────────────────────────────────────────────────────────────────────────────
# yazi
wget "https://github.com/sxyazi/yazi/releases/download/v${YAZI_VERSION}/yazi-x86_64-unknown-linux-musl.zip"
unzip "yazi-x86_64-unknown-linux-musl.zip"
pushd yazi-x86_64-unknown-linux-musl || exit
mv ya yazi "$BIN_DIR"
mv completions/_yazi completions/_ya "$COMP_DIR"
popd || exit
rm "yazi-x86_64-unknown-linux-musl.zip"
rm -r "yazi-x86_64-unknown-linux-musl"
