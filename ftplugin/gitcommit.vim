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
" Enable spell checking for gitcommit
setl spell spl=en_au

" Maximum width of text that is being inserted set to 72.
" The column 73 is highlighted.
setl tw=72

" Instead of reverting the cursor to the last position in the buffer
" set it to the first line when editing a git commit message
au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

