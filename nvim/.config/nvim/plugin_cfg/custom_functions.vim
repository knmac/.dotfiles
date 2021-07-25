" =============================================================================
" Custom snippets and functions
" =============================================================================

" -----------------------------------------------------------------------------
" Shortcut for Python breakpoint (ipdb)
" On the next line
autocmd FileType python nnoremap <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" On the previous line
autocmd FileType python nnoremap <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>


" -----------------------------------------------------------------------------
" Fill the rest of line with characters
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

" Fill with '-' characters
nnoremap <silent> <leader>- :call FillLine('-')<CR>

" Fill with '=' characters
nnoremap <silent> <leader>= :call FillLine('=')<CR>


" -----------------------------------------------------------------------------
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
" Toogle zoom the current window
function! ToggleZoom(zoom)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
"nnoremap <silent> <leader>+ :call ToggleZoom(v:true)<CR>


" -----------------------------------------------------------------------------
" Custom skeletons
nnoremap <silent> ,py    :-1read $HOME/.config/nvim/skeletons/skeleton.py<esc>Gddgg
nnoremap <silent> ,html  :-1read $HOME/.config/nvim/skeletons/skeleton.html<esc>Gddgg
nnoremap <silent> ,md    :-1read $HOME/.config/nvim/skeletons/skeleton.md<esc>Gddgg
nnoremap <silent> ,today :read !date "+\%F"<CR>kJ$
