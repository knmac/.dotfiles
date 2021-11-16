" Indentation guide
let g:indentLine_char = '▏'
let g:indentLine_faster = 1

" Set color by color scheme
let g:indentLine_defaultGroup = 'SpecialKey'

" Disable by default
let g:indentLine_enabled = 0


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


" Prevent the plugin from changing the conceal level setting automatically
"let g:indentLine_setConceal = 0
" Toggle conceallevel between 0 and 2
" Useful when your want to copy text and avoid copying indent character
"nnoremap ,c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo "conceallevel =" &cole <CR>
