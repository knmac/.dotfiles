" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
	echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Better file browser
Plug 'scrooloose/nerdtree'

" Indexing search (show counter while searching)
Plug 'vim-scripts/IndexedSearch'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'morhetz/gruvbox'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()


" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" ============================================================================
" Default configurations
" ============================================================================

" ----------------------------------------------------------------------------
" Color and syntax highlighting
syntax enable
colorscheme gruvbox


" ----------------------------------------------------------------------------
" Look and feel
set ls=2                        " always show status bar
set mouse=a                     " use mouse
set number                      " show line numbers
set numberwidth=5               " width of line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set colorcolumn=80              " show column ruler at the end
set encoding=utf-8              " use unicode
set wildmode=list:longest       " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " highlight matching [{()}]
set backspace=indent,eol,start  " resolve the problem of backspace not working
set path+=**                    " provide tab-completion for file-related tasks

" set cursor shape (nvim >= 0.2)
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Highlight current line by bolding the text
highlight CursorLine cterm=bold   gui=bold
" Change the background of cursor
highlight Cursor     guibg=#626262
" Transparent background
highlight Normal guibg=NONE ctermbg=NONE

filetype indent on      " load filetype-specific indent files
filetype plugin on      " detects the type of file when the file is created or opened


" ----------------------------------------------------------------------------
" Splitting
set splitright          " new verticals split appears on the right
set splitbelow          " new horizontal split appears below


" ----------------------------------------------------------------------------
" Spaces and tabs
set expandtab           " tabs are spaces
set tabstop=4           " changes the width of the TAB character
set softtabstop=4       " affects what happens when press <TAB> or <BS> keys
set shiftwidth=4        " affects what happens when press >>, << or ==
set smarttab            " affects how <TAB> are interpreted based on cursor location
set autoindent          " copy the indentation from the prev line, on a new line

" If the filetype is Makefile then we need to use tabs
" So do not expand tabs into space.
autocmd FileType make   set noexpandtab


" ----------------------------------------------------------------------------
" Copy to clipboard
"set clipboard=unnamed       " On Windows/Mac
set clipboard=unnamedplus   " On Linux 


" ----------------------------------------------------------------------------
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight (by pressing <SPACE> in command mode)
nnoremap <leader><space> :nohlsearch<CR>


" ----------------------------------------------------------------------------
" Code folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " set folding method by looking at indentation


" ============================================================================
" Plugin configurations and key bindings
" ============================================================================

" ----------------------------------------------------------------------------
" Nerd tree
nnoremap <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nnoremap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()


" ----------------------------------------------------------------------------
" Manage buffers
set hidden

" Show interactive buffer list (need fzf)
nnoremap <F5> :Buffers<CR>
" Prev buffer
nnoremap <F6> :bp<CR>
" Next buffer
nnoremap <F7> :bn<CR>
" Close buffer and switch to the previous one
nnoremap <F8> :bp<CR>:bd #<CR>


" ----------------------------------------------------------------------------
" Run the make file
nnoremap <F10> :make<CR>


" ----------------------------------------------------------------------------
" Air line
let g:airline_powerline_fonts = 0
let g:airline_theme = 'base16_default'
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show path formatter
let g:airline#extensions#tabline#formatter = 'default'

" Show buffer index
let g:airline#extensions#tabline#buffer_nr_show = 1

" Use 'straight' tabline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '| '


" ----------------------------------------------------------------------------
" FZF
" Search for file name
nnoremap <C-P> :Files<CR>
" Search for file content (require ripgrep)
nnoremap <C-F> :Rg<CR>


" ----------------------------------------------------------------------------
" Shortcut for Python breakpoint (ipdb) - on the next line
autocmd FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" Shortcut for Python breakpoint (ipdb) - on the previous line
autocmd FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
