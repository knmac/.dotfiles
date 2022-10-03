-------------------------------------------------------------------------------
-- Porject outline
-- simrat39/symbols-outline.nvim
-------------------------------------------------------------------------------
local ok, symbols_outline = pcall(require, 'symbols-outline')
if not ok then return end

symbols_outline.setup({
    width = 20,
    autofold_depth = 1,
})
