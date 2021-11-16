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

" Icons without colors (for startify)
Plug 'ryanoasis/vim-devicons'

" Icons with colors (required by lualine, nvim-bufferline, nvim-tree, etc.)
Plug 'kyazdani42/nvim-web-devicons'

" Fuzzy finder (also install fzf system-wise)
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Startup page and session manager
" Plug 'mhinz/vim-startify'

" FLoat terminal
Plug 'voldikss/vim-floaterm'

" Format markdown table
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" -----------------------------------------------------------------------------
" Lua-based plugins, require nvim>=0.5
" -----------------------------------------------------------------------------
" Language Server Protocol for neovim, core plugin
Plug 'neovim/nvim-lspconfig'

" Better config and UI setup for lsp-config
" Plug 'glepnir/lspsaga.nvim'

" required by many other lua-plugins
Plug 'nvim-lua/plenary.nvim'

" Wrapper to install language server -> :LspInstall <language>
Plug 'williamboman/nvim-lsp-installer'

" Parser generator tool, allow better syntax highlighting -> :TSInstall <language>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Linter for style checking
Plug 'mfussenegger/nvim-lint'

" Auto completion tool
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" Show code signature while typing
Plug 'ray-x/lsp_signature.nvim'

" Pictogram to LSP
Plug 'onsails/lspkind-nvim'

" Status line (bottom)
Plug 'nvim-lualine/lualine.nvim'

" Buffer line (top)
Plug 'akinsho/bufferline.nvim'

" Show project structure (right)
"Plug 'simrat39/symbols-outline.nvim'

" File explorer tree (left)
Plug 'kyazdani42/nvim-tree.lua'

" Highlight and navigate sets of matching text. Can integrate with treesitter
Plug 'andymass/vim-matchup'

" Highlight and search for todo comments (TODO, HACK, FIX, etc.)
Plug 'folke/todo-comments.nvim'

" Highlight related text under cursor
Plug 'RRethy/vim-illuminate'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'lewis6991/gitsigns.nvim'

" Code commenter
Plug 'numToStr/Comment.nvim'

" Indentation guide
Plug 'lukas-reineke/indent-blankline.nvim'

" Colorizer for color code
Plug 'norcalli/nvim-colorizer.lua'

" Startup page
Plug 'goolord/alpha-nvim'

" Session manager
Plug 'Shatur/neovim-session-manager'

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'

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

source ~/.config/nvim/share_cfg/basic.vim
source ~/.config/nvim/share_cfg/custom_functions.vim
source ~/.config/nvim/share_cfg/keybindings.vim


" =============================================================================
" Plugin configurations
" =============================================================================
" source ~/.config/nvim/plugin_cfg/startify.vim
source ~/.config/nvim/plugin_cfg/floatterm.vim
source ~/.config/nvim/plugin_cfg/markdown.vim

" Language servers + Lua config + nvim>=0.5
" luafile ~/.config/nvim/plugin_cfg/lua/lspsaga.lua
luafile ~/.config/nvim/plugin_cfg/lua/nvim-lspconfig.lua
luafile ~/.config/nvim/plugin_cfg/lua/lsp-installer.lua
luafile ~/.config/nvim/plugin_cfg/lua/treesitter.lua
luafile ~/.config/nvim/plugin_cfg/lua/lint.lua
luafile ~/.config/nvim/plugin_cfg/lua/cmp.lua
luafile ~/.config/nvim/plugin_cfg/lua/signature.lua
luafile ~/.config/nvim/plugin_cfg/lua/lualine.lua
luafile ~/.config/nvim/plugin_cfg/lua/bufferline.lua
luafile ~/.config/nvim/plugin_cfg/lua/todocomments.lua
luafile ~/.config/nvim/plugin_cfg/lua/indent-blankline.lua
luafile ~/.config/nvim/plugin_cfg/lua/lspkind.lua
luafile ~/.config/nvim/plugin_cfg/lua/gitsigns.lua
luafile ~/.config/nvim/plugin_cfg/lua/comment-nvim.lua
luafile ~/.config/nvim/plugin_cfg/lua/alpha.lua
luafile ~/.config/nvim/plugin_cfg/lua/telescope.lua
luafile ~/.config/nvim/plugin_cfg/lua/neovim-session-manager.lua
source ~/.config/nvim/plugin_cfg/lua/nvim-tree.vim
source ~/.config/nvim/plugin_cfg/lua/illuminate.vim
