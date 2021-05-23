#!/usr/bin/env bash
NODE_VERSION="v16.2.0"

echo "Install and update NodeJS..."
wget "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz"
tar xvf node-${NODE_VERSION}-linux-x64.tar.xz -C $HOME/.local
rm node-${NODE_VERSION}-linux-x64.tar.xz 

[ -f $HOME/.local/bin/node ] && unlink $HOME/.local/bin/node
[ -f $HOME/.local/bin/npm ] && unlink $HOME/.local/bin/npm
[ -f $HOME/.local/bin/npx ] && unlink $HOME/.local/bin/npx

ln -s $HOME/.local/node-${NODE_VERSION}-linux-x64/bin/node $HOME/.local/bin/node
ln -s $HOME/.local/node-${NODE_VERSION}-linux-x64/bin/npm $HOME/.local/bin/npm
ln -s $HOME/.local/node-${NODE_VERSION}-linux-x64/bin/npx $HOME/.local/bin/npx
