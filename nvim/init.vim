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
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Tab list panel
Plug 'kien/tabman.vim'

" Indexing search (show counter while searching)
Plug 'vim-scripts/IndexedSearch'

" Linters
"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" colorschemes
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'skielbasa/vim-material-monokai'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Code and files fuzzy finder
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Better control of terminal
Plug 'mklabs/split-term.vim'

" Indentation guide
Plug 'Yggdroot/indentLine'

" Detect indent automatically
Plug 'ciaranm/detectindent'

" Latex plugin
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()


" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" ============================================================================
" Color and syntax highlighting
syntax enable

if has("gui_running")
    let g:molokai_original = 1
else
    let g:rehash256 = 1
endif
colorscheme molokai

" Don't use polyglot for python syntax highlighting (semshi looks better)
let g:polyglot_disabled = ['py']


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
" Buffer settings (hiding instead of closing)
set hidden


" ============================================================================
" UI config
set ls=2                " always show status bar
set mouse=a             " use mouse
set number              " show line numbers
set numberwidth=5       " width of line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set colorcolumn=80      " show column ruler at the end

" Highlight current line by bolding the text
highlight CursorLine cterm=bold gui=bold
filetype indent on      " load filetype-specific indent files

set wildmode=list:longest  " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]

set backspace=indent,eol,start  " resolve the problem of backspace not working

" set cursor shape
" nvim >= 0.2
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor


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
set foldmethod=indent   " set folding method by looking at indentation


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
" Tag bar
nmap <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


" ============================================================================
" Manage buffers
" Show interactive buffer list (need fzf)
"nmap <F5> <C-p><C-f>
nmap <F5> :Buffers<CR>
" Prev buffer
nmap <F6> :bp<CR>
" Next buffer
nmap <F7> :bn<CR>
" Close buffer and switch to the previous one
nmap <F8> :bp<CR>:bd #<CR>


" ============================================================================
" Syntastic
"" show list of errors and warnings on the current file
"nmap <F9> :Errors<CR>
"" check also when just opened the file
"let g:syntastic_check_on_open = 1
"" don't put icons on the sign column (it hides the vcs status icons of signify)
"let g:syntastic_enable_signs = 0
"" ignore some errors
"let g:syntastic_python_flake8_args = ['--ignore=E501,E402,E226']
"" E501 : line too long
"" E402 : module level import not at top of file
"" E226 : arithmetic spacing


" ============================================================================
" Neomake
" Run linter on write
autocmd! BufWritePost,BufEnter * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" Whenever :Neomake is called, open the location list without switching focus
"let g:neomake_open_list = 2

" Change the default Neomake signs 
let g:neomake_warning_sign = {'text': 'W', 'texthl': 'WarningMsg'}
let g:neomake_error_sign = {'text': 'E', 'texthl': 'ErrorMsg'}

" Shortcut to toggle location list
"nmap <F9> :Neomake<CR>
let g:location_is_open = 0
function! LocationToggle()
    if g:location_is_open == 1
        lclose
        let g:location_is_open = 0
    else
        lopen
        let g:location_is_open = 1
    endif
endfunction
map <F9> <Esc>:call LocationToggle()<CR>


" ============================================================================
" TabMan
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'


" ============================================================================
" Air line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"
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
" Auto-completion
" Deoplete
set completeopt+=noinsert
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Jedi vim
" Deactivate autocompletion feature of jedi vim (and use deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Rename
let g:jedi#rename_command = ',r'
" Show definition
let g:jedi#documentation_command = ',k'
" Go to definition in new tab
" open an empty buffer
nmap ,D :tab split<CR>:call jedi#goto()<CR>


" =============================================================================
" Signify
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
"" CtrlP
"" Change the default mapping and the default command to invoke CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"" set its local working directory according to this variable
"let g:ctrlp_working_path_mode = 'ra'
"" Exclude files and directories using Vim's wildignore and CtrlP's own
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip      " MacOSX/Linux
""set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
""let g:ctrlp_custom_ignore = {
"  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  "\ 'file': '\v\.(exe|so|dll)$',
"  "\ 'link': 'some_bad_symbolic_links',
"  "\ }
"" Use a custom file listing command
""let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
""let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows


" =============================================================================
" FZF
" Search for file name
nmap <C-P> :Files<CR>
" Search for file content (require ripgrep)
nmap <C-G> :Rg<CR>


" =============================================================================
" Split-term
set splitright  " for when using :VTerm
set splitbelow  " for when using :Term


" =============================================================================
" Indentation guide
let g:indentLine_char = '▏'
" Do not use IndentLine in Markdown and Latex because it affect conceallevel
" in math rendering
autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType tex      let g:indentLine_enabled=0
"let g:indentLine_conceallevel = 1


" =============================================================================
" DetectIndent
" Auto matically run DetectIndent when open a file
autocmd BufReadPost * :DetectIndent

" To prefer expandtab to noexpandtab when detection is impossible
let g:detectindent_preferred_expandtab = 1
" Specify a preferred indent level when no detection is possible
let g:detectindent_preferred_indent = 4
" To use preferred values instead of guessing
let g:detectindent_preferred_when_mixed = 1


" =============================================================================
" Markdown syntax highlighting
" Syntax Concealing
"set conceallevel=0
" LaTeX math
let g:vim_markdown_math = 1
" YAML Front Matter
let g:vim_markdown_frontmatter = 1

filetype plugin on


" =============================================================================
" Shortcut for Python breakpoint (ipdb)
nmap <leader>b oimport ipdb; ipdb.set_trace()<esc>
