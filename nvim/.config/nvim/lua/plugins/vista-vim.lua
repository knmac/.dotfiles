-------------------------------------------------------------------------------
-- View and search for LSP symbols
-- liuchengxu/vista.vim
-------------------------------------------------------------------------------
local g = vim.g

g.vista_default_executive = 'ctags'
-- g.vista_default_executive = 'nvim_lsp'
g.vista_finder_alternative_executives = {'nvim_lsp',}
g.vista_sidebar_width = 40
g.vista_disable_statusline = 1
