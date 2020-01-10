#!/usr/bin/env bash
# install gogh
sudo apt-get install dconf-cli
wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh
# choose your theme color and restart later

echo "The rest is already deprecated. Exiting..."
exit


# -----------------------------------------------------------------------------
# unity tweak
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
sudo apt-get update
sudo apt-get install ubuntu-tweak


# -----------------------------------------------------------------------------
# ultra-flat icons
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install ultra-flat-icons


# -----------------------------------------------------------------------------
# arc-flatabulous
sudo apt-get install autoconf automake pkg-config libgtk-3-dev
git clone https://github.com/andreisergiu98/arc-flatabulous-theme
cd arc-flatabulous-theme
./autogen.sh --prefix=/usr
sudo make install
cd ..
rm -rf arc-flatabulous-theme
