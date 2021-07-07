" List of items
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

" Set location to save the sessions (default: $XDG_DATA_HOME/nvim/session)
"let g:startify_session_dir = '~/.config/nvim/session'

" Update session automatically as you exit vim
let g:startify_session_persistence = 1

" Center the header
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'

" Shorten number of items to show (default 10)
"let g:startify_files_number = 5

" Show icons
if has_key(plugs, 'vim-devicons')
      function! StartifyEntryFormat()
            return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
      endfunction
endif
