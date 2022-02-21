-------------------------------------------------------------------------------
-- Highlight related text under cursor
-- RRethy/vim-illuminate
-------------------------------------------------------------------------------
local g = vim.g
local cmd = vim.cmd

g.Illuminate_ftHighlightGroups = {
    vim = {'vimVar', 'vimString', 'vimLineComment', 'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc'}
}
g.Illuminate_ftblacklist = {'nerdtree', 'NvimTree'}
g.Illuminate_delay = 500

cmd [[
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord Visual
    "autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
augroup END
]]
