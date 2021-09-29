require('lint').linters_by_ft = {
  python = {'pycodestyle',},  -- check PEP8 style: pip install pycodestyle
}

vim.cmd([[ au BufEnter * lua require('lint').try_lint() ]])
vim.cmd([[ au BufWritePost * lua require('lint').try_lint() ]])
