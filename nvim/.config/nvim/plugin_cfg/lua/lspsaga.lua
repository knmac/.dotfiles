local saga = require 'lspsaga'

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '  ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = '<CR>',
        vsplit = 'v',
        split = 's',
        quit = '<Esc>',  -- quit can be a table
        scroll_down = '<C-j>',
        scroll_up = '<C-k>'
    },
    code_action_keys = {
        quit = '<Esc>',
        exec = '<CR>'
    },
    rename_action_keys = {
        quit = '<Esc>',
        exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    --"single" "double" "round" "plus"
    border_style = "round",
    rename_prompt_prefix = '➤',
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = {metals = {'sbt', 'scala'}}
    -- server_filetype_map = {}
}


-- Set key bindings
local opts = {
    noremap = true,
    silent = true,
}

-- scroll hover doc or scroll in definition
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

-- Async LSP finder
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)

-- Preview definition
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)

-- Hover doc
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)

-- Rename
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)

-- Navigate diagnostic
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)

-- Code action
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
vim.api.nvim_set_keymap('v', '<leader>ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)

-- Float term
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>', opts)
vim.api.nvim_set_keymap('t', '<F12>', '<C-\\><C-n>:lua require("lspsaga.floaterm").close_float_terminal()<CR>', opts)
