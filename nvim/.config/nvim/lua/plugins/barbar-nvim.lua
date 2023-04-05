-------------------------------------------------------------------------------
-- Bufferline on the top
-- romgrk/barbar.nvim
-------------------------------------------------------------------------------
local ok, barbar = pcall(require, 'barbar')
if not ok then return end

barbar.setup({
    -- Excludes buffers from the tabline
    exclude_ft = {},
    exclude_name = {},
    -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
    hide = { extensions = false, inactive = false },
    icons = {
        modified = { button = '' },
        pinned = { button = '' },
    },
    -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = { text = 'undotree' },
        -- Or, specify the event which the sidebar executes when leaving:
        -- ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify both
        -- Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
    },
})
