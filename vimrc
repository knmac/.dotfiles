"=========================
" Vundle
"=========================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Added plugin
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"=========================
" Color setting
"=========================
syntax enable    	    " enable syntax processing
colorscheme default


"=========================
" Spaces & Tabs
"=========================
set tabstop=4		    " number of visual spaces per TAB
set softtabstop=4	    " number of spaces in tab when editing
set expandtab       	" tabs are spaces
set shiftwidth=4
set smarttab
set autoindent


"=========================
" UI config
"=========================
set number		        " show line numbers
set showcmd		        " show command in bottom bar
set cursorline          " highlight current line
hi Cursorline term=bold cterm=bold guibg=Grey40
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu (press <TAB> while typing in command mode)
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set visualbell          " use visualbell instead of sound


"=========================
" Searching
"=========================
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
 " turn off search highlight (by pressing <SPACE> in command mode)
nnoremap <leader><space> :nohlsearch<CR> 


"=========================
" Folding
"=========================
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
"set foldmethod=syntax   " fold based on syntax
set foldmethod=indent


"=========================
" Tagbar
"=========================
nmap <F8> :TagbarToggle<CR>

"=========================
" NerdTree
"=========================
nmap <F7> :NERDTreeToggle<CR> 
