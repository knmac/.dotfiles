" open nerdtree with the current file selected
nnoremap ,t :NERDTreeFind<CR>

" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '__pycache__']

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()
