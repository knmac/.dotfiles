" Air line
let g:airline_powerline_fonts = 0
"let g:airline_theme = 'bubblegum'
let g:airline_theme = 'onedark'
"let g:airline_theme = 'base16_default'
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.branch     = ''
let g:airline_symbols.readonly   = ''
let g:airline_symbols.paste      = ''
"let g:airline_symbols.linenr     = ''
"let g:airline_symbols.maxlinenr  = 'Ξ'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Show path formatter
let g:airline#extensions#tabline#formatter = 'default'

" Show buffer index
let g:airline#extensions#tabline#buffer_nr_show = 1

" Use 'straight' tabline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '| '

" Remove unnecessary airline extensions to speed up
let g:airline_extensions = ['tabline', 'coc', 'branch', 'hunks']
"let g:airline_extensions = ['tabline', 'coc']
