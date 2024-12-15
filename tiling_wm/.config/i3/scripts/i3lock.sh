#!/bin/sh

alpha='dd'
transparent='00'

# black='#282c34'
# yellow='#e5c07b'
# orange='#d19a66'
# red='#e06c75'
# magenta='#c678dd'
# violet='#c678dd'
# blue='#61afef'
# cyan='#56b6c2'
# green='#98c379'
# white='#abb2bf'

black='#24273A'
yellow='#eed49f'
red='#ed8796'
magenta='#c6a0f6'
blue='#8aadf4'
green='#a6da95'
white='#cad3f5'
gray='#6e738d'


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
  --modif-color=$white \
  --layout-color=$blue \
  --date-color=$gray \
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
  --time-size=70 \
  --date-size=30 \
  --verif-size=50 \
  --wrong-size=50 \
  --radius=200 \
  --ring-width=20 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys
