require('lint').linters_by_ft = {
    python = {'flake8',},
    sh = {'shellcheck',},
}


vim.api.nvim_exec([[
    augroup CheckLinter
    au BufEnter <buffer> lua require('lint').try_lint()
    au BufWritePost <buffer> lua require('lint').try_lint()
    augroup END
    ]], false)
