-------------------------------------------------------------------------------
-- OneDarkPro colorscheme
-- olimorris/onedarkpro.nvim
-------------------------------------------------------------------------------
local onedarkpro = require('onedarkpro')

onedarkpro.setup({
    -- Override default colors. Can specify colors for 'onelight' or 'onedark' themes
    colors = {
        -- onedark = {
        --     -- Standard colors
        --     bg = '#282c34',
        --     black = '#282c34',
        --     gray = '#393e48',
        --     -- Additional colors
        --     comment = '#5c6370',
        -- },
    },
    -- Override default highlight groups
    highlights = {
        -- CursorLine = { style = 'bold' },
        Operator = { style = 'NONE' },  -- default is italic
    },
    -- Override default styles
    styles = {
        strings = 'italic', -- Style that is applied to strings
        comments = 'italic', -- Style that is applied to comments
        keywords = 'bold', -- Style that is applied to keywords
        functions = 'bold', -- Style that is applied to functions
        variables = 'NONE', -- Style that is applied to variables
    },
    -- Override default options
    options = {
        bold = true, -- Use the themes opinionated bold styles?
        italic = true, -- Use the themes opinionated italic styles?
        underline = true, -- Use the themes opinionated underline styles?
        undercurl = true, -- Use the themes opinionated undercurl styles?
        cursorline = true, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    }
})

onedarkpro.load()
