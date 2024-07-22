#!/usr/bin/env bash
if [ ! -d "flavors" ]; then
    git clone https://github.com/yazi-rs/flavors
fi

if [ ! -d "plugins" ]; then
    git clone https://github.com/yazi-rs/plugins
fi
