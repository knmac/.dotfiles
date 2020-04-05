# Install and configure mpd and mpc
sudo apt-get install mpd mpc
mkdir -p $HOME/.config/mpd/playlists
cp ./mpd/mpd.conf $HOME/.config/mpd
#sudo service mpd stop
mpd
mpc ls | mpc add


# Install and configure ncmpcpp
sudo apt-get install ncmpcpp
mkdir -p $HOME/.config/ncmpcpp/lyrics
cp ./ncmpcpp/config $HOME/.config/ncmpcpp
