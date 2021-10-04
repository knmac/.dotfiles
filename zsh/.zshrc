# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="spaceship-prompt/spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  #git
  zsh-syntax-highlighting
  zsh-autosuggestions
  conda-zsh-completion
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# -----------------------------------------------------------------------------
# Turn on edit command line mode (Ctrl-x Ctrl-e)
autoload -U edit-command-line


# Customize spaceship-prompt
#SPACESHIP_CHAR_SYMBOL="❱ "


# Configure zsh highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none


# Configure zsh autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240,underline"
# Disabling suggestion for large buffers
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Enable Asynchronous Mode
ZSH_AUTOSUGGEST_USE_ASYNC=1
# Press Ctrl+[space] to accept the suggestion
bindkey '^ ' autosuggest-accept


# Configure FZF
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
#export FZF_DEFAULT_OPTS="--height 100% --layout=reverse --border"
export FZF_DEFAULT_OPTS="--layout=default"
# Use ripgrep as search program for fzf
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
# Use bat for preview if possible
if type bat &> /dev/null; then
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
    export BAT_THEME="OneHalfDark"
fi


# Aliases
if type xclip &> /dev/null; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
elif type xsel &> /dev/null; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

DOTFILES_DIR="$HOME/.dotfiles"
NOTES_DIR="$HOME/Documents/my_notes"
alias bvim="nvim -u $HOME/.config/nvim/init_basic.vim"
alias cvim="nvim -u $HOME/.config/nvim/init_coc.vim"
alias dotfiles="git --git-dir=$DOTFILES_DIR/.git --work-tree=$DOTFILES_DIR"
alias dotfiles_acp="dotfiles add . && dotfiles commit -m update && dotfiles push"
alias notes="git --git-dir=$NOTES_DIR/.git --work-tree=$NOTES_DIR"
alias notes_acp="notes add . && notes commit -m update && notes push"


# Exports
export PATH="$HOME/.local/bin:$HOME/.local/nodejs/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR="nvim -u $HOME/.config/nvim/init_basic.vim"
export PROMPT_COMMAND="pwd > /tmp/whereami_$USER"
precmd() {
    eval "$PROMPT_COMMAND"
}


# Add tools
source "$DOTFILES_DIR/tools/add_tools.sh"
