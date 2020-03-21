echo "Install and setup W3M and NeoMutt"
sudo apt-get install w3m w3m-img
sudo apt-get install neomutt

mkdir -p $HOME/.config/neomutt
mkdir -p $HOME/.config/neomutt/cache
touch $HOME/.config/neomutt/certificates
cp -r ./neomuttrc ./colors.muttrc ./mailcap $HOME/.config/neomutt

echo "You need to change the user name in $HOME/.config/neomutt/neomuttrc later..."
