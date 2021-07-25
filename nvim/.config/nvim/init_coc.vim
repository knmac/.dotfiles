source ~/.config/nvim/vim_plug_init.vim

" Change to 0 if want to use non-coc version
let use_coc = 1


" =============================================================================
" Active plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" Class/module browser
Plug 'majutsushi/tagbar'

" Git integration, can show git branch on statusline
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Indexing search (show counter while searching)
"Plug 'vim-scripts/IndexedSearch'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Intellisense
if use_coc
    " Require nodejs
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
    " Plugins to replace coc.nvim extensions

    " File explorer
    Plug 'scrooloose/nerdtree'

    " Linters
    Plug 'dense-analysis/ale'

    " Deoplete and plugins
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Preview in a floating window
    Plug 'ncm2/float-preview.nvim'
    " for Python
    Plug 'deoplete-plugins/deoplete-jedi'
    " for C/C++/Obj-C/Obj-C++ with clang-python3
    Plug 'deoplete-plugins/deoplete-clang'

    " Function navigation for python without using ctags
    " Just to add the python go-to-definition and similar features,
    " autocompletion from this plugin is disabled
    Plug 'davidhalter/jedi-vim'

    " Markdown linting
    Plug 'plasticboy/vim-markdown'
endif

" colorschemes
"Plug 'tomasr/molokai'
"Plug 'fratajczak/one-monokai-vim'
"Plug 'skielbasa/vim-material-monokai'
Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Indentation guide
Plug 'Yggdroot/indentLine'

" Detect indent automatically
Plug 'ciaranm/detectindent'

" Format markdown table
Plug 'godlygeek/tabular'

" Floating terminal
Plug 'voldikss/vim-floaterm'

" File type icons
Plug 'ryanoasis/vim-devicons'

" Startup page and session manager
Plug 'mhinz/vim-startify'

" Tell vim-plug we finished declaring plugins, so it can load them
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

"if has("gui_running")
"    let g:molokai_original = 1
"else
"    let g:rehash256 = 1
"endif
"colorscheme molokai
"colorscheme one-monokai
"colorscheme material-monokai

source ~/.config/nvim/plugin_cfg/basic.vim
source ~/.config/nvim/plugin_cfg/custom_functions.vim
source ~/.config/nvim/plugin_cfg/keybindings.vim


" =============================================================================
" Plugin configurations
" =============================================================================
source ~/.config/nvim/plugin_cfg/startify.vim
source ~/.config/nvim/plugin_cfg/indent.vim
source ~/.config/nvim/plugin_cfg/airline.vim
source ~/.config/nvim/plugin_cfg/signify.vim
source ~/.config/nvim/plugin_cfg/floatterm.vim

" Coc
if has_key(plugs, 'coc.nvim')
    source ~/.config/nvim/plugin_cfg/coc.vim
else
    source ~/.config/nvim/plugin_cfg/nerdtree.vim
    source ~/.config/nvim/plugin_cfg/ale.vim
    source ~/.config/nvim/plugin_cfg/deoplete.vim
    source ~/.config/nvim/plugin_cfg/jedivim.vim
    source ~/.config/nvim/plugin_cfg/markdown.vim
endif
