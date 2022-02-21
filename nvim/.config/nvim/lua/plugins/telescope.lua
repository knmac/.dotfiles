-------------------------------------------------------------------------------
-- Fuzzy finder for multiple things
-- nvim-telescope/telescope.nvim
-------------------------------------------------------------------------------
require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<C-h>"] = "which_key"
                ["<C-j>"] = "preview_scrolling_down",
                ["<C-k>"] = "preview_scrolling_up",
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        ['ui-select'] = {
            require('telescope.themes').get_dropdown {
                -- even more opts
            }
        }
    }
})

-- Load other telescope extensions
require('telescope').load_extension('ui-select')
