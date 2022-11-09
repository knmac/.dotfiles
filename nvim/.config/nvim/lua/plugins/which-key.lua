-------------------------------------------------------------------------------
-- Displays a popup with possible key bindings
-- folke/which-key.nvim
-------------------------------------------------------------------------------
local ok, wk = pcall(require, 'which-key')
if not ok then return end

wk.setup({
})
