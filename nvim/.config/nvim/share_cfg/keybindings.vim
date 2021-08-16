" =============================================================================
" Basic key bindings
" =============================================================================

" Turn off search highlight (by pressing <SPACE> in command mode)
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Toggle the indent lines
if has_key(plugs, 'indent-blankline.nvim')
    nnoremap <silent> <leader>i :IndentBlanklineToggle<CR>
elseif has_key(plugs, 'indentLine')
    nnoremap <silent> <leader>i :IndentLinesToggle<CR>
endif

" Maintaining visual mode after shifting with > and <
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Go down/up soft-wrapped lines instead of 'real' lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" Window navigation
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l

" Buffer prev/next navigation
if has_key(plugs, 'nvim-bufferline.lua')
    nnoremap <silent> <C-A-h> :BufferLineCyclePrev<CR>
    nnoremap <silent> <C-A-l> :BufferLineCycleNext<CR>
else
    nnoremap <silent> <C-A-h> :bprevious<CR>
    nnoremap <silent> <C-A-l> :bnext<CR>
endif

" Search file name and file content
if has_key(plugs, 'fzf.vim')
    " Search for file name (require FZF)
    nnoremap <silent> <C-P> :Files<CR>

    " Search for file content (require FZF and ripgrep)
    nnoremap <silent> <C-F> :Rg<CR>
endif


" =============================================================================
" <F1> -> <F12> bindings
" =============================================================================

" <F1>: Show help
if has_key(plugs, 'fzf.vim')
    nnoremap <silent> <F1> :Helptags<CR>
endif

" <F2>: Show task list
if has_key(plugs, 'todo-comments.nvim')
    nnoremap <silent> <F2> :TodoQuickFix<CR>
elseif has_key(plugs, 'FixedTaskList.vim')
    nnoremap <silent> <F2> :TaskList<CR>
endif

" <F3>: Show file tree explorer
if has_key(plugs, 'nvim-tree.lua')
    nnoremap <silent> <F3> :NvimTreeToggle<CR> :NvimTreeRefresh<CR>
elseif has_key(plugs, 'coc.nvim')
    nnoremap <silent> <F3> :CocCommand explorer --toggle<CR>
elseif has_key(plugs, 'nerdtree')
    nnoremap <silent> <F3> :NERDTreeToggle<CR>
else
    nnoremap <silent> <F3> :call ToggleNetrw()<CR>
endif
 
" <F4>: Show tag bar
if has_key(plugs, 'symbols-outline.nvim')
    nnoremap <silent> <F4> :SymbolsOutline<CR>
elseif has_key(plugs, 'tagbar')
    nnoremap <silent> <F4> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1
elseif has_key(plugs, 'fzf.vim')
    nnoremap <silent> <F4> :BTags<CR>
endif

" <F5>: Show and switch buffer
if has_key(plugs, 'fzf.vim')
    nnoremap <silent> <F5> :Buffers<CR>
else
    nnoremap <silent> <F5> :buffers<CR>:buffer<Space>
endif
" <S-F5>: Show tab list
nnoremap <silent> <F17> :tabs<CR>

" <F6>: Prev buffer
if has_key(plugs, 'nvim-bufferline.lua')
    nnoremap <silent> <F6> :BufferLineCyclePrev<CR>
else
    nnoremap <silent> <F6> :bprevious<CR>
endif
" <S-F6>: Prev tab
nnoremap <silent> <F18> :tabprevious<CR>

" <F7>: Next buffer
if has_key(plugs, 'nvim-bufferline.lua')
    nnoremap <silent> <F7> :BufferLineCycleNext<CR>
else
    nnoremap <silent> <F7> :bnext<CR>
endif
" <S-F7>: Next tab
nnoremap <silent> <F19> :tabnext<CR>

" <F8>: Close current buffer and switch to previous buffer
if has_key(plugs, 'nvim-bufferline.lua')
    nnoremap <silent> <F8> :BufferLineCyclePrev<CR>:bdelete #<CR>
else
    nnoremap <silent> <F8> :bprevious<CR>:bdelete #<CR>
endif
" <S-F8>: Close current tab
nnoremap <silent> <F20> :tabclose<CR>

" <F9>: Show diagnostics Quickfix
if has_key(plugs, 'nvim-lspconfig')
    nnoremap <silent> <F9> <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
elseif has_key(plugs, 'coc.nvim')
    nnoremap <silent> <F9> :<C-u>CocList diagnostics<CR>
elseif has_key(plugs, 'ale')
    nnoremap <silent> <F9> :call QuickfixToggle()<CR>
endif

" <F10>: Run make file
nnoremap <silent> <F10> :make<CR>
" <S+F10>: Run make clean
nnoremap <silent> <F22> :make clean<CR>

" <F11>: Toggle hex color
"if has_key(plugs, 'Colorizer')
"    nnoremap <silent> <F11> :ColorToggle<CR>
"endif
" <F11>: Toggle zoom the current window (from custom functions)
nnoremap <silent> <F11> :call ToggleZoom(v:true)<CR>

" <F12>: Toggle float-term
if has_key(plugs, 'vim-floaterm')
    let g:floaterm_keymap_toggle = '<F12>'
endif
