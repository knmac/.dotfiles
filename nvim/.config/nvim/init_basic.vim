source ~/.config/nvim/vim_plug_init.vim


" =============================================================================
" Active plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'

call plug#end()

" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" =============================================================================
" Basic configurations
" =============================================================================
"colorscheme gruvbox
colorscheme onedark

source ~/.config/nvim/plugin_cfg/basic.vim
source ~/.config/nvim/plugin_cfg/custom_functions.vim
source ~/.config/nvim/plugin_cfg/keybindings.vim
source ~/.config/nvim/plugin_cfg/netrw.vim

"source ~/.config/nvim/plugin_cfg/lightline.vim
