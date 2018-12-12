# instal vim
# sudo apt-get install curl vim exuberant-ctags git ack-grep
# cp vimrc/* ~


# -----------------------------------------------------------------------------
# Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
pip install --user neovim pep8 flake8 pyflakes pylint isort pynvim
pip3 install --user neovim pep8 flake8 pyflakes pylint isort pynvim

mkdir -p ~/.config/nvim/
cp ./nvim/init.vim ~/.config/nvim


# -----------------------------------------------------------------------------
# Install powerline-font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
# you need to change the font manually for your terminal later


# -----------------------------------------------------------------------------
# Install tmux
sudo apt-get install tmux

cp tmux/.tmux* ~/


# -----------------------------------------------------------------------------
# Install zsh
sudo apt-get install zsh
chsh -s /bin/zsh user
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -r ./oh-my-zsh/custom ~/.oh-my-zsh/custom
