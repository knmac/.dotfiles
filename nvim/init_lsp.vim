source ~/.config/nvim/vim_plug_init.vim


" =============================================================================
" Active plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')

" -----------------------------------------------------------------------------
" Vim-script plugins
" -----------------------------------------------------------------------------
" Color schemes
"Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Startup page and session manager
Plug 'mhinz/vim-startify'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Class/module browser
Plug 'majutsushi/tagbar'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Git integration, can show git branch on statusline
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Indentation guide
Plug 'Yggdroot/indentLine'
" Detect indent automatically
Plug 'ciaranm/detectindent'

" Format markdown table
Plug 'godlygeek/tabular'

" Floating terminal
Plug 'voldikss/vim-floaterm'

" Icons without colors (for startify)
Plug 'ryanoasis/vim-devicons'

" Icons with colors (required by lualine, nvim-bufferline, nvim-tree, etc.)
Plug 'kyazdani42/nvim-web-devicons'  

" Colorize colornames and codes
Plug 'chrisbra/Colorizer'

" -----------------------------------------------------------------------------
" Lua-based plugins, require nvim>=0.5
" -----------------------------------------------------------------------------
" Language Server Protocol for neovim, core plugin
Plug 'neovim/nvim-lspconfig'

" Wrapper to install language server -> :LspInstall <language>
Plug 'kabouzeid/nvim-lspinstall'

" Better interface for nvim LSP
"Plug 'glepnir/lspsaga.nvim'

" Auto completion tool
Plug 'hrsh7th/nvim-compe'

" Show code signature while typing
Plug 'ray-x/lsp_signature.nvim'

" Parser generator tool, allow better syntax highlighting -> :TSInstall <language>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  

" Highlight and search for todo comments (TODO, HACK, FIX, etc.)
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" Status line
Plug 'hoob3rt/lualine.nvim'

" Buffer line
Plug 'akinsho/nvim-bufferline.lua'

" File explorer tree
Plug 'kyazdani42/nvim-tree.lua'

" Show project structure
"Plug 'simrat39/symbols-outline.nvim'

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
source ~/.config/nvim/plugin_cfg/snippet.vim
source ~/.config/nvim/plugin_cfg/keybindings.vim


" =============================================================================
" Plugin configurations
" =============================================================================
source ~/.config/nvim/plugin_cfg/startify.vim
source ~/.config/nvim/plugin_cfg/indent.vim
source ~/.config/nvim/plugin_cfg/signify.vim
source ~/.config/nvim/plugin_cfg/floatterm.vim

" Language servers + Lua config
source ~/.config/nvim/plugin_cfg/lspconfig.vim
"source ~/.config/nvim/plugin_cfg/lua/lspsaga.lua
luafile ~/.config/nvim/plugin_cfg/lua/lspinstall.lua
luafile ~/.config/nvim/plugin_cfg/lua/treesitter.lua
luafile ~/.config/nvim/plugin_cfg/lua/compe.lua
luafile ~/.config/nvim/plugin_cfg/lua/lualine.lua
luafile ~/.config/nvim/plugin_cfg/lua/bufferline.lua
luafile ~/.config/nvim/plugin_cfg/lua/todocomments.lua
source ~/.config/nvim/plugin_cfg/lua/nvim-tree.vim


luafile ~/.config/nvim/plugin_cfg/lua/signature.lua
