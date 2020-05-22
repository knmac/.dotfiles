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
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'

" Indexing search (show counter while searching)
Plug 'vim-scripts/IndexedSearch'

" Linters
Plug 'dense-analysis/ale'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Async autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'   " for Python
"Plug 'deoplete-plugins/deoplete-clang'  " for C/C++/Obj-C/Obj-C++ with clang-python3

" Function navigation for python without using ctags
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'

" colorschemes
"Plug 'tomasr/molokai'
Plug 'fratajczak/one-monokai-vim'
"Plug 'skielbasa/vim-material-monokai'
"Plug 'joshdick/onedark.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Better control of terminal
Plug 'mklabs/split-term.vim'

" Indentation guide
Plug 'Yggdroot/indentLine'

" Detect indent automatically
Plug 'ciaranm/detectindent'

" Latex plugin
Plug 'lervag/vimtex'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" File type icons
Plug 'ryanoasis/vim-devicons'

" CSS color highlighter
Plug 'lilydjwg/colorizer'

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

"if has("gui_running")
    "let g:molokai_original = 1
"else
    "let g:rehash256 = 1
"endif
"colorscheme molokai

set termguicolors
colorscheme one-monokai

"colorscheme material-monokai
"colorscheme onedark

" Don't use polyglot for python syntax highlighting (semshi looks better)
let g:polyglot_disabled = ['py']


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

filetype indent on      " load filetype-specific indent files
filetype plugin on      " detects the type of file when the file is created or opened


" ----------------------------------------------------------------------------
" Spaces and tabs
set expandtab           " tabs are spaces
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set smarttab
set autoindent

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
" Task list
nnoremap <F2> :TaskList<CR>


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
" Tag bar
nnoremap <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


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
"" ALE
" Force to use flake8
let g:ale_linters = {
    \'python': ['flake8'],
    \}
let g:ale_python_flake8_options = '--ignore=E501,E402,E226'
" E501 : line too long
" E402 : module level import not at top of file
" E226 : arithmetic spacing

" Change message format
let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str    = 'I'
let g:ale_echo_msg_format      = '[%linter%] %code%: %s [%severity%]'

" Use quickfix list instead of location list
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 1

" Press <F9> to toggle quickfix list
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open == 1
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
nnoremap <F9> :call QuickfixToggle()<CR>


" ----------------------------------------------------------------------------
" Run the make file
nnoremap <F10> :make<CR>


" ----------------------------------------------------------------------------
" Air line
let g:airline_powerline_fonts = 0
"let g:airline_theme = 'bubblegum'
let g:airline_theme = 'onedark'
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
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.linenr     = 'Ξ'
let g:airline_symbols.maxlinenr  = ''

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


" ----------------------------------------------------------------------------
" Deoplete 
" needed so deoplete can auto select the first suggestion
"set completeopt+=noinsert

" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
"set completeopt-=preview

let g:deoplete#enable_at_startup           = 1
let g:deoplete#enable_ignore_case          = 1
let g:context_filetype#same_filetypes      = {}
let g:context_filetype#same_filetypes._    = '_'
"call deoplete#custom#option({
"    \ 'auto_complete_delay': 200,
"    \ 'smart_case': v:true,
"    \ })

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1
"let g:deoplete#sources#jedi#statement_length = 50

" Deoplete-clang
" Change the paths accordingly
"let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-10/lib/libclang.so.1"
"let g:deoplete#sources#clang#clang_header = "/usr/lib/llvm-10/lib/clang/10.0.0"


" ----------------------------------------------------------------------------
" JediVim
" Deactivate autocompletion feature of jedi vim (and use deoplete instead)
let g:jedi#completions_enabled = 0

" Deactivate the window to shows detailing arguments (let deoplete handle this)
let g:jedi#show_call_signatures = 0

" Use <leader>k instead of the default `K` for better consistency
let g:jedi#documentation_command = '<leader>k'


" ----------------------------------------------------------------------------
" Signify
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_realtime = 1

" mappings to jump to changed blocks
nnoremap <leader>sn <plug>(signify-next-hunk)
nnoremap <leader>sp <plug>(signify-prev-hunk)

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" ----------------------------------------------------------------------------
" FZF
" Search for file name
nnoremap <C-P> :Files<CR>
" Search for file content (require ripgrep)
nnoremap <C-F> :Rg<CR>


" ----------------------------------------------------------------------------
" Split-term
set splitright  " for when using :VTerm
set splitbelow  " for when using :Term


" ----------------------------------------------------------------------------
" Indentation guide
let g:indentLine_char = '▏'

" Prevent the plugin from changing the conceal level setting automatically
let g:indentLine_setConceal = 0
let g:indentLine_faster = 1

" Toggle conceallevel, good when your want to copy text and avoid copying 
" indentLine_char
nnoremap ,c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo "conceallevel =" &cole <CR>


" ----------------------------------------------------------------------------
" DetectIndent
" Auto matically run DetectIndent when open a file
autocmd BufReadPost * :DetectIndent

" To prefer expandtab to noexpandtab when detection is impossible
let g:detectindent_preferred_expandtab = 1
" Specify a preferred indent level when no detection is possible
let g:detectindent_preferred_indent = 4
" To use preferred values instead of guessing
let g:detectindent_preferred_when_mixed = 1


" ----------------------------------------------------------------------------
" Markdown syntax highlighting
" LaTeX math
let g:vim_markdown_math = 1
" YAML Front Matter
let g:vim_markdown_frontmatter = 1


" ----------------------------------------------------------------------------
" Shortcut for Python breakpoint (ipdb) - on the next line
au FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" Shortcut for Python breakpoint (ipdb) - on the previous line
au FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>


" ----------------------------------------------------------------------------
" Custom snippets
nnoremap ,py   :-1read $HOME/.config/nvim/skeletons/skeleton.py<esc>Gddgg
nnoremap ,html :-1read $HOME/.config/nvim/skeletons/skeleton.html<esc>Gddgg
nnoremap ,md   :-1read $HOME/.config/nvim/skeletons/skeleton.md<esc>Gddgg
nnoremap ,date :read !date "+\%F"<CR>kJxA
