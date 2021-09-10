#!/usr/bin/env bash
DOTFILES_ROOT="$HOME/.dotfiles"
THEME_DIR="$HOME/.themes"
ICON_DIR="$HOME/.icons"

mkdir -p $THEME_DIR
unzip "$DOTFILES_ROOT/gtk_themes/A-Darkest-3.38_1.8.4.zip" -d "$THEME_DIR" 

mkdir -p $ICON_DIR
tar zxvf "$DOTFILES_ROOT/gtk_themes/Vortex-Dark-Icons.tar.gz" -C "$ICON_DIR"
tar xvf "$DOTFILES_ROOT/gtk_themes/01-Vimix-cursors.tar.xz" -C "$ICON_DIR"
