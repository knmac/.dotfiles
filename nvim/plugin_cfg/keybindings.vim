" Basic key bindings

if has_key(plugs, 'fzf.vim')
    " Search for file name (require FZF)
    nnoremap <silent> <C-P> :Files<CR>

    " Search for file content (require FZF and ripgrep)
    nnoremap <silent> <C-F> :Rg<CR>
endif

" <F1>: show help

" <F2>: Task List
if has_key(plugs, 'todo-comments.nvim')
    nnoremap <silent> <F2> :TodoQuickFix<CR>
elseif has_key(plugs, 'FixedTaskList.vim')
    nnoremap <silent> <F2> :TaskList<CR>
endif

" <F3>: File tree explorer
if has_key(plugs, 'nvim-tree.lua')
    nnoremap <silent> <F3> :NvimTreeToggle<CR>
elseif has_key(plugs, 'coc.nvim')
    nnoremap <silent> <F3> :CocCommand explorer --toggle<CR>
elseif has_key(plugs, 'nerdtree')
    nnoremap <silent> <F3> :NERDTreeToggle<CR>
else
    nnoremap <silent> <F3> :call ToggleNetrw()<CR>
endif
 
" <F4>: Tag bar
if has_key(plugs, 'symbols-outline.nvim')
    nnoremap <silent> <F4> :SymbolsOutline<CR>
elseif  has_key(plugs, 'tagbar')
    nnoremap <silent> <F4> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1
endif

" <F5>: switch buffer
if has_key(plugs, 'fzf.vim')
    nnoremap <silent> <F5> :Buffers<CR>
else
    nnoremap <silent> <F5> :buffers<CR>:buffer<Space>
endif
nnoremap <silent> <F17> :tabs<CR>

" <F6>: Prev buffer
nnoremap <silent> <F6> :bprevious<CR>
nnoremap <silent> <A-h> :bprevious<CR>
nnoremap <silent> <F18> :tabprevious<CR>

" <F7>: Next buffer
nnoremap <silent> <F7> :bnext<CR>
nnoremap <silent> <A-l> :bnext<CR>
nnoremap <silent> <F19> :tabnext<CR>

" <F8>: Close buffer and switch to the previous one
nnoremap <silent> <F8> :bprevious<CR>:bdelete #<CR>
nnoremap <silent> <F20> :tabclose<CR>

" <F9>: Show diagnostics Quickfix
if has_key(plugs, 'nvim-lspconfig')
    nnoremap <silent> <F9> <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
elseif has_key(plugs, 'coc.nvim')
    nnoremap <silent> <F9> :<C-u>CocList diagnostics<CR>
elseif has_key(plugs, 'ale')
    nnoremap <silent> <F9> :call QuickfixToggle()<CR>
endif

" <F10>: Run the make file
nnoremap <silent> <F10> :make<CR>
nnoremap <silent> <F22> :make clean<CR>

" <F12>: Toggle Float-term
if has_key(plugs, 'vim-floaterm')
    let g:floaterm_keymap_toggle = '<F12>'
endif

