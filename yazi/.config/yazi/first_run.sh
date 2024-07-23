#!/usr/bin/env bash
if [ ! -d "flavors" ]; then
    git clone https://github.com/yazi-rs/flavors
fi

if [ ! -d "plugins" ]; then
    git clone https://github.com/yazi-rs/plugins
fi

# Configure yazi
echo "Add the following to your .bashrc or .zshrc etc."
printf '
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        # cd -- "$cwd"
        "$cwd"
    fi
    rm -f -- "$tmp"
}
bindkey -s "^o" "yy\n"  # set up key-binding
'
