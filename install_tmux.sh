#!/usr/bin/env bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/.local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=3.0
LIBEVENT_VERSION=2.1.11
NCURSES_VERSION=6.1

# create our directories
mkdir -p "$HOME/.local" "$HOME/tmux_tmp"
cd "$HOME/tmux_tmp"

# download source files for tmux, libevent, and ncurses
wget "https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz" 
wget "https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}-stable/libevent-${LIBEVENT_VERSION}-stable.tar.gz"
wget "ftp://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz"

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-${LIBEVENT_VERSION}-stable.tar.gz
pushd libevent-${LIBEVENT_VERSION}-stable
./configure --prefix="$HOME/.local" --disable-shared
make
make install
popd

############
# ncurses  #
############
tar xvzf ncurses-${NCURSES_VERSION}.tar.gz
pushd ncurses-${NCURSES_VERSION}
./configure --prefix="$HOME/.local"
make
make install
popd

############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
pushd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib" make
cp tmux "$HOME/.local/bin"
popd

# cleanup
rm -rf "$HOME/tmux_tmp"

echo "$HOME/.local/bin/tmux is now available. You can optionally add $HOME/.local/bin to your PATH."
