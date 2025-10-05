# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Set up zinit
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load completions
autoload -Uz compinit && compinit

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light sainnhe/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zpm-zsh/ls

# Add in snippets
# zinit snippet OMZP::command-not-found
# zinit snippet OMZP::archlinux

# Keybindings
bindmode="emacs" # emacs | vim
if [ "$bindmode" = "emacs" ]; then
    # Emacs mode - Ctrl-x Ctrl-v to switch to vim normal mode
    bindkey -e
else
    # Vim mode with some emacs key-bindings in insert mode - Esc to enter normal mode
    bindkey -v
    bindkey '^a' beginning-of-line
    bindkey '^e' end-of-line
    bindkey '^p' history-search-backward
    bindkey '^n' history-search-forward
fi
bindkey '^ ' autosuggest-accept

# History
HISTSIZE=5000
HISTFILE="${HOME}/.zsh_history"
SAVEHIST="$HISTSIZE"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Auto cd
setopt autocd

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Configure applications
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
export PATH="$HOME/.local/bin:$PATH"

# Configure zsh highlighting ──────────────────────────────────────────────────────────────────────
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Configure zsh autosuggestions ───────────────────────────────────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240,underline"
# Disabling suggestion for large buffers
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Enable Asynchronous Mode
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Configure fzf ───────────────────────────────────────────────────────────────────────────────────
export FZF_DEFAULT_OPTS=" \
--color=spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
zstyle ':fzf-tab:*' fzf-flags $(echo $FZF_DEFAULT_OPTS)

# Use ripgrep as search program for fzf
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden"
fi

# Use bat for preview if possible
if type bat &> /dev/null; then
    BAT_THEMES_DIR="$(bat --config-dir)/themes"
    BAT_THEMES_URL="https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme"

    mkdir -p "$BAT_THEMES_DIR"
    [ ! -s "$BAT_THEMES_DIR/Catppuccin Macchiato.tmTheme" ] \
        && wget -P "$BAT_THEMES_DIR" "$BAT_THEMES_URL" \
        && bat cache --build

    export BAT_THEME="Catppuccin Macchiato"
    export BAT_STYLE="auto"
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
    export MANPAGER="sh -c 'col -bx | bat -l man --plain'"
fi

# Configure yazi ──────────────────────────────────────────────────────────────────────────────────
yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        # cd -- "$cwd"
        "$cwd"
    fi
    rm -f -- "$tmp"
}
bindkey -s '^y' "yy\n"  # set up key-binding for yazi


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Personal config
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ -f "$HOME/.zshrc_personal" ] && source "$HOME/.zshrc_personal"


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Shell integrations (placed at the end)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
