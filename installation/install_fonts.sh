#!/usr/bin/env bash
DOTFILES_ROOT="$HOME/.dotfiles"

mkdir -p $HOME/.local/share/fonts
cp -r $DOTFILES_ROOT/fonts/* $HOME/.local/share/fonts
