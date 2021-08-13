--local lsp_complete_configured_servers = function()
--  return table.concat(require'lspconfig'.available_servers(), '\n')
--end

--local lsp_get_active_client_ids = function()
--  local client_ids = {}
--  for idx, client in ipairs(vim.lsp.get_active_clients()) do
--    table.insert(client_ids, tostring(client.id))
--  end
--  return client_ids
--end
require'lspconfig'._root._setup()

-- set up diagnostic signs
vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

-- keymap
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

local opts = { noremap=true, silent=true }
buf_set_keymap('n', 'gd',         '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'gD',         '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gr',         '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', 'gi',         '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', 'K',          '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', '<C-k>',      '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<leader>a',  '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', '<leader>f',  '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
buf_set_keymap('n', '[d',         '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d',         '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)


--nnoremap <silent> gd         <cmd>lua vim.lsp.buf.definition()<CR>
--nnoremap <silent> gD         <cmd>lua vim.lsp.buf.declaration()<CR>
--nnoremap <silent> gr         <cmd>lua vim.lsp.buf.references()<CR>
--nnoremap <silent> gi         <cmd>lua vim.lsp.buf.implementation()<CR>
--nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
--nnoremap <silent> <C-k>      <cmd>lua vim.lsp.buf.signature_help()<CR>
--nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
--nnoremap <silent> <leader>a  <cmd>lua vim.lsp.buf.code_action()<CR>
--nnoremap <silent> <leader>f  <cmd>lua vim.lsp.buf.formatting()<CR>

--nnoremap <silent> <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
--nnoremap <silent> <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
--nnoremap <silent> <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>

--nnoremap <silent> <F9>       <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
--nnoremap <silent> [d         <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
--nnoremap <silent> ]d         <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


--auto-format
--autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
--autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
