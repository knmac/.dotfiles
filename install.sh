#!/usr/bin/env bash
echo "Automatically install and set up the packages. Requires sudo"

# -----------------------------------------------------------------------------
echo "Install and setup NeoVim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
pip install --user neovim pep8 flake8 pyflakes pylint isort pynvim
pip3 install --user neovim pep8 flake8 pyflakes pylint isort pynvim

mkdir -p $HOME/.config/nvim/
cp ./nvim/init.vim $HOME/.config/nvim

echo "Run nvim to begin the setup..."


# -----------------------------------------------------------------------------
echo "Install and setup tmux"
sudo apt-get install tmux

cp ./tmux/.tmux* ~/


# -----------------------------------------------------------------------------
echo "Install and setup zsh"
sudo apt-get install zsh
chsh -s /bin/zsh user

# Clone oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins

# Install bat for syntax highlighting
sudo apt-get install bat

# Copy the settings over
cp -r ./oh-my-zsh/custom $HOME/.oh-my-zsh/custom


# -----------------------------------------------------------------------------
echo "Install Powerline font"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "You need to change the font manually for your terminal later..."
