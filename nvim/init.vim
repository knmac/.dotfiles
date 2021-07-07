" =============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" =============================================================================
" Active plugins
call plug#begin('~/.config/nvim/plugged')

" Vim-script plugins
" ------------------
" Color schemes
Plug 'morhetz/gruvbox'

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

" Icons with colors (required by lualine, nvim-bufferline, nvim-tree, etc.)
Plug 'kyazdani42/nvim-web-devicons'  


" Lua-based plugins, require nvim>=0.5
" ------------------------------------
" Language Server Protocol for neovim, core plugin
Plug 'neovim/nvim-lspconfig'

" Wrapper to install language server -> :LspInstall <language>
Plug 'kabouzeid/nvim-lspinstall'

" Better interface for nvim LSP
"Plug 'glepnir/lspsaga.nvim'

" Auto completion tool
Plug 'hrsh7th/nvim-compe'

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
Plug 'simrat39/symbols-outline.nvim'

call plug#end()

" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" =============================================================================
" Basic configurations
colorscheme gruvbox

source ~/.config/nvim/plugin_cfg/basic.vim
source ~/.config/nvim/plugin_cfg/snippet.vim

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


" =============================================================================
" Basic key bindings
" Search for file name (require FZF)
nnoremap <silent> <C-P> :Files<CR>

" Search for file content (require FZF and ripgrep)
nnoremap <silent> <C-F> :Rg<CR>

" <F1>: show help

" <F2>: Task List
nnoremap <silent> <F2> :TodoQuickFix<CR>

" <F3>: File tree explorer
nnoremap <silent> <F3> :NvimTreeToggle<CR>

" <F4>: Tag bar
nnoremap <silent> <F4> :SymbolsOutline<CR>
"nnoremap <silent> <F4> :TagbarToggle<CR>
"let g:tagbar_autofocus = 1

" <F5>: Show buffer list
nnoremap <silent> <F5> :Buffers<CR>

" <F6>: Prev buffer
nnoremap <silent> <F6> :bp<CR>

" <F7>: Next buffer
nnoremap <silent> <F7> :bn<CR>

" <F8>: Close buffer and switch to the previous one
nnoremap <silent> <F8> :bp<CR>:bd #<CR>

" <F9>: Show diagnostics Quickfix

" <F10>: Run the make file
nnoremap <silent> <F10> :make<CR>

" <F12>: Toggle Float-term
