" LSP config
if exists('g:lspconfig')
  finish
endif
let g:lspconfig = 1

lua << EOF
lsp_complete_configured_servers = function()
  return table.concat(require'lspconfig'.available_servers(), '\n')
end
lsp_get_active_client_ids = function()
  client_ids = {}
  for idx, client in ipairs(vim.lsp.get_active_clients()) do
    table.insert(client_ids, tostring(client.id))
  end
  return client_ids
end
require'lspconfig'._root._setup()
EOF


nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> \rn   <cmd>lua vim.lsp.buf.rename()<CR>


" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
