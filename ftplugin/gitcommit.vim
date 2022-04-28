" Gitcommit filetype plugin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#               ____ ___ _____ ____ ___  __  __ __  __ ___ _____
#              / ___|_ _|_   _/ ___/ _ \|  \/  |  \/  |_ _|_   _|
#             | |  _ | |  | || |  | | | | |\/| | |\/| || |  | |
#             | |_| || |  | || |__| |_| | |  | | |  | || |  | |
#              \____|___| |_| \____\___/|_|  |_|_|  |_|___| |_|
#
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable spell checking for gitcommit
setl spell spl=en_au

" Maximum width of text that is being inserted set to 72.
" The column 73 is highlighted.
setl tw=72

" Instead of reverting the cursor to the last position in the buffer
" set it to the first line when editing a git commit message
au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

