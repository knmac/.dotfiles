-------------------------------------------------------------------------------
-- Neovim Language Server Protocol
-- neovim/nvim-lspconfig
-- Ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Ref: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
-- Ref: https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/lsp.lua
-------------------------------------------------------------------------------
local servers = { 'pyright', 'bashls', 'clangd', 'vimls', 'sumneko_lua', 'ltex', 'texlab' }
require('nvim-lsp-installer').setup({
    ensure_installed = servers, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

local lspconfig = require('lspconfig') -- Must call after lsp installer

-------------------------------------------------------------------------------
-- Set up LSP servers
-------------------------------------------------------------------------------
local telescope_ok, telescope = pcall(require, 'telescope.builtin')

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', function()
    vim.diagnostic.open_float({ border = 'rounded' })
end, opts)
vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ border = 'rounded' }) end, opts)
vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ border = 'rounded' }) end, opts)
if telescope_ok then
    vim.keymap.set('n', '<leader>E', telescope.diagnostics, opts)
else
    vim.keymap.set('n', '<leader>E', function() vim.diagnostic.setloclist() end, opts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    if telescope_ok then
        vim.keymap.set('n', 'gd', telescope.lsp_definitions, bufopts)
        vim.keymap.set('n', 'gi', telescope.lsp_implementations, bufopts)
        vim.keymap.set('n', 'gr', telescope.lsp_references, bufopts)
        vim.keymap.set('n', 'gt', telescope.lsp_type_definitions, bufopts)
    else
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, bufopts)

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Server-specific configs
local path = vim.fn.stdpath('data') .. '/spelling/en-US.txt'
local words = {}
if io.open(path, 'r') ~= nil then
    for word in io.open(path, 'r'):lines() do
        table.insert(words, word)
    end
end
local server_cfgs = {
    sumneko_lua = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use', }
            }
        },
    },
    ltex = {
        ltex = {
            dictionary = {
                ['en-US'] = words,
            }
        },
    },
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        settings = server_cfgs[lsp],
    }
end


-------------------------------------------------------------------------------
-- Setup UI for LSP
-------------------------------------------------------------------------------
-- Popped up window borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    border = 'rounded',
}
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
    border = 'rounded',
    close_events = { 'CursorMoved', 'BufHidden', 'InsertCharPre' },
}
)

-- Diagnostic signs
vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = ' ', texthl = 'DiagnosticSignHint' })

-- Config diagnostics
vim.diagnostic.config({
    virtual_text = {
        source = 'always', -- Or 'if_many'  -> show source of diagnostics
        -- prefix = '■', -- Could be '●', '▎', 'x'
    },
    float = {
        source = 'always', -- Or 'if_many'  -> show source of diagnostics
    },
})
