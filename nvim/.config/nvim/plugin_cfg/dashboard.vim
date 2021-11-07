if has_key(plugs, 'fzf.vim')
    let g:dashboard_default_executive = 'fzf'
elseif has_key(plugs, 'telescope.vim')
    let g:dashboard_default_executive = 'telescope'
elseif has_key(plugs, 'vim-clap')
    let g:dashboard_default_executive = 'clap'
endif

nmap <Space>ss :<C-u>SessionSave<CR>
nmap <Space>sl :<C-u>SessionLoad<CR>

nnoremap <silent> <Space>fb :DashboardJumpMark<CR>
nnoremap <silent> <Space>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Space>ff :DashboardFindFile<CR>
nnoremap <silent> <Space>fh :DashboardFindHistory<CR>
nnoremap <silent> <Space>fa :DashboardFindWord<CR>
nnoremap <silent> <Space>cn :DashboardNewFile<CR>
