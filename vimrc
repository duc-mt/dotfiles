" Author    : Tan Duc Mai <tan.duc.work@gmail.com>

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
" => Load the documentation for all the plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packloadall          " Load all plugins.
silent! helptags ALL " Load help for all plugins.


" GUI RELATED ------------------------------------------------------------ {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set font according to system
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("mac") || has("macunix")
  set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
  set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
  set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
  set gfn=Monospace\ 11
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable scrollbars (real hackers don't use scrollbars for navigation!)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" }}}


" GENERAL CONFIGURATION OPTIONS ------------------------------------------ {{{

" Use Vim settings, rather then Vi settings. It’s important to have this
" on the top of your file, as it influences other options.
set nocompatible

" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start

set history=1000 " Set bigger history of executed commands.

set showcmd      " Show incomplete commands at the bottom.

set showmode     " Show current mode at the bottom.

" Automatically re-read files if unmodified inside Vim.
set autoread

" Manage multiple buffers effectively: the current buffer can be “sent” to
" the background without writing to disk. When a background buffer become
" current again, marks and undo-history are remembered.
set hidden

let mapleader="\<Space>"  " Map the leader key to a spacebar.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Always display the status bar.

set ruler        " Always show cursor position.

set noerrorbells " Disable beep on errors.

set visualbell   " Flash screen instead of beeping on errors.

set mouse=a      " Enable mouse for scrolling and resizing.

set cul nocuc    " Enable cursorline, disbale cursorcolumn

set nu rnu       " Enable (relative) number

set sb spr       " Split below / right

" Set the window’s title, reflecting the file currently being edited.
set title

" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=40


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wildmenu completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                   " Enable auto completion menu after <TAB>.
set wildmode=longest,list,full " Make wildmenu behave akin to Bash completion.

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc,*.log,*.idx    " LaTeX intermediate files
set wildignore+=*_aux,*.glg,*.glo,*.gls,*.ist    " LaTeX intermediate files
set wildignore+=*.nlo,*.nls,*.pdf,*.bbl,*.dvi    " still LaTeX intermediate files
set wildignore+=*.ilg,*.fdb_latexmk,*.synctex.gz " $(B!D(B LaTeX intermediate files
set wildignore+=*.blg,*.ind                      " $(B!D!D!D(B LaTeX intermediate files
set wildignore+=*.hi                             " Haskell linker files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" Better Completion
set completeopt=longest,menuone,preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Allow copied vim text to also be added to clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed,unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent     " New lines inherit the indentation of previous lines.

filetype on        " Enable type file detection.

filetype plugin on " Enable and load plugin for the detected file type.

filetype indent on " Load an indent file for the detected file type.

set tabstop=4      " Show existing tab with 4 spaces width.

set shiftwidth=4   " When indenting with ‘>’, use 4 spaces width.

set expandtab      " Use space characters instead of tabs.

set wrap           " Wrap lines.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch    " Find the next match as we type the search.

set nohlsearch   " Highlight searches by default.

set smartcase    " . . . unless you type a capital.

set showmatch    " Show matching words during a search.

set noignorecase " Do not ignore capital letters during search.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text rendering options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8  " Use an encoding that supports Unicode.

" Wrap lines at convenient points.
" Avoid wrapping a line in the middle of a word.
set linebreak

" The number of screen lines to keep above and below the cursor.
set scrolloff=3

" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display a confirmation dialogue when closing an unsaved file.
set confirm

" Ignore files mode lines; use vimrc configurations instead.
set nomodeline

set nrformats-=octal " Interpret octal as decimal when incrementing numbers.

" set shell            " The shell used to execute commands.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set up persistent undo across all files.
"    means that you can undo even when you close a buffer/VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim/.tmp/.undo/     " undo files
  set undofile
  set undoreload=10000
catch
endtry

" Create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/.tmp/.undo"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
  call mkdir(targetdir, "p", 0700)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable backup dir, but disable swap dir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/.tmp/.backup/ " backups
" Create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/.tmp/.backup"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
  call mkdir(targetdir, "p", 0700)
endif

set noswapfile

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable cursorline & cursorcolumn on NERDTree.
au FileType nerdtree setl nocursorcolumn

" au VimEnter * NERDTree     " Enable NERDTree on Vim start-up.
" Change how files are opened

" Autoclose NERDTree if it's the only open window left.
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") &&
\ b:NERDTree.isTabTree()) | q | endif

" Open NERDTree at the current file or close NERDTree if pressed again.
nn <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Have NERDtree show hidden files, but ignore certain files and directories.
let NERDTreeShowHidden=1
let NERDTreeIgnore=['__pycache__','\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\~$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeCaseSensitiveSort = 1
let NERDTreeNaturalSort       = 1
let NERDTreeSortHiddenFirst   = 1
let NERDTreeChDirMode         = 3
let NERDTreeRespectWildIgnore = 1
let NERDTreeQuitOnOpen        = 1
let NERDTreeWinPos            = "right"
let NERDTreeWinSize           = 30
let NERDTreeMinimalUI         = 1
let NERDTreeDirArrows         = 1
let NERDTreeAutoDeleteBuffer  = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change <tab> navigate the completion menu from bottom to top
let g:SuperTabDefaultCompletionType = "<C-N>"

" Escape the tab for word completion
let g:SuperTabMappingTabLiteral     = "<C-V>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-unimpaired
"    I mapped it myself
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line operations
" Add [count] blank spaces before the cursor
nn <Space><Space>   a<Space><Left><Esc>
" Add [count] blank spaces after the cursor
nn <Bslash><Space>  i<Space><Left><Esc>

" Toggle background colour
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

nn yob :BG<CR>
au FileType * nn [ob :set background=light                  <CR>
au FileType * nn ]ob :set background=dark                   <CR>

" Toggle cursorcolumn
nn yoc :set cursorcolumn!                                   <CR>
au FileType * nn [oc :set cursorcolumn                      <CR>
au FileType * nn ]oc :set nocursorcolumn                    <CR>

" Toggle spell
nn yoe :set spell! spelllang=en_au                          <CR>

au FileType * nn [oe :set spell spelllang=en_au             <CR>
au FileType * nn ]oe :set nospell spelllang=en_au           <CR>

" Toggle highlight search
nn yoh :set hlsearch!                                       <CR>
au FileType * nn [oh :set hlsearch                          <CR>
au FileType * nn ]oh :set nohlsearch                        <CR>

" Toggle ignorecase
au FileType * nn [oi :set ignore                            <CR>
au FileType * nn ]oi :set noignorecase                      <CR>

" Toggle cursorline
nn yol :set cursorline!<CR>
au FileType * nn [ol :set cursorline                        <CR>
au FileType * nn ]ol :set nocursorline                      <CR>

" Toggle number
nn yon :set number!                                         <CR>
au FileType * nn [on :set number                            <CR>
au FileType * nn ]on :set nonumber                          <CR>

" Toggle relativenumber
nn yor :set relativenumber!                                 <CR>
au FileType * nn [or :set relativenumber                    <CR>
au FileType * nn ]or :set norelativenumber                  <CR>

" Toggle wrap
nn yow :set wrap!                                           <CR>
au FileType * nn [ow :set wrap                              <CR>
au FileType * nn ]ow :set nowrap                            <CR>

" Toggle cursorline
nn yox :set cursorcolumn! cursorline!<CR>
au FileType * nn [ox :set cursorcolumn cursorline           <CR>
au FileType * nn ]ox :set no cursorcolumn nocursorline      <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Easymotion_do_mapping = 0

" <Bslash>f{char} to move to {char}
map  <Bslash>f <Plug>(easymotion-bd-f)
nmap <Bslash>f <Plug>(easymotion-overwin-f)

" <Bslash><Bslash>f to move to {char}{char}
nmap <Bslash>F <Plug>(easymotion-overwin-f2)

" Move to line
map  <Bslash>L <Plug>(easymotion-bd-jk)
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
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nn <leader>gd  : Gdiff<CR>
" nn <leader>gs  : Gstatus<CR>
" nn <leader>gw  : Gwrite<CR>
" nn <leader>ga  : Gadd<CR>
" nn <leader>gb  : Gblame<CR>
" nn <leader>gco : Gcheckout<CR>
" nn <leader>gci : Gcommit<CR>
" nn <leader>gm  : Gmove<CR>
" nn <leader>gr  : Gremove<CR>
" nn <leader>gl  : Shell git gl -18<CR> : wincmd \|<CR>

" aug ft_fugitive
"     au!
"     au BufNewFile,BufRead .git/index setl nolist
" aug END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
" Disable all predefined mappings
let g:gitgutter_map_keys=0

" Update time controls the delay before vim writes its swap file
set updatetime=100

" Jump between hunks (differing lines)
nn ) :GitGutterNextHunk<CR>
nn ( :GitGutterPrevHunk<CR>

" Toggle folding all unchanged lines, leaving just the hunks visible.
nn <silent> <F2> :GitGutterFold<CR>
set foldtext=gitgutter#fold#foldtext()

" Toggle highlighting changed lines (hunks)
nn <F3> :GitGutterLineHighlightsToggle<CR>

" Preview the hunk the cursor is in
nn ghp :GitGutterPreviewHunk<CR>
nn ghq :pclose<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Floaterm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
let g:floaterm_gitcommit  = 'floaterm'
let g:floaterm_autoinsert = 1
let g:floaterm_width      = 0.8
let g:floaterm_height     = 0.8
let g:floaterm_wintitle   = 0
let g:floaterm_autoclose  = 1

" Highlight
" Set floaterm window's background to black
highlight Floaterm guibg=black
" Set floating window border line colour to cyan, and background to orange
highlight FloatermBorder guibg=orange guifg=cyan


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vn :T  :Tabularize /

" Tabularize used in vimrc's comments.
vn :T" :Tabularize /"<CR>

" Tabularize used for multiple assignments.
vn :T= :Tabularize /=<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelunker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable URI checking
let g:spelunker_disable_uri_checking                          = 1

" Disable email-like words checking
let g:spelunker_disable_email_checking                        = 1

" Disable account name checking, e.g. @foobar, foobar@
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking                 = 1

" Disable acronym checking
let g:spelunker_disable_acronym_checking                      = 1

" Disable checking words in backtick/backquote
let g:spelunker_disable_backquoted_checking                   = 1

" Disable default autogroup
let g:spelunker_disable_auto_group                            = 1

" Override highlight setting
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType * nn <Bslash>gy :Goyo<CR>
let g:goyo_width  = 82

" Scripts to configure Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif

  aug no_number_relativenumber
    au!
    au InsertLeave * setl nonumber norelativenumber
  aug END

  set nocursorline
  set nocursorcolumn
  " ...
endfunction

" Call the GoyoEnter event's function
au! User GoyoEnter nested call <SID>goyo_enter()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quit fugitive
au FileType fugitive nn q :q<CR>

" Quickly do a git push
au FileType fugitive nn <Space>p :!clear<CR>:!:!git push<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType gitconfig setl commentstring=#\ %s

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic file system commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn <Bslash>m :!mv<Space>%<Space>
nn <Bslash>c :!cp<Space>%<Space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save/quit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press double ,, to escape from Insert mode
ino ;; <Esc>
vn ;; <Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix 'Y' and 'V' behaviours
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn Y y$
nn vv <C-V>$


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo break points
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ino , ,<C-G>u
ino . .<C-G>u
ino [ [<C-G>u
ino ( (<C-G>u
ino { {<C-G>u
ino < <<C-G>u
ino ' '<C-G>u
ino ! !<C-G>u
ino ? ?<C-G>u


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vn J :m '>+1<CR>gv=gv
vn K :m '<-2<CR>gv=gv
nn <Leader>j :m .+1<CR>==
nn <Leader>k :m .-2<CR>==


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Capitalise Each Word In The Current Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn <Leader>C :s/\v<(.)(\w*)/\u\1\L\2/g<CR>
vn <Leader>C :s/\v<(.)(\w*)/\u\1\L\2/g<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix indenting visual block
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vn < <gv
vn > >gv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Add a blank line before and after the current line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn <CR> A<CR><Esc>
nn <Bslash><CR> I<CR><Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Move between tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn <silent> <S-Left>  : tabp<CR>
nn <silent> <S-Right> : tabn<CR>
nn <silent> <S-Down>  : tabc<CR>
nn <silent> <S-Up>    : tabo<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding code based on indentation.
set foldmethod=indent

" Press {za} to open/close all folding levels.
nn za zA
vn za zA

" Press {zo} to open every fold.
nn zo zR
vn zo zR

" Press {zc} to close every fold.
nn zc zM
vn zc zM

" Start editing with all folds closed
set foldlevelstart=0

highlight Folded guibg=Gray8 guifg=Gray ctermbg=235  ctermfg=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colon shortcuts to access command line mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn ; :
vn ; :


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast split navigation with <Ctrl> + hjkl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nn <C-H> <C-W><C-H>
nn <C-J> <C-W><C-J>
nn <C-K> <C-W><C-K>
nn <C-L> <C-W><C-L>
" 2. Terminal mode
tno <C-H> <C-W><C-H>
tno <C-J> <C-W><C-J>
tno <C-K> <C-W><C-K>
tno <C-L> <C-W><C-L>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nn <C-up> <C-w>+
nn <C-down> <C-w>-
nn <C-left> <C-w>>
nn <C-right> <C-w><
" 2. Terminal mode
tno <C-up> <C-w>+
tno <C-down> <C-w>-
tno <C-left> <C-w>>
tno <C-right> <C-w><


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Move the current window to the corresponding position.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nn <C-W>h <C-W>H
nn <C-W>j <C-W>J
nn <C-W>k <C-W>K
nn <C-W>l <C-W>L


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map arrow keys nothing so I can get used to hjkl-style movement.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" }}}


" HOTKEYS --------------------------------------------------------------- {{{
nn  <silent> <Bslash>hk  : vs ~/.vim/.hotkeys.txt <CR>
nn  <silent> <Bslash>gc  : vs ~/.vim/gitconfig    <CR>
nn  <silent> <Bslash>vrc : tabe ~/.vim/vimrc      <CR>
nn  <silent> <Leader>s   : so ~/.vim/vimrc        <CR>
nn  <silent> <Leader>w   : MaximizerToggle        <CR>
nn  <silent> <Leader>f   : FZF                    <CR>
nn  <silent> <Bslash>]   : bnext                  <CR>
nn  <silent> <Bslash>[   : bprevious              <CR>

" Floaterm
nn  <silent> <Leader>t   : FloatermNew            <CR>
nn  <silent> <F6>        : FloatermPrev           <CR>
nn  <silent> <F7>        : FloatermNext           <CR>
nn  <silent> <F8>        : FloatermKill           <CR>
nn  <silent> <F12>       : FloatermToggle         <CR>
tno <silent> <Leader>t   : FloatermNew            <CR>
tno <silent> <F6>        : FloatermPrev           <CR>
tno <silent> <F7>        : FloatermNext           <CR>
tno <silent> <F8>        : FloatermKill           <CR>
tno <silent> <F12>       : FloatermToggle         <CR>

" }}}


" ABBREVIATIONS --------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ia @@ tan.duc.work@gmail.com
ia unisa University of South Australia
ia UniSA University of South Australia
ia SA South Australia
ia ms Microsoft
ia MS Microsoft
ia ytb YouTube


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General, common key bindings
au FileType python ia cc #
au FileType python ia tr True
au FileType python ia fa False
au FileType python ia """ """<CR><CR>"""<Esc>kh
au FileType python ia var # Variable initialisation.<CR>
au FileType python ia validanswers VALID_ANSWERS = ['y', 'yes', 'n', 'no']<CR>


" Description

" # !/usr/bin/python3

" # ----------------------------------------------------------------------------
" # |
" # | File:         file_name.py
" # | Author:       Tan Duc Mai
" # | Email:        tan.duc.work@gmail.com
" # | Date:         03-Dec-2021
" # | Description:
" # |   I hereby declare that I completed this work without any improper help
" # |   from a third party and without using any aids other than those cited.
" # |
" # ----------------------------------------------------------------------------

" # ----------------------------------------------------------------------------
" # |
" # | File:         file_name.py
" # | Author:       Tan Duc Mai
" # | Student ID:   517925
" # | Description:
" # |   This is my own work as defined by the Eynesbury's
" # |   Academic Misconduct Policy.
" # |
" # ----------------------------------------------------------------------------


" Function docstring
au FileType python ia df def :<CR>"""<CR><CR>Parameters<CR>----------<CR><CR><CR>Returns<CR>-------<CR><CR>"""<CR><CR><Esc>12kllli<Del>


" Section headings
au FileType python ia -constant- # ------------------------------- Named Constant ------------------------------<CR><Esc>h

au FileType python ia -constants- # ------------------------------- Named Constants -----------------------------<CR><Esc>h

au FileType python ia -import- # ------------------------------- Module Import -------------------------------<CR><Esc>h

au FileType python ia -imports- # ------------------------------- Module Imports -------------------------------<CR><Esc>h

au FileType python ia -func- # ---------------------------- Function Definition ----------------------------<CR><Esc>h

au FileType python ia -funcs- # ---------------------------- Function Definitions ---------------------------<CR><esc>h

au FileType python ia -program- # ---------------------------------- Program ----------------------------------<CR><Esc>h

au FileType python ia -m- # ------------------------------- Main Function -------------------------------<CR>def main():<CR>

au FileType python ia -main- # --------------------------- Call the Main Function --------------------------<CR>if __name__ == '__main__':<CR>main()<Esc>

" }}}


" VIM SCRIPTS ------------------------------------------------------------ {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable spell checking for gitcommit
au FileType gitcommit setl spell spelllang=en_au

" Highlight spelling mistakes
" Badly spelled word
highlight SpellBad    term=reverse   ctermbg=12 gui=undercurl guisp=Red
" Word with wrong caps
highlight SpellCap    term=reverse   ctermbg=9  gui=undercurl guisp=Blue
" Rare word
highlight SpellRare   term=reverse   ctermbg=13 gui=undercurl guisp=Magenta
" Word only exists in other region
highlight SpellLocale term=underline ctermbg=11 gui=undercurl guisp=DarkCyan

" Ignore CamelCase words when spell checking
fun! IgnoreSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
  syntax match InlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/ contains=@NoSpell transparent
  syn cluster Spell add=InlineURL
endfun

au BufRead,BufNewFile * :call IgnoreSpell()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable making changes to file (plugins)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
aug readonly
  au!
  au BufEnter ~/.vim/pack/* setl nomodifiable
  au BufEnter ~/.vim/pack/* setl nocursorline nocursorcolumn
aug END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable relative numbers in Normal mode; absolute numbers in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
aug toggle_relative_number
  au!
  au InsertEnter * setl norelativenumber
  au InsertLeave * setl relativenumber
aug END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically centre the current line when I enter it in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au InsertEnter * norm zz


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the marker method of folding.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType vim setl foldmethod=marker


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => If the current file type is HTML, set indentation to 2 spaces.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType html,vim,vimwiki setl tabstop=2 shiftwidth=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Make the 80th column stand out (PEP 8 Style Guide for Python Code)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ColorColumn guibg=Gray15 ctermbg=235
call matchadd('ColorColumn', '\%80v', 100)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight matches when jumping to next:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nn <silent> n     n:call HLNext(0.4)<CR>
nn <silent> N     N:call HLNext(0.4)<CR>

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

" function! HLNext (blinktime)
  " let [bufnum, lnum, col, off]=getpos('.')
  " let matchlen=strlen(matchstr(strpart(getline('.'),col-1),@/))
  " let target_pat='\c\%#'.@/
  " let blinks=3
  " for n in range(1,blinks)
  "   let red=matchadd('WhiteOnRed', target_pat, 101)
  "   redraw
  "   exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
  "   call matchdelete(red)
  "   redraw
  "   exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
  " endfor
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable automatic commenting on newline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Detect trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto remove trailing whitespace on save (:w)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
match ErrorMsg '\s\+$'              " Highlight trailing whitespace.
" au BufWritePre * :%s/\s\+$//e  " Auto remove trailing whitespaces.

" Source: https://vimways.org/2018/from-vimrc-to-vim/
function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

nn <Leader>x :<C-U>call StripTrailingWhitespace()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configuration for colour scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

if has('termguicolours')
  set termguicolours
endif

if &term =~ "xterm\\|rxvt"
  " use a light_cyan cursor in insert mode
  let &t_SI = "\<Esc>]12;LightCyan\x7"
  " use an orange cursor otherwise
  let &t_EI = "\<Esc>]12;LightGreen\x7"
  silent !echo -ne "\033]12;LightGreen\007"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config gruvbox-material
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
aug GruvboxMaterial

  packadd! gruvbox-material
  let g:gruvbox_material_background = 'hard'
  " Enable italic, but disable for comment
  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_disable_italic_comment = 1
  " Enable bold in function name
  let g:gruvbox_material_enable_bold = 1
  " Control the |hl-Visual| and the |hl-VisualNOS| highlight group.
  let g:gruvbox_material_visual = 'reverse'
  " Customise the background colour of |hl-PmenuSel| and |hl-WildMenu|
  let g:gruvbox_material_menu_selection_background = 'red'
  " Make the background colour of sign column the same as normal text
  let g:gruvbox_material_sign_column_background = 'none'
  " The contrast of line numbers, indent lines, etc.
  let g:gruvbox_material_ui_contrast = 'high'
  " Some plugins support highlighting error/warning/info/hint texts, by default
  " these texts are only underlined, but you can use this option to also
  " highlight the background of them.
  let g:gruvbox_material_diagnostic_text_highlight = 1
  " Some plugins support highlighting error/warning/info/hint lines, but this
  " feature is disabled by default in this color scheme.
  let g:gruvbox_material_diagnostic_line_highlight = 1
  " Some plugins can use virtual text feature of neovim to display
  " error/warning/info/hint information, you can use this option to adjust the
  " colours of it.
  let g:gruvbox_material_diagnostic_virtual_text = 'colored'
  " Some plugins can highlight the word under current cursor, you can use this
  " option to control their behaviour.
  let g:gruvbox_material_current_word = 'bold'
  " Determine the style of statusline
  let g:gruvbox_material_statusline_style = 'original'
  " Enable this option will reduce loading time by approximately 50%
  let g:gruvbox_material_better_performance = 1

aug END

colorscheme gruvbox-material


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Change colour scheme depending on the time of day
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let hr=(strftime('%H'))

if hr >= 19
  set background=dark
elseif hr >= 13
  set background=light
elseif hr >= 7
  set background=light
elseif hr >= 1
  set background=dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Specific colorscheme for some files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" aug ft_text
"   au!
"   au FileType html,vim,vimwiki,text,markdown colorscheme PaperColor

"   if hr >= 19
"     au FileType html,vim,vimwiki,text,markdown setl background=dark

"   elseif hr >= 13
"     au FileType html,vim,vimwiki,text,markdown setl background=light

"   elseif hr >= 7
"     au FileType html,vim,vimwiki,text,markdown setl background=light

"   elseif hr >= 1
"     au FileType html,vim,vimwiki,text,markdown setl background=dark

"   endif
" aug END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Search guibg=peru guifg=wheat


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoSave everytime a change is made.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au TextChanged * if &readonly==0 && filereadable(bufname('%'))|silent up|endif
" au TextChanged * :w


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Resize splits when the window is resized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimResized * exe "normal! \<c-w>="


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line Return
"    Make sure Vim returns to the same line when you reopen a file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
aug line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
aug END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Block Colours
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:blockcolour_state = 0
function! BlockColor() " {{{
  if g:blockcolour_state
    let g:blockcolour_state = 0
    call matchdelete(77880)
    call matchdelete(77881)
    call matchdelete(77882)
    call matchdelete(77883)
  else
    let g:blockcolour_state = 1
    call matchadd("BlockColor1", '^ \{4}.*', 1, 77880)
    call matchadd("BlockColor2", '^ \{8}.*', 2, 77881)
    call matchadd("BlockColor3", '^ \{12}.*', 3, 77882)
    call matchadd("BlockColor4", '^ \{16}.*', 4, 77883)
  endif
endfunction " }}}
nn <leader>B :call BlockColor()<CR>

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Always show the status line on the last window.
set laststatus=2

" Clear status line when vimrc is reloaded.
set stl=
set stl+=%2*

" Current mode
set stl=\\|\ %{GitStatus()}\ \|

" Status line left side
set stl+=\ \ %f
" Leave this line until finding out how to check if a dir is a git repo
" set stl+=\ %{b:gitbranch}
set stl+=\ \|\ %M\ %Y\ %R\ \|

" Use a divider to separate the left side from the right side.
set stl+=%=

" Status line right side.
set stl+=\ row:\ %l\/\%L\ \|\ col:\ %c\ \|\ percent:\ %p%%\ \|


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get a list of counts of added, modified, and removed lines (current buffer)
function! GitStatus()
  let [a,m,r]=GitGutterGetHunkSummary()
  return printf('+%d  ~%d  -%d', a, m, r)
endfunction

" Show Mode
" function! StatuslineMode()
"   let l:mode=mode()
"   if l:mode==#"n"
"     return "NORMAL"
"   elseif l:mode==?"v"
"     return "VISUAL"
"   elseif l:mode==#"i"
"     return "INSERT"
"   elseif l:mode==#"R"
"     return "REPLACE"
"   elseif l:mode==?"s"
"     return "SELECT"
"   elseif l:mode==#"t"
"     return "TERMINAL"
"   elseif l:mode==#"c"
"     return "COMMAND"
"   elseif l:mode==#"!"
"     return "SHELL"
"   endif
" endfunction

" Show Git Branch
function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

aug GetGitBranch
  au!
  au VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
aug END

" }}}


" PYTHON ------------------------------------------------------------ {{{

aug ft_python

  au!

  " Map the <F5> key to run a Python script inside Vim.
  au Filetype python nn <F5> :w<CR>:!clear && python3 %<CR>

  " au FileType python setl omnifunc=pythoncomplete#Complete
  au FileType python setl define=^\s*\\(def\\\\|class\\)
  " au FileType python compiler nose
  au FileType man nn <buffer> <CR> :q<CR>

  " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
  " override this in a normal way, could you?
  au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

  " Jesus, Python.  Five characters of punctuation for a damn string?
  au FileType python ino <buffer> <d-'> _(u'')<left><left>

  let python_highlight_all = 1
  au FileType python syn keyword pythonDecorator True None False self

  au FileType python map <buffer> F :setl foldmethod=indent<CR>

  au FileType python ino <buffer> $r return
  au FileType python ino <buffer> $i import
  au FileType python ino <buffer> $p print
  au FileType python map <buffer> <leader>1 /class
  au FileType python map <buffer> <leader>2 /def
  au FileType python map <buffer> <leader>C ?class
  au FileType python map <buffer> <leader>D ?def

aug END

" }}}


" GITHUB ------------------------------------------------------------ {{{

" Set filetype
au BufEnter ~/.vim/.gitmessage.txt setl ft=gitcommit
au BufEnter ~/.vim/.gitignore      setl ft=gitconfig
au BufEnter ~/.vim/gitconfig       setl ft=gitconfig

" Quick push during a commit window
au FileType fugitive nn <Leader>p :!clear && echo 'Start pushing local commits towards GitHub' && git push<CR>

" Configuration
au FileType gitconfig setl nocursorline nocursorcolumn
au FileType gitconfig setl foldlevelstart=99
au FileType gitcommit setl nornu
