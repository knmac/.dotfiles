let g:Illuminate_ftHighlightGroups = {
      \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
      \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
      \ }

let g:Illuminate_ftblacklist = ['nerdtree']

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord Visual
    "autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
augroup END
