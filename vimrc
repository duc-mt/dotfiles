""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               ,
"             / \,,_  .'|
"          ,{{| /}}}}/_.'            _____________________________________________
"         }}}}` '{{'  '.            /                                             \
"       {{{{{    _   ;, \          /            Ladies and Gentlemen,              \
"    ,}}}}}}    /o`\  ` ;)        |                                                |
"   {{{{{{   /           (        |                 this is ...                    |
"   }}}}}}   |            \       |                                                |
"  {{{{{{{{   \            \      |                                                |
"  }}}}}}}}}   '.__      _  |     |    _____             __             __  _      |
"  {{{{{{{{       /`._  (_\ /     |   / ___/__  ______  / /_____ ______/ /_(_)____ |
"   }}}}}}'      |    //___/   --=:   \__ \/ / / / __ \/ __/ __ `/ ___/ __/ / ___/ |
"jgs `{{{{`       |     '--'       |  ___/ / /_/ / / / / /_/ /_/ (__  ) /_/ / /__   |
"    }}}`                         | /____/\__, /_/ /_/\__/\__,_/____/\__/_/\___/   |
"                                  |      /____/                                    |
"                                  |                                               /
"                                   \_____________________________________________/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load the documentation for all the plugins:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packloadall			        " Load all plugins.
silent! helptags ALL		" Load help for all plugins.


" GENRAL CONFIGURATION OPTIONS ------------------------------------------- {{{

" Use Vim settings, rather then Vi settings. It’s important to have this
" on the top of your file, as it influences other options.
set nocompatible

" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start

set history=1000        	" Set bigger history of executed commands.

set showcmd             	" Show incomplete commands at the bottom.

set showmode            	" Show current mode at the bottom.

" Automatically re-read files if unmodified inside Vim.
set autoread

" Manage multiple buffers effectively: the current buffer can be “sent” to
" the background without writing to disk. When a background buffer become
" current again, marks and undo-history are remembered.
" See chapter Buffers to understand this better.
set hidden

let mapleader = "\<Space>"	" Map the leader key to a spacebar.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2        	" Always display the status bar.

set ruler               	" Always show cursor position.

set wildmenu                " Enable auto completion menu after pressing TAB.

set wildmode=list:longest   " Make wildmenu behave akin to Bash completion.

" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=40

set cursorline          	" Highlight the line currently under cursor.

set noerrorbells        	" Disable beep on errors.

set visualbell          	" Flash the screen instead of beeping on errors.

set mouse=a             	" Enable mouse for scrolling and resizing.

" Set the window’s title, reflecting the file currently being edited.
set title


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=light     	" Use colors that suit a light background.
colorscheme gruvbox      	" Change colorscheme.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => (Relative) Number Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              	" Show line numbers on the sidebar.

" Show line number on the current line and relative numbers on other lines.
" Works only if the option above ( number ) is enabled.
set relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Swap and backup file options - disable all of them:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent         		" New lines inherit the indentation of previous lines.

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

set tabstop=4           	" Show existing tab with 4 spaces width.

set shiftwidth=4        	" When indenting with ‘>’, use 4 spaces width.

set expandtab           	" Use space characters instead of tabs.

set wrap              		" Wrap lines.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           	" Find the next match as we type the search.

set hlsearch            	" Highlight searches by default.

set smartcase           	" . . . unless you type a capital.

set showmatch               " Show matching words during a search.

" set ignorecase            " Ignore capital letters during search.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text rendering options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8      	" Use an encoding that supports Unicode.

set linebreak           	" Wrap lines at convenient points, avoid wrapping a line in the middle of a word.

set scrolloff=3         	" The number of screen lines to keep above and below the cursor.

set sidescrolloff=5     	" The number of screen columns to keep to the left and right of the cursor.

syntax on           	    " Enable syntax highlighting.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set confirm             	" Display a confirmation dialog when closing an unsaved file.

set nomodeline          	" Ignore file’s mode lines; use vimrc configurations instead.

set nrformats-=octal    	" Interpret octal as decimal when incrementing numbers.

set shell               	" The shell used to execute commands.

set spell               	" Enable spellchecking.

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press {Leader n} to access NERDTree plugin.
nnoremap <Leader>n :NERDTreeToggle<Enter>

let NERDTreeShowBookmarks = 1       " Display bookmarks on startup.

" autocmd VimEnter * NERDTree       " Enable NERDTree on Vim startup.

" Autoclose NERDTree if it's the only open window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
\ b:NERDTree.isTabTree()) | q | endif

" Have nerdtree show hidden files, but ignore certain files and directories.
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$', '\.DS_Store$', '\~$$', '\.swp$', 'node_modules$', 'venv$']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced longest match support.
let g:SuperTabLongestEnhanced = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-better-whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable highlighting and stripping whitespace on save by default.
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Display the highlighting for the current line in normal mode:
let g:current_line_whitespace_disabled_soft=1

" Strip all trailing whitespace everytime I save the file for all file types.
let g:strip_whitespace_on_save = 1

" Disable confirmation before whitespace is stripped when I save the file.
let g:strip_whitespace_confirm=0

" Strip white lines at the end of the file when stripping whitespace.
let g:strip_whitelines_at_eof=1

" Ignore lines that contain only whitespace.
let g:better_whitespace_skip_empty_lines=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Bslash>f{char} to move to {char}
map  <Bslash>f <Plug>(easymotion-bd-f)
nmap <Bslash>f <Plug>(easymotion-overwin-f)

" <Bslash><Bslash>f to move to {char}{char}
nmap <Bslash><Bslash>f <Plug>(easymotion-overwin-f2)

" Move to line
map <Bslash>L <Plug>(easymotion-bd-jk)
nmap <Bslash>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Bslash>w <Plug>(easymotion-bd-w)
nmap <Bslash>w <Plug>(easymotion-overwin-w)

" hjkl motions: Line and Column motions
map <Bslash>l <Plug>(easymotion-lineforward)
map <Bslash>j <Plug>(easymotion-j)
map <Bslash>k <Plug>(easymotion-k)
map <Bslash>h <Plug>(easymotion-linebackward)

" Keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ZoomWin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hit once: the current window zooms into a full screen.
" Hit the command again: the previous set of windows is restored.
nnoremap <Leader>zw :ZoomWin<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff maps
map <F3> :Gvdiffsplit<Cr>      " Apply Git diff split vertically.
map <F4> :Gdiffsplit!<Cr>      " Apply Git diff split horizontally.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable all predifined mappings
let g:gitgutter_map_keys = 0

" Update time controls the delay before vim writes its swap file
set updatetime=100

" Jump between hunks (differing lines)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Turn line highlighting on
map <F6> :GitGutterLineHighlightsToggle<Cr>

" Fold all unchanged lines, leaving just the hunks visible.
map <F7> :GitGutterFold<Cr>

" Sign column
set signcolumn=yes
highlight SignColumn guibg=LightGrey ctermbg=LightGrey

" Signs' colours and symbols
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'

" To get a list of counts of added, modified, and removed lines in the current buffer
" function! GitStatus()
"   let [a,m,r] = GitGutterGetHunkSummary()
"   return printf('+%d ~%d -%d', a, m, r)
" endfunction
" set statusline+=%{GitStatus()}

" command GitStatus call GitGutterGetHunkSummary()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SimpylFold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preview docstring in fold text
let g:SimpylFold_docstring_preview = 1

" Fold docstrings
let g:SimpylFold_fold_docstring = 1

" Fold imports
let g:SimpylFold_fold_import = 1

" Fold trailing blank lines
let g:SimpylFold_fold_blank = 1

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save/quit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ww :w<Enter>	" Press {Leader w} instead of {:w Enter}.

nnoremap <Leader>wq :wq<Enter>	" Press {Leader wq} instead of {:wq Enter}.

nnoremap <Leader>qq :q!<Enter>	" Press {Leader q} instead of {:wq Enter}.

inoremap <C-A> <Esc>		    " Press {Ctrl a} instead of {Esc}.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Foldings shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent		" Folding code based on indentation.

nnoremap za zA              " Press {za} to open/close all folding levels.
nnoremap zo zR              " Press {zc} to open every fold.
nnoremap zc zM              " Press {zc} to close every fold.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle search highlighting by hitting <Space><Esc>.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I don't need this because I not have the vim-unimpaired plugin.
" nmap <silent> <leader><Esc> :set hls!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I don't need these because I now have the vim-unimpaired plugin.
" nnoremap o o<esc>
" nnoremap O O<esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press ; to type the : character in command mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Press {Ctrl Z} to open terminal vertically on the right.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-Z> :below vert ter<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast split navigation with <Ctrl> + hjkl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" 2. Terminal mode.
tnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><
" 2. Terminal mode
tnoremap <c-up> <c-w>+
tnoremap <c-down> <c-w>-
tnoremap <c-left> <c-w>>
tnoremap <c-right> <c-w><

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Move the current window to the corresponding position.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <C-W>h <C-W>H
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K
nnoremap <C-W>l <C-W>L
" 2. Terminal mode
tnoremap <C-W>h <C-W>H
tnoremap <C-W>j <C-W>J
tnoremap <C-W>k <C-W>K
tnoremap <C-W>l <C-W>L


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map arrow keys nothing so I can get used to hjkl-style movement.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Press <Space>p to print the current file to the default printer
"    from a Linux operating system.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
" nnoremap <silent> <leader>p :%w !lp<CR>

" }}}


" VIM SCRIPTS ------------------------------------------------------------ {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable relative numbers in Normal mode; absolute numbers in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the marker method of folding.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => If the current file type is HTML, set indentation to 2 spaces.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => If Vim version is equal to or greater than 7.3 enable undofile.
"    This allows you to undo changes to a file even after saving it.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Make the 80th column stand out (PEP 8 Style Guide for Python Code)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ColorColumn ctermbg=Magenta
call matchadd('ColorColumn', '\%80v', 100)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hightlight matches when jumping to next:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> n     n:call HLNext(0.4)<cr>
nnoremap <silent> N     N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

" function! HLNext (blinktime)
"     let [bufnum, lnum, col, off] = getpos('.')
"     let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"     let target_pat = '\c\%#'.@/
"     let blinks = 3
"     for n in range(1,blinks)
"         let red = matchadd('WhiteOnRed', target_pat, 101)
"         redraw
"         exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"         call matchdelete(red)
"         redraw
"         exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"     endfor
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Detect trailing whitespace.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto remove trailing whitespace after saving.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" match ErrorMsg '\s\+$'              " highlight trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toggle background colour for VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :BG in the command mode to do this.
if exists("*ToggleBackground") == 0
	function ToggleBackground()
		if &background == "dark"
			set background=light
		else
			set background=dark
		endif
	endfunction
	command BG call ToggleBackground()
endif

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
