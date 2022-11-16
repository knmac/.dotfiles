-------------------------------------------------------------------------------
-- Neovim Language Server Protocol
-- neovim/nvim-lspconfig
-- Ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Ref: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
-- Ref: https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/lsp.lua
-------------------------------------------------------------------------------
local servers = { 'pyright', 'bashls', 'clangd', 'vimls', 'sumneko_lua', 'ltex', 'texlab' }

-- Install the LSP servers automatically using mason-lspconfig
local mason_ok, _ = pcall(require, 'mason')
if not mason_ok then return end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then return end
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- Init for lspconfig
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig') -- Must call after lsp installer
if not lspconfig_ok then return end

local navic_ok, navic = pcall(require, 'nvim-navic')

-------------------------------------------------------------------------------
-- Set up LSP servers
-------------------------------------------------------------------------------
local telescope_ok, telescope = pcall(require, 'telescope.builtin')

-- Wrapper for keymapping with default opts
local map = function(mode, lhs, rhs, desc)
    local opts = { noremap = true, silent = true, desc = 'LSP: ' .. desc }
    vim.keymap.set(mode, lhs, rhs, opts)
end

local bufmap = function(mode, lhs, rhs, bufnr, desc)
    local bufopts = { noremap = true, silent = true, buffer = bufnr, desc = 'LSP: ' .. desc }
    vim.keymap.set(mode, lhs, rhs, bufopts)
end

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<leader>e', function() vim.diagnostic.open_float({ border = 'rounded' }) end, 'Show diagnostics of the current line')
map('n', '[e', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end, 'Go to the previous diagnostic')
map('n', ']e', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end, 'Go to the next diagnostic')
if telescope_ok then
    map('n', '<leader>E', telescope.diagnostics, 'Show all diagnostics')
else
    map('n', '<leader>E', function() vim.diagnostic.setloclist() end, 'Show all diagnostics')
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    if telescope_ok then
        bufmap('n', 'gd', telescope.lsp_definitions, bufnr, 'Go to definition')
        bufmap('n', 'gi', telescope.lsp_implementations, bufnr, 'Go to implementation')
        bufmap('n', 'gr', telescope.lsp_references, bufnr, 'Go to references')
        bufmap('n', 'gt', telescope.lsp_type_definitions, bufnr, 'Go to type definition')
    else
        bufmap('n', 'gd', vim.lsp.buf.definition, bufnr, 'Go to definition')
        bufmap('n', 'gi', vim.lsp.buf.implementation, bufnr, 'Go to implementation')
        bufmap('n', 'gr', vim.lsp.buf.references, bufnr, 'Go to references')
        bufmap('n', 'gt', vim.lsp.buf.type_definition, bufnr, 'Go to type definition')
    end

    bufmap('n', 'gD', vim.lsp.buf.declaration, bufnr, 'Go to declaration')
    bufmap('n', 'K', vim.lsp.buf.hover, bufnr, 'Show docstring of the item under the cursor')
    bufmap('i', '<C-k>', vim.lsp.buf.signature_help, bufnr, 'Show signature help')

    bufmap('n', '<leader>rn', vim.lsp.buf.rename, bufnr, 'Rename variable under the cursor')
    bufmap('n', '<leader>ca', vim.lsp.buf.code_action, bufnr, 'Code action')
    bufmap('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, bufnr, 'Format the buffer')

    bufmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufnr, 'Add workspace')
    bufmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufnr, 'Remove workspace')
    bufmap('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufnr, 'List workspaces')

    -- Enable vim-navic
    if navic_ok and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-16' }
lspconfig.clangd.setup({ capabilities = capabilities })


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
