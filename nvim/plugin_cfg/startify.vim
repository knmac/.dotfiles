" Set location to save the sessions
let g:startify_session_dir = '~/.config/nvim/session'

" Update session automatically as you exit vim
let g:startify_session_persistence = 1

" Center the header
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'
