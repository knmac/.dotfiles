#!/bin/sh

alpha='dd'
transparent='00'
base03='#002b36'
base02='#073642'
base01='#586e75'
base00='#657b83'
base0='#839496'
base1='#93a1a1'
base2='#eee8d5'
base3='#fdf6e3'


black='#282c34'
yellow='#e5c07b'
orange='#d19a66'
red='#e06c75'
magenta='#c678dd'
violet='#c678dd'
blue='#61afef'
cyan='#56b6c2'
green='#98c379'
white='#abb2bf'

i3lock \
  --insidever-color=$black$alpha \
  --insidewrong-color=$black$alpha \
  --inside-color=$black$alpha \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ring-color=$blue$alpha \
  --line-uses-ring \
  --keyhl-color=$yellow$alpha \
  --bshl-color=$magenta$alpha \
  --separator-color=$white$transparent \
  --verif-color=$green \
  --wrong-color=$red \
  --layout-color=$blue \
  --date-color=$blue \
  --time-color=$blue \
  --color="#00000077" \
  --screen 0 \
  --nofork \
  --clock \
  --indicator \
  --time-str="%H:%M:%S" \
  --date-str="%a, %b %e, %Y" \
  --verif-text="Verifying..." \
  --wrong-text="Auth Failed" \
  --noinput="No Input" \
  --lock-text="Locking..." \
  --lockfailed="Lock Failed" \
  --radius=100 \
  --ring-width=20 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys
