-----------------------------------------------------------
-- Neovim Language Server Protocol
-- neovim/nvim-lspconfig
-- Ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Ref: https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/lsp.lua
-----------------------------------------------------------
local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

-- Popped up window borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = 'single',
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = 'single',
        close_events = {"CursorMoved", "BufHidden", "InsertCharPre"},
    }
)

-- Diagnostic signs
-- neovim <= 0.5.1
vim.fn.sign_define('LspDiagnosticsSignError',       {text=' ', texthl='DiagnosticsSignError'})
vim.fn.sign_define('LspDiagnosticsSignWarning',     {text=' ', texthl='DiagnosticsSignWarn'})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text=' ', texthl='DiagnosticsSignInfo'})
vim.fn.sign_define('LspDiagnosticsSignHint',        {text=' ', texthl='DiagnosticsSignHint'})

-- neovim >= 0.6.0
vim.fn.sign_define('DiagnosticSignError', {text=' ', texthl='DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn',  {text=' ', texthl='DiagnosticSignWarn'})
vim.fn.sign_define('DiagnosticSignInfo',  {text=' ', texthl='DiagnosticSignInfo'})
vim.fn.sign_define('DiagnosticSignHint',  {text=' ', texthl='DiagnosticSignHint'})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    if vim.fn.exists(':Telescope') then
        buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

        buf_set_keymap('n', '<F9>', '<cmd>Telescope lsp_document_diagnostics<CR>', opts)
    else
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

        buf_set_keymap('n', '<F9>', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    end

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

end

-------------------------------------------------------------------------------
-- Set up LSP servers
-------------------------------------------------------------------------------
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local builtin_lsp_servers = { 'pyright', 'bashls', 'clangd', 'ltex' }
-- for _, lsp in ipairs(builtin_lsp_servers) do
--     nvim_lsp[lsp].setup {
--         on_attach = on_attach,
--         flags = {
--             debounce_text_changes = 150,
--         }
--     }
-- end

local builtin_lsp_servers = { 'pyright', 'bashls', 'clangd', 'ltex', 'vimls', 'sumneko_lua' }

-- Server-specific configs
local lsp_setup_opts = {}
lsp_setup_opts['sumneko_lua'] = {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        }
    }
}

-- Attach LSP server
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,

        -- Suggested configuration by nvim-cmp
        capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
        ),
    }

    -- Customize the options passed to the server
    opts = vim.tbl_extend("error", opts, lsp_setup_opts[server.name] or {})

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Automatically install if a required LSP server is missing.
for _, lsp_name in ipairs(builtin_lsp_servers) do
    local ok, lsp = require('nvim-lsp-installer.servers').get_server(lsp_name)
    ---@diagnostic disable-next-line: undefined-field
    if ok and not lsp:is_installed() then
        vim.defer_fn(function()
            -- lsp:install()   -- headless
            lsp_installer.install(lsp_name)   -- with UI (so that users can be notified)
        end, 0)
    end
end
