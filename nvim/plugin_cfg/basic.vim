" =============================================================================
" Basic configurations
" =============================================================================

" -----------------------------------------------------------------------------
" Color and syntax highlighting
syntax enable
set termguicolors


" -----------------------------------------------------------------------------
" Look and feel
set ls=2                        " always show status bar
set mouse=a                     " use mouse
set number                      " show line numbers
set numberwidth=5               " width of line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set colorcolumn=80              " show column ruler at the end
set encoding=utf-8              " use unicode
set wildmenu                    " use wildmenu
set wildmode=longest:full,full  " visual autocomplete for command menu
"set wildmode=list:longest       " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " highlight matching [{()}]
set backspace=indent,eol,start  " resolve the problem of backspace not working
set path+=**                    " provide tab-completion for file-related tasks
set list
set listchars=tab:>-,trail:.    " show tab character as >- and trailing space as .
set hidden                      " not forced to write or undo changes of a file upon closing

" set cursor shape (nvim >= 0.2)
"set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Highlight current line by bolding the text
highlight CursorLine cterm=bold   gui=bold
" Change the background of cursor
highlight Cursor     guibg=#626262
" Transparent background
highlight Normal     guibg=NONE ctermbg=NONE
" Clear highlight on sign column
highlight clear SignColumn
" Italic comments
highlight Comment    cterm=italic gui=italic
" Italic comments
highlight String     cterm=italic gui=italic
"highlight SignColumn guibg=black
"highlight LineNr     guifg=grey guibg=black

filetype indent on      " load filetype-specific indent files
filetype plugin on      " detects the type of file when the file is created or opened


" -----------------------------------------------------------------------------
" Splitting
set splitright          " new verticals split appears on the right
set splitbelow          " new horizontal split appears below


" -----------------------------------------------------------------------------
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

" 2 spaces for html
autocmd FileType html   setlocal tabstop=2 softtabstop=2 shiftwidth=2


" -----------------------------------------------------------------------------
" Copy to clipboard
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif


" -----------------------------------------------------------------------------
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches


" -----------------------------------------------------------------------------
" Code folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " set folding method by looking at indentation
