-------------------------------------------------------------------------------
-- Floating terminal
-- voldikss/vim-floaterm
-------------------------------------------------------------------------------
local cmd = vim.cmd
local g = vim.g

cmd [[
autocmd ColorScheme * highlight FloatermBorder guibg=NONE guifg=Orange
]]

g.floaterm_borderchars = '─│─│╭╮╯╰'
g.floaterm_height = 0.8
g.floaterm_width = 0.8
