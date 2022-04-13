-------------------------------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-------------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd
-- local g = vim.g


-------------------------------------------------------------------------------
-- Basic key bindings
-------------------------------------------------------------------------------
-- Clear search highlighting
-- map('n', '<leader><space>', ':nohl<CR>', default_opts)

-- Maintain visual mode after shifting
map('v', '>', '>gv', default_opts)
map('v', '<', '<gv', default_opts)

-- -- Go down/up soft-wrapped lines instead of 'real' lines
map('n', 'j', 'gj', default_opts)
map('n', 'k', 'gk', default_opts)

-- Keep the cursor line in the middle of the screen
-- map('n', 'j', 'jzz', default_opts)
-- map('n', 'k', 'kzz', default_opts)

-- Use ; to enter command mode
-- map('n', ';', ':', { noremap = true })
-- map('v', ';', ':', { noremap = true })

-- Window navigation
map('n', '<A-h>', '<C-w>h', default_opts)
map('n', '<A-j>', '<C-w>j', default_opts)
map('n', '<A-k>', '<C-w>k', default_opts)
map('n', '<A-l>', '<C-w>l', default_opts)

-- Window swapping
map('n', '<A-S-h>', '<C-w>h<C-w>x', default_opts)
map('n', '<A-S-j>', '<C-w>j<C-w>x', default_opts)
map('n', '<A-S-k>', '<C-w>k<C-w>x', default_opts)
map('n', '<A-S-l>', '<C-w>l<C-w>x', default_opts)

-- Buffer prev/next navigation
-- map('n', '<C-A-h>', ':bprev<CR>', default_opts)
-- map('n', '<C-A-l>', ':bnext<CR>', default_opts)

-- Navigation from terminal
map('t', '<esc>', [[<C-\><C-n>]], default_opts)
map('t', '<A-h>', [[<C-\><C-n><C-w>h]], default_opts)
map('t', '<A-j>', [[<C-\><C-n><C-w>j]], default_opts)
map('t', '<A-k>', [[<C-\><C-n><C-w>k]], default_opts)
map('t', '<A-l>', [[<C-\><C-n><C-w>l]], default_opts)

-- Shortcut for Python breakpoint (ipdb)
cmd [[
autocmd FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
autocmd FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>
]]

-- Clear registered macros
cmd [[
function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction
 
command! ClearRegisters call ClearRegisters()
]]

-- Toogle zoom the current window
cmd [[
function! ToggleZoom(zoom)
    if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
        exec t:restore_zoom.cmd
        unlet t:restore_zoom
    elseif a:zoom
        let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
        exec "normal \<C-W>\|\<C-W>_"
    endif
endfunction

augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
]]

-- Fill the rest of line with characters
cmd [[
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 79 | endif
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction
]]
-- Fill with '-' characters
map('n', '<leader>-', ':call FillLine("-")<CR>', default_opts)
-- Fill with '=' characters
map('n', '<leader>=', ':call FillLine("=")<CR>', default_opts)

-------------------------------------------------------------------------------
-- Plugins and Function key bindings
-------------------------------------------------------------------------------
-- Bufferline
map('n', '<C-A-h>',   ':BufferLineCyclePrev<CR>', default_opts)
map('n', '<C-A-l>',   ':BufferLineCycleNext<CR>', default_opts)
map('n', '<C-A-S-h>', ':BufferLineMovePrev<CR>', default_opts)
map('n', '<C-A-S-l>', ':BufferLineMoveNext<CR>', default_opts)
map('n', '<C-A-j>',   ':BufferLinePick<CR>', default_opts)
map('n', '<C-A-k>',   ':BufferLinePickClose<CR>', default_opts)

-- Telescope
map('n', '<space><space>', ':Telescope<CR>', default_opts)
map('n', '<space>f',       ':Telescope find_files<CR>', default_opts)
map('n', '<space>w',       ':Telescope live_grep<CR>', default_opts)
map('n', '<space>/',       ':Telescope current_buffer_fuzzy_find<CR>', default_opts)

-- Easy align
-- Start interactive EasyAlign in visual mode (e.g. vipga)
map('x', 'ga', '<Plug>(EasyAlign)', {})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
map('n', 'ga', '<Plug>(EasyAlign)', {})

-- <F1>: Show help
map('n', '<F1>', ':Telescope help_tags<CR>', default_opts)
-- <S-F1>: Show keymaps
map('n', '<F13>', ':Telescope keymaps<CR>', default_opts)

-- <F2>: Show task list
map('n', '<F2>', ':TodoTelescope<CR>', default_opts)

-- <F3>: Show file tree explorer
map('n', '<F3>', ':NvimTreeToggle<CR>', default_opts)

-- <F4>: Show tags of current buffer
-- map('n', '<F4>', ':Telescope current_buffer_tags<CR>', default_opts)
map('n', '<F4>', ':Vista!!<CR>', default_opts)
-- <S-F4>: Generate tags
map('n', '<F16>', ':!ctags -R --links=no . <CR>', default_opts)

-- <F5>: Show and switch buffer
map('n', '<F5>', ':Telescope buffers<CR>', default_opts)
-- <S-F5>: Show and switch tab
map('n', '<F17>', ':tabs<CR>', default_opts)

-- <F6>: Prev buffer
map('n', '<F6>', ':BufferLineCyclePrev<CR>', default_opts)
-- nnoremap <silent> <F6> :bprevious<CR>
-- <S-F6>: Prev tab
map('n', '<F18>', ':tabprevious<CR>', default_opts)

-- <F7>: Next buffer
map('n', '<F7>', ':BufferLineCycleNext<CR>', default_opts)
-- nnoremap <silent> <F7> :bnext<CR>
-- <S-F7>: Next tab
map('n', '<F19>', ':tabnext<CR>', default_opts)

-- <F8>: Close current buffer and switch to previous buffer
map('n', '<F8>', ':BufferLineCyclePrev<CR>:bdelete #<CR>', default_opts)
-- <S-F8>: Close current tab
map('n', '<F20>', ':tabclose<CR>', default_opts)

-- <F9>: Show diagnostics Quickfix
-- See nvim-lsp config
-- map('n', '<F9>', ':Telescope lsp_document_diagnostics<CR>', default_opts)

-- <F10>: Run make file
map('n', '<F10>', ':make<CR>', default_opts)
-- <S-F10>: Run make clean
map('n', '<F22>', ':make clean<CR>', default_opts)

-- <F11>: Toggle zoom the current window (from custom functions)
map('n', '<F11>', ':call ToggleZoom(v:true)<CR>', default_opts)
-- <S-F11>: Toggle colorizer
map('n', '<F23>', ':ColorizerToggle<CR>', default_opts)

-- <F12>: Toggle float-term
-- See toogle term config
-- <S-F12>: Toggle relative number
map('n', '<F24>', ':set nu rnu!<CR>', default_opts)
