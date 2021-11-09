#!/usr/bin/env bash
if [ -z "$1" ]; then
    NODE_VERSION="v17.0.1"
else
    NODE_VERSION="$1"
fi
echo "$NODE_VERSION"

echo "Install and update NodeJS..."
wget "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz"
tar xvf "node-${NODE_VERSION}-linux-x64.tar.xz" -C "$HOME/.local"
rm "node-${NODE_VERSION}-linux-x64.tar.xz"

unlink "$HOME/.local/nodejs"
ln -sf "$HOME/.local/node-${NODE_VERSION}-linux-x64" "$HOME/.local/nodejs"
echo "Remember to add ~/.local/nodejs/bin to your \$PATH"
