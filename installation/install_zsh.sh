#!/usr/bin/env bash
DOTFILES_ROOT="$HOME/.dotfiles"

echo "Automatically install and set up the packages. Requires sudo"

# -----------------------------------------------------------------------------
echo "Install and setup zsh"
sudo apt install zsh fzf

# Clone oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Install conda-zsh-completion
git clone https://github.com/esc/conda-zsh-completion "$ZSH_CUSTOM/plugins/conda-zsh-completion"

# Install bat for syntax highlighting, ripgrep for file finder (with a string)
sudo apt install bat ripgrep

# Install p10k prompt
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
# Install typewritten prompt
#git clone https://github.com/reobin/typewritten "$ZSH_CUSTOM/themes"
# Install spaceship prompt
#git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# Copy zshrc over any modify as needed
cp "$DOTFILES_ROOT/zsh/.zshrc" "$HOME"

# Configure p10k prompt
p10k configure
