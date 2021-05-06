let use_fancy_symbols = 1
let use_coc = 1

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
Plug 'vim-scripts/IndexedSearch'

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
Plug 'mklabs/split-term.vim'

" Indentation guide
Plug 'Yggdroot/indentLine'

" Detect indent automatically
Plug 'ciaranm/detectindent'

" Latex plugin
Plug 'lervag/vimtex'

" Markdown plugin
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

Plug 'voldikss/vim-floaterm'

" File type icons
if use_fancy_symbols
    Plug 'ryanoasis/vim-devicons'
endif

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
" Default configurations
" ============================================================================

" ----------------------------------------------------------------------------
" Color and syntax highlighting
syntax enable
set termguicolors

"if has("gui_running")
"    let g:molokai_original = 1
"else
"    let g:rehash256 = 1
"endif
"colorscheme molokai

"colorscheme one-monokai

"colorscheme material-monokai
"colorscheme onedark
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
set list
set listchars=tab:>-

" set cursor shape (nvim >= 0.2) (unnecessary for later nvim)
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
"highlight SignColumn guibg=black
"highlight LineNr     guifg=grey guibg=black

filetype indent on      " load filetype-specific indent files
filetype plugin on      " detect the type of file when the it's created/opened

"let g:semshi#excluded_hl_groups = ['local', 'builtin']


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
"set clipboard=unnamedplus   " On Linux 
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
" Plugin configurations and key bindings
" ============================================================================

" ----------------------------------------------------------------------------
" Task list
nnoremap <F2> :TaskList<CR>


" ----------------------------------------------------------------------------
" Nerd tree
if !use_coc
    nnoremap <F3> :NERDTreeToggle<CR>
    " open nerdtree with the current file selected
    nnoremap ,t :NERDTreeFind<CR>
    " don't show these file types
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']

    " Autorefresh on tree focus
    function! NERDTreeRefresh()
        if &filetype == "nerdtree"
            silent exe substitute(mapcheck("R"), "<CR>", "", "")
        endif
    endfunction

    autocmd BufEnter * call NERDTreeRefresh()
endif


" ----------------------------------------------------------------------------
" Tag bar
nnoremap <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


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
if !use_coc
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
endif


" ----------------------------------------------------------------------------
" Run the make file
nnoremap <F10> :make<CR>


" ----------------------------------------------------------------------------
" Toggle Float-term
let g:floaterm_keymap_toggle = '<F12>'


" ----------------------------------------------------------------------------
" Air line
let g:airline_powerline_fonts = 0
"let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'onedark'
let g:airline_theme = 'base16_default'
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
if use_fancy_symbols
    let g:airline_left_sep           = ''
    let g:airline_left_alt_sep       = ''
    let g:airline_right_sep          = ''
    let g:airline_right_alt_sep      = ''
    let g:airline_symbols.branch     = ''
    let g:airline_symbols.readonly   = ''
    let g:airline_symbols.paste      = 'ρ'
    let g:airline_symbols.linenr     = 'Ξ'
    let g:airline_symbols.maxlinenr  = ''
endif

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

" Remove unnecessary airline extensions to speed up
let g:airline_extensions = ['tabline', 'coc', 'branch', 'hunks']


" ----------------------------------------------------------------------------
" Coc
if use_coc 
    let g:coc_global_extensions = [
        \ 'coc-python',
        \ 'coc-json',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-sh',
        \ 'coc-clangd',
        \ 'coc-marketplace',
        \ 'coc-explorer'
        \ ]

    " TextEdit might fail if hidden is not set.
    "set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    "set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    "augroup mygroup
    "    autocmd!
    "    " Setup formatexpr specified filetype(s).
    "    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    "    " Update signature help on jump placeholder.
    "    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    "augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    "xmap <leader>a  <Plug>(coc-codeaction-selected)
    "nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    "nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    "nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    "xmap if <Plug>(coc-funcobj-i)
    "omap if <Plug>(coc-funcobj-i)
    "xmap af <Plug>(coc-funcobj-a)
    "omap af <Plug>(coc-funcobj-a)
    "xmap ic <Plug>(coc-classobj-i)
    "omap ic <Plug>(coc-classobj-i)
    "xmap ac <Plug>(coc-classobj-a)
    "omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    "nmap <silent> <C-s> <Plug>(coc-range-select)
    "xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    "command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    "command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    "command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <F9>      :<C-u>CocList diagnostics<cr>
    "" Show all diagnostics.
    "nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    "" Manage extensions.
    "nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    "" Show commands.
    "nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    "" Find symbol of current document.
    "nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    "" Search workspace symbols.
    "nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    "" Do default action for next item.
    "nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    "" Do default action for previous item.
    "nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    "" Resume latest coc list.
    "nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    nnoremap <silent> <F3> :CocCommand explorer --toggle<CR>
endif


" ----------------------------------------------------------------------------
" Deoplete 
if !use_coc
    " needed so deoplete can auto select the first suggestion
    "set completeopt+=noinsert

    " comment this line to enable autocompletion preview window
    " (displays documentation related to the selected completion option)
    " disabled by default because preview makes the window flicker
    set completeopt-=preview
    let g:float_preview#docked = 0

    let g:deoplete#enable_at_startup           = 1
    let g:deoplete#enable_ignore_case          = 1
    let g:context_filetype#same_filetypes      = {}
    let g:context_filetype#same_filetypes._    = '_'
    call deoplete#custom#option({
        \ 'auto_complete_delay': 200,
        \ 'smart_case': v:true,
        \ })

    " Close preview window after finishing completion
    " (only needed if use `set completeopt+=preview`)
    "autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

    " Deoplete-jedi
    let g:deoplete#sources#jedi#show_docstring = 1
    "let g:deoplete#sources#jedi#statement_length = 50

    " Deoplete-clang
    " Change the paths accordingly
    let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-10/lib/libclang.so.1"
    let g:deoplete#sources#clang#clang_header = "/usr/lib/llvm-10/lib/clang/10.0.0"
endif


" ----------------------------------------------------------------------------
" JediVim
if !use_coc
    " Deactivate autocompletion feature of jedi vim (and use deoplete instead)
    let g:jedi#completions_enabled = 0

    " Deactivate the window to shows detailing arguments (let deoplete handle this)
    let g:jedi#show_call_signatures = 0

    " Use <leader>k instead of the default `K`
    "let g:jedi#documentation_command = '<leader>k'
endif


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
"highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
"highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
"highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
"highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
"highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
"highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" ----------------------------------------------------------------------------
" FZF
" Search for file name
nnoremap <C-P> :Files<CR>
" Search for file content (require ripgrep)
nnoremap <C-F> :Rg<CR>


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
" Vim tex
let g:tex_flavor = "latex"


" ----------------------------------------------------------------------------
" Markdown syntax highlighting
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" LaTeX math
let g:vim_markdown_math = 1
" YAML Front Matter
let g:vim_markdown_frontmatter = 1
" Strikethrough
let g:vim_markdown_strikethrough = 1
" Adjust new list item indent
let g:vim_markdown_new_list_item_indent = 0


" ----------------------------------------------------------------------------
" Shortcut for Python breakpoint (ipdb) - on the next line
autocmd FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" Shortcut for Python breakpoint (ipdb) - on the previous line
autocmd FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
"
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
nnoremap <leader>= :call FillLine('=')<CR>


" ----------------------------------------------------------------------------
" Startify
let g:startify_session_dir = '~/.config/nvim/session'

" Update session automatically as you exit vim
let g:startify_session_persistence = 1


" ----------------------------------------------------------------------------
" Custom snippets
nnoremap ,py    :-1read $HOME/.config/nvim/skeletons/skeleton.py<esc>Gddgg
nnoremap ,html  :-1read $HOME/.config/nvim/skeletons/skeleton.html<esc>Gddgg
nnoremap ,md    :-1read $HOME/.config/nvim/skeletons/skeleton.md<esc>Gddgg
nnoremap ,today :read !date "+\%F"<CR>kJ$
