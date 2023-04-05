-------------------------------------------------------------------------------
-- File explorer
-- nvim-neo-tree/neo-tree.nvim
-------------------------------------------------------------------------------
local neotree_ok, neotree = pcall(require, 'neo-tree')
if not neotree_ok then return end

local winpicker_ok, winpicker = pcall(require, 'window-picker')
if not winpicker_ok then return end

-- Set up window picker
winpicker.setup({
    autoselect_one = true,
    include_current = false,
    selection_chars = '12334567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal', 'quickfix' },
        },
    },
    fg_color = '#24273A',
    other_win_hl_color = '#8AADF4',
})


-- Set up neo-tree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
neotree.setup({
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
        winbar = true,
        statusline = false,
    },
})
