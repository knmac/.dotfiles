sudo apt install libx11-dev libxext-dev

pip3 install --user ranger-fm ueberzug
ranger --copy-config=all

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

cp ./rc.conf ~/.config/ranger
