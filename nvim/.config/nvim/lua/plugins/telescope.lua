-------------------------------------------------------------------------------
-- Fuzzy finder for multiple things
-- nvim-telescope/telescope.nvim
-------------------------------------------------------------------------------
local ok, telescope = pcall(require, 'telescope')
if not ok then return end

telescope.setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ['<C-h>'] = 'which_key'
                ['<C-j>'] = 'preview_scrolling_down',
                ['<C-k>'] = 'preview_scrolling_up',
            }
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
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
        ['fzf'] = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        -- ['ui-select'] = {
        --     require('telescope.themes').get_dropdown {
        --         -- even more opts
        --     }
        -- },
        ['bibtex'] = {
            -- Path to global bibliographies (placed outside of the project)
            global_files = {
                os.getenv('HOME')..'/Documents/global.bib',
            },
            -- Use context awareness
            context = true,
            -- Use non-contextual behavior if no context found
            -- This setting has no effect if context = false
            context_fallback = true,
            citation_format = '{{author}} {{title}}. {{booktitle}}{{journal}}. {{year}}.',
        },
    }
})

-- Load other telescope extensions
telescope.load_extension('fzf')
-- telescope.load_extension('ui-select')
telescope.load_extension('bibtex')
telescope.load_extension('file_browser')
