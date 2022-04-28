" Vim filetype plugin
" Language: vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           __     _____ __  __
"                           \ \   / /_ _|  \/  |
"                            \ \ / / | || |\/| |
"                             \ V /  | || |  | |
"                              \_/  |___|_|  |_|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ----------------------------------------------------------------------------
" General configuration
" ----------------------------------------------------------------------------
" Hide statusline fugitive
setl laststatus=0 noshowmode noruler
  \| au BufLeave <buffer> setl laststatus=2 showmode ruler

" Quick push during a commit window
com! Gpush :!clear && echo 'Wait for the local commits to be pushed to GitHub
      \ ...\n--------------------' && git push

