-------------------------------------------------------------------------------
-- Show project outline
-- simrat39/symbols-outline.nvim
-------------------------------------------------------------------------------
local ok, symbols_outline = pcall(require, 'symbols-outline')
if not ok then return end

--- Return with with minimum threshold
local width_with_min = function(ratio, min_width)
    local width = math.floor(vim.go.columns * ratio)
    width = math.max(width, min_width)
    return width
end

symbols_outline.setup({
    relative_width = false,
    width = width_with_min(0.15, 30),
    autofold_depth = 1,
})
