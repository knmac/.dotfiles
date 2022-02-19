-------------------------------------------------------------------------------
-- File explorer
-- ms-jpq/chadtree
-------------------------------------------------------------------------------
local g = vim.g

-- g.chadtree_settings.theme.icon_glyph_set = 'ascii'
local chadtree_settings = { ... }
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

vim.api.nvim_set_var("chadtree_settings.theme.icon_glyph_set", 'ascii')
