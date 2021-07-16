" Indentation guide
let g:indentLine_char = '▏'

" Prevent the plugin from changing the conceal level setting automatically
let g:indentLine_setConceal = 0
let g:indentLine_faster = 1


" ----------------------------------------------------------------------------
" DetectIndent
" Auto matically run DetectIndent when open a file
autocmd BufReadPost * :DetectIndent

" To prefer expandtab to noexpandtab when detection is impossible
let g:detectindent_preferred_expandtab = 1
" Specify a preferred indent level when no detection is possible
let g:detectindent_preferred_indent = 4
" To use preferred values instead of guessing
let g:detectindent_preferred_when_mixed = 1
