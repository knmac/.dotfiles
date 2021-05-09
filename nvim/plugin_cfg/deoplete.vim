" needed so deoplete can auto select the first suggestion
"set completeopt+=noinsert

" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview
let g:float_preview#docked = 0

let g:deoplete#enable_at_startup           = 1
let g:deoplete#enable_ignore_case          = 1
let g:context_filetype#same_filetypes      = {}
let g:context_filetype#same_filetypes._    = '_'
call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })

" Close preview window after finishing completion
" (only needed if use `set completeopt+=preview`)
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1
"let g:deoplete#sources#jedi#statement_length = 50

" Deoplete-clang
" Change the paths accordingly
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-10/lib/libclang.so.1"
let g:deoplete#sources#clang#clang_header = "/usr/lib/llvm-10/lib/clang/10.0.0"
