#!/usr/bin/env bash
echo "Automatically install and set up the packages. Requires sudo"

# -----------------------------------------------------------------------------
echo "Install and setup zsh"
sudo apt install zsh

# Change default shell to zsh. Deprecated, oh-my-zsh will do it for you
#chsh -s /bin/zsh "$USER"

# Clone oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Copy zshrc over
cp zsh/.zshrc "$HOME"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Install bat for syntax highlighting, ripgrep for file finder (with a string)
sudo apt install bat ripgrep

# Copy the settings over. Deprecated, use p10k for better options
#cp oh-my-zsh/custom/themes/custom-bullet.zsh-theme ~/.oh-my-zsh/custom/themes 

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"


# -----------------------------------------------------------------------------
echo "Install and setup NeoVim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

#sudo apt-get install python-dev python-pip python3-dev python3-pip curl vim exuberant-ctags git ack-grep
#pip install --user neovim pep8 flake8 pyflakes pylint isort pynvim
#pip3 install --user neovim pep8 flake8 pyflakes pylint isort pynvim
sudo apt install python3-dev python3-pip curl exuberant-ctags shellcheck
pip3 install --user pynvim neovim flake8 msgpack

echo "Install nodejs..."
node_version="v14.4.0"
wget https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz
tar xvf node-${node_version}-linux-x64.tar.xz
rm node-${node_version}-linux-x64.tar.xz
mv node-${node_version}-linux-x64 ~/.local
export PATH="$HOME/.local/node-${node_version}-linux-x64/bin:$PATH" >> ~/.zshrc
export PATH="$HOME/.local/node-${node_version}-linux-x64/bin:$PATH" >> ~/.bashrc

mkdir -p "$HOME/.config/nvim/"
cp -r ./nvim/* "$HOME/.config/nvim"

echo "Run nvim and begin the setup..."
nvim


# -----------------------------------------------------------------------------
echo "Install and setup tmux"
sudo apt install tmux

cp ./tmux/.tmux* ~/
