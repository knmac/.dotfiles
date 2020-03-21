#!/usr/bin/env bash
echo "Automatically install and set up the packages. Requires sudo"

# -----------------------------------------------------------------------------
echo "Install and setup NeoVim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

#sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
#pip install --user neovim pep8 flake8 pyflakes pylint isort pynvim
#pip3 install --user neovim pep8 flake8 pyflakes pylint isort pynvim
sudo apt-get install python-dev python-pip python3-dev python3-pip curl exuberant-ctags
pip3 install --user pynvim flake8 pylint

mkdir -p $HOME/.config/nvim/
cp ./nvim/init.vim ./nvim/skeleton.py $HOME/.config/nvim

echo "Run nvim to begin the setup..."


# -----------------------------------------------------------------------------
echo "Install and setup tmux"
sudo apt-get install tmux

cp ./tmux/.tmux* ~/


# -----------------------------------------------------------------------------
echo "Install and setup zsh"
sudo apt-get install zsh

# Change default shell to zsh
chsh -s /bin/zsh $USER

# Clone oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Copy zshrc over
cp zsh/.zshrc $HOME

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install bat for syntax highlighting
sudo apt-get install bat

# Install ripgrep
sudo apt-get install ripgrep

# Copy the settings over
#cp oh-my-zsh/custom/themes/custom-bullet.zsh-theme ~/.oh-my-zsh/custom/themes 

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
