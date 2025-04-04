#!/usr/bin/env bash
tempfile=$(mktemp) \
  && curl -o "$tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo" \
  && tic -x -o ~/.terminfo "$tempfile" \
  && rm "$tempfile"

echo 'TERM="wezterm"' >> "$HOME/.zshrc"
