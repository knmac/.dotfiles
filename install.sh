# instal vim
# sudo apt-get install curl vim exuberant-ctags git ack-grep
# cp vimrc/* ~

# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
pip install --user neovim pep8 flake8 pyflakes pylint isort
pip3 install --user neovim pep8 flake8 pyflakes pylint isort

mkdir -p ~/.config/nvim/
cp ./neovim/init.vim ~/.config/nvim

# install powerline-font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
# change the font manually

# install tmux
sudo apt-get install tmux

cp tmux/.tmux* ~/
