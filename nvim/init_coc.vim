source ~/.config/nvim/vim_plug_init.vim

" Change to 0 if want to use non-coc version
let use_coc = 1


" ============================================================================
" Active plugins
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

" Async autocompletion
if use_coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
else
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
"Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Create terminal in a split (instead of the whole screen)
"Plug 'mklabs/split-term.vim'

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


" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" ============================================================================
" Basic configurations
" ============================================================================
colorscheme gruvbox

"if has("gui_running")
"    let g:molokai_original = 1
"else
"    let g:rehash256 = 1
"endif
"colorscheme molokai
"colorscheme one-monokai
"colorscheme material-monokai
"colorscheme onedark

source ~/.config/nvim/plugin_cfg/basic.vim

" Custom snippets
source ~/.config/nvim/plugin_cfg/snippet.vim


" ============================================================================
" Plugin configurations and key bindings
" ============================================================================

" Vim-startify
source ~/.config/nvim/plugin_cfg/startify.vim

" Indentation
source ~/.config/nvim/plugin_cfg/indent.vim

" Airline
source ~/.config/nvim/plugin_cfg/airline.vim

" Signify
source ~/.config/nvim/plugin_cfg/signify.vim

" Float-term
source ~/.config/nvim/plugin_cfg/floatterm.vim

" Search for file name (require FZF)
nnoremap <silent> <C-P> :Files<CR>

" Search for file content (require FZF and ripgrep)
nnoremap <silent> <C-F> :Rg<CR>

" Task list
nnoremap <silent> <F2> :TaskList<CR>

" Tag bar
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Show interactive buffer list (need fzf)
nnoremap <silent> <F5> :Buffers<CR>

" Prev buffer
nnoremap <silent> <F6> :bp<CR>

" Next buffer
nnoremap <silent> <F7> :bn<CR>

" Close buffer and switch to the previous one
nnoremap <silent> <F8> :bp<CR>:bd #<CR>

" Run the make file
nnoremap <silent> <F10> :make<CR>

" Toggle Float-term
let g:floaterm_keymap_toggle = '<F12>'


" Coc
if use_coc 
    source ~/.config/nvim/plugin_cfg/coc.vim
    nnoremap <silent> <F3> :CocCommand explorer --toggle<CR>
    nnoremap <silent> <F9> :<C-u>CocList diagnostics<CR>
else
    " Nerd tree
    source ~/.config/nvim/plugin_cfg/nerdtree.vim
    nnoremap <silent> <F3> :NERDTreeToggle<CR>

    " ALE
    source ~/.config/nvim/plugin_cfg/ale.vim
    nnoremap <silent> <F9> :call QuickfixToggle()<CR>

    " Deoplete 
    source ~/.config/nvim/plugin_cfg/deoplete.vim

    " JediVim
    source ~/.config/nvim/plugin_cfg/jedivim.vim

    " Markdown
    source ~/.config/nvim/plugin_cfg/markdown.vim
endif
