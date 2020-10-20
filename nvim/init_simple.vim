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

Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

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
set termguicolors
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
set wildmenu
set wildmode=longest:full,full  " visual autocomplete for command menu
"set wildmode=list:longest       " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " highlight matching [{()}]
set backspace=indent,eol,start  " resolve the problem of backspace not working
set path+=**                    " provide tab-completion for file-related tasks

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
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif


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


" ----------------------------------------------------------------------------
" Vmap for maintaining visual mode after shifting > and <
vmap < <gv
vmap > >gv


" ============================================================================
" Key bindings
" ============================================================================

" ----------------------------------------------------------------------------
" File explorer with Netrw
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <F3> :call ToggleNetrw()<CR>


" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Change directory to the current buffer when opening files.
set autochdir


" ----------------------------------------------------------------------------
" Manage buffers
set hidden

" Show buffer list
nnoremap <F5> :buffers<CR>:buffer<Space>
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
" Shortcut for Python breakpoint (ipdb) - on the next line
autocmd FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" Shortcut for Python breakpoint (ipdb) - on the previous line
autocmd FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

" fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 79 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

nnoremap <leader>- :call FillLine('-')<CR>

" ----------------------------------------------------------------------------
" Custom snippets
nnoremap ,py    :-1read $HOME/.config/nvim/skeletons/skeleton.py<esc>Gddgg
nnoremap ,html  :-1read $HOME/.config/nvim/skeletons/skeleton.html<esc>Gddgg
nnoremap ,md    :-1read $HOME/.config/nvim/skeletons/skeleton.md<esc>Gddgg
nnoremap ,today :read !date "+\%F"<CR>kJ$


" ============================================================================
" Plugin configurations
" ============================================================================
"set showtabline=2
"set laststatus=2
