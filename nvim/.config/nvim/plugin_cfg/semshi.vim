" Use treesitter Highlight instead if available, only use smeshi for node
" Highlighting
if has_key(plugs, 'nvim-treesitter')
    let g:semshi#excluded_hl_groups = ['local', 'unresolved', 'attribute', 'builtin', 'free', 'global', 'parameter', 'parameterUnused', 'self', 'imported']
    let g:semshi#error_sign = v:false
endif
