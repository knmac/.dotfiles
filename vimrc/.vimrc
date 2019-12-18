" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
call plug#begin('~/.vim/plugged')

" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Class/module browser
Plug 'majutsushi/tagbar'
" Git integration
"Plug 'motemen/git-vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
" Tab list panel
Plug 'kien/tabman.vim'
" Indexing search (show counter while searching)
Plug 'vim-scripts/IndexedSearch'
" Python and other languages code checker
Plug 'scrooloose/syntastic'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code autocompletion, go to definition
" Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
" Latex plugin
Plug 'vim-latex/vim-latex'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" colorschemes
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'skielbasa/vim-material-monokai'
" make python syntax look prettier
Plug 'sheerun/vim-polyglot'
"Plug 'sentientmachine/Pretty-Vim-Python'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Buffer explorer
"Plug 'fholgado/minibufexpl.vim'
" Indentation guide
Plug 'Yggdroot/indentLine'
" Markdown syntax highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()


" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" ============================================================================
" Color setting
syntax enable

colorscheme molokai
if has("gui_running")
    let g:molokai_original = 1
else
    let g:rehash256 = 1
endif


" ============================================================================
" Spaces and tabs
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set smarttab
set autoindent
set expandtab           " tabs are spaces
if has("autocmd")
    " If the filetype is Makefile then we need to use tabs
    " So do not expand tabs into space.
    autocmd FileType make   set noexpandtab
endif


" ============================================================================
" Buffer settings
set hidden


" ============================================================================
" UI config
set ls=2                " always show status bar
set mouse=a
set number              " show line numbers
set numberwidth=5
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set colorcolumn=80
highlight CursorLine cterm=bold gui=bold
filetype indent on      " load filetype-specific indent files
" set wildmenu            " visual autocomplete for command menu (press <TAB> while typing in command mode)
set wildmode=list:longest
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]

set backspace=indent,eol,start


" =============================================================================
" Change cursor shape for tmux
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" ============================================================================
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight (by pressing <SPACE> in command mode)
nnoremap <leader><space> :nohlsearch<CR>


" ============================================================================
" Code folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent


" ============================================================================
" Make function keys work for mac
if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
	map <Esc>OP <F1>
 	map <Esc>OQ <F2>
 	map <Esc>OR <F3>
 	map <Esc>OS <F4>
 	map <Esc>[16~ <F5>
	map <Esc>[17~ <F6>
	map <Esc>[18~ <F7>
	map <Esc>[19~ <F8>
	map <Esc>[20~ <F9>
	map <Esc>[21~ <F10>
	map <Esc>[23~ <F11>
	map <Esc>[24~ <F12>
endif

" ============================================================================
" Task list
nmap <F2> :TaskList<CR>


" ============================================================================
" Nerd tree
nmap <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" ============================================================================
" Buffer shortcut
" Show interactive buffer list (need CtrlP)
nmap <F5> <C-p><C-f>
" Prev buffer
nmap <F6> :bp<CR>
" Next buffer
nmap <F7> :bn<CR>


" ============================================================================
" Tag bar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


" ============================================================================
" Syntastic
" show list of errors and warnings on the current file
nmap <F9> :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it etides the vcs status icons of signify)
let g:syntastic_enable_signs = 0


" ============================================================================
" Run the make file
nmap <F10> :make<CR>


" ============================================================================
" TabMan
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'


" ============================================================================
" Air line
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''
let g:airline_symbols.linenr     = ''
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
" Show path formatter
let g:airline#extensions#tabline#formatter = 'default'
" Show buffer index
let g:airline#extensions#tabline#buffer_nr_show = 1
" Use 'straight' tabline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '| '


" ============================================================================
" Jedi vim
" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
" open an empty buffer
nmap ,D :tab split<CR>:call jedi#goto()<CR>


" Signify ====================================================================
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_realtime = 1
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" =============================================================================
" CtrlP
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'
" Exclude files and directories using Vim's wildignore and CtrlP's own
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }
" Use a custom file listing command
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows


" =============================================================================
" Mini Buffer Explorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1


" =============================================================================
" indentation guide
let g:indentLine_char = '▏'


" =============================================================================
" Markdown syntax highlighting
filetype plugin on
" LaTeX math
let g:vim_markdown_math = 1
" YAML Front Matter
let g:vim_markdown_frontmatter = 1
" Syntax Concealing
set conceallevel=0
