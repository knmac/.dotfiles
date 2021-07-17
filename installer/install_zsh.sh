#!/usr/bin/env bash
DOTFILES_ROOT="$HOME/dotfiles"

echo "Automatically install and set up the packages. Requires sudo"

# -----------------------------------------------------------------------------
echo "Install and setup zsh"
sudo apt install zsh

# Change default shell to zsh. Deprecated, oh-my-zsh will do it for you
#chsh -s /bin/zsh "$USER"

# Clone oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Install bat for syntax highlighting, ripgrep for file finder (with a string)
sudo apt install bat ripgrep

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
# Install typewritten theme
#git clone https://github.com/reobin/typewritten "$ZSH_CUSTOM/themes"

# Copy zshrc over
cp $DOTFILES_ROOT/zsh/.zshrc "$HOME"
