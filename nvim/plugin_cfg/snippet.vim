" ----------------------------------------------------------------------------
" Shortcut for Python breakpoint (ipdb) - on the next line
autocmd FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" Shortcut for Python breakpoint (ipdb) - on the previous line
autocmd FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

" Fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 79 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

nnoremap <leader>- :call FillLine('-')<CR>
nnoremap <leader>= :call FillLine('=')<CR>

" Clear registered macros
function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction
 
command! ClearRegisters call ClearRegisters()

" ----------------------------------------------------------------------------
" Custom snippets
nnoremap ,py    :-1read $HOME/.config/nvim/skeletons/skeleton.py<esc>Gddgg
nnoremap ,html  :-1read $HOME/.config/nvim/skeletons/skeleton.html<esc>Gddgg
nnoremap ,md    :-1read $HOME/.config/nvim/skeletons/skeleton.md<esc>Gddgg
nnoremap ,today :read !date "+\%F"<CR>kJ$
