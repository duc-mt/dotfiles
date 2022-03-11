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
packloadall          " Load all plugins
silent! helptags ALL " Load help for all plugins

" ============================================================================
" ENVIRONMENT {{{
" ============================================================================
" Identify platform {
    silent fu! OSX()
        retu has('macunix')
    endf
    silent fu! LINUX()
        retu has('unix') && !has('macunix') && !has('win32unix')
    endf
    silent fu! WINDOWS()
        retu  (has('win32') || has('win64'))
    endf
" }
" Basics {
    se nocompatible        " Must be first line
    if !WINDOWS()
        se shell=/bin/sh
    en
" }
" Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if WINDOWS()
      se runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    en
" }
" Arrow Key Fix {
    " https://github.com/spf13/spf13-vim/issues/780
    if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
        inoremap <silent> <C-[>OC <RIGHT>
    en
" }
" }}}
" ============================================================================
" GUI RELATED {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Set font according to system
" ----------------------------------------------------------------------------
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


" ----------------------------------------------------------------------------
" Disable scrollbars (real hackers don't use scrollbars for navigation!)
" ----------------------------------------------------------------------------
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" }}}
" ============================================================================
" GENERAL CONFIGURATION OPTIONS {{{
" ============================================================================

if has('cmdline_info')
  se ru                   " Show the ruler
  se rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  se sc                 " Show partial commands in status line and
                          " Selected characters/lines in visual mode
en

" Faster redrawing
set tf

" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start
set history=1000 " Set bigger history of executed commands.
set smd          " Show current mode at the bottom.
" Automatically re-read files if unmodified inside Vim.
set ar
" Manage multiple buffers effectively: the current buffer can be “sent” to
" the background without writing to disk. When a background buffer become
" current again, marks and undo-history are remembered.
set hid

let mapleader="\<Space>"  " Map the leader key to a spacebar.


" ----------------------------------------------------------------------------
" User Interface Options
" ----------------------------------------------------------------------------
set ls=2      " Always display the status bar.
set noeb      " Disable beep on errors.
set vb        " Flash screen instead of beeping on errors.
set mouse=a   " Enable mouse for scrolling and resizing.
set cul nocuc " Enable cursorline, disable cursorcolumn
set nu rnu    " Enable (relative) number
set sb spr    " Split below / right
" Set the window’s title, reflecting the file currently being edited.
set title
" Maximum number of tab pages that can be opened from the command line.
set tpm=15


" ----------------------------------------------------------------------------
" Wildmenu completion
" ----------------------------------------------------------------------------
set wildmenu                   " Enable auto completion menu after <TAB>
set wildmode=longest,list,full " Make wildmenu behave akin to Bash completion

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


" ----------------------------------------------------------------------------
" Register / Clipboard
" ----------------------------------------------------------------------------
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    se clipboard=unnamed,unnamedplus
  el         " On mac and Windows, use * register for copy-paste
    se clipboard=unnamed
  en
en

" Prevent x and the delete key from overriding what's in the clipboard
nn x "_x
nn X "_x
nn <Del> "_x

" Prevent selecting and pasting from overwriting what you originally copied
xn p pgvy


" ----------------------------------------------------------------------------
" Indentation options
" ----------------------------------------------------------------------------
set ai           " New lines inherit the indentation of previous lines
filet on         " Enable type file detection
filet plugin on  " Enable and load plugin for the detected file type
filet indent on  " Load an indent file for the detected file type
set ts=2         " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2 " Number of spaces when indenting with ‘>’
set et           " Use space characters instead of tabs
set sts=2
set sta
set wrap


" ----------------------------------------------------------------------------
" Search options:
" ----------------------------------------------------------------------------
set incsearch    " Find the next match as we type the search
set nohlsearch   " Highlight searches by default
set smartcase    " . . . unless you type a capital
set showmatch    " Show matching words during a search
set noignorecase " Do not ignore capital letters during search


" ----------------------------------------------------------------------------
" Text rendering options
" ----------------------------------------------------------------------------
set encoding=utf-8  " Use an encoding that supports Unicode
" Wrap lines at convenient points.
" Avoid wrapping a line in the middle of a word
set linebreak
" The number of screen lines to keep above and below the cursor
set scrolloff=3
" The number of screen columns to keep to the left and right of the cursor
set sidescrolloff=5


" ----------------------------------------------------------------------------
" Miscellaneous Options:
" ----------------------------------------------------------------------------
" Display a confirmation dialogue when closing an unsaved file
set confirm
" Ignore files mode lines; use vimrc configurations instead
set nomodeline
" Interpret octal as decimal when incrementing numbers
set nrformats-=octal


" ----------------------------------------------------------------------------
" Set up persistent undo across all files
" ----------------------------------------------------------------------------
try
  set udir=~/.vim/.tmp/.undo/
  set undofile
  set ul=1000        " Maximum number of changes that can be undone
  set ur=10000       " Maximum number lines to save for undo on a buffer reload
catch
endtry

" Create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/.tmp/.undo"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
  cal mkdir(targetdir, "p", 0700)
endif


" ----------------------------------------------------------------------------
" Enable backup dir, but disable swap dir
" ----------------------------------------------------------------------------
set backupdir=~/.vim/.tmp/.backup/ " backups
" Create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/.tmp/.backup"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
  cal mkdir(targetdir, "p", 0700)
endif

set noswapfile

" }}}
" ==============================================================================
" TEMPLATES & CUSTOM VIM FILETYPE SETTINGS {{{
" ==============================================================================

au BufNewFile *.py 0r ~/.vim/.tpl/academic_policy.py
" au BufNewFile *.py 0r ~/.vim/.tpl/eibt_policy.py

" Create a file in ftplugin/filetype.vim for specific settings
au BufRead,BufNewFile,BufReadPost *.text,*.txt se filetype=text
au BufRead,BufNewFile,BufReadPost *.md         se filetype=markdown
au BufRead,BufNewFile,BufReadPost *.jade       se filetype=pug
au BufRead,BufNewFile,BufReadPost *.pug        se filetype=pug
au BufRead,BufNewFile,BufReadPost *.coffee     se filetype=coffee

" }}}
" ==============================================================================
" PLUGINS {{{
" ==============================================================================

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
" au VimEnter * NERDTree     " Enable NERDTree on Vim start-up

" Autoclose NERDTree if it's the only open window left
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") &&
\ b:NERDTree.isTabTree()) | q | endif

" Open NERDTree at the current file or close NERDTree if pressed again
nn <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Have NERDtree show hidden files, but ignore certain files and directories
let NERDTreeShowHidden=1
let NERDTreeIgnore=['__pycache__','\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\~$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeCaseSensitiveSort = 1
let NERDTreeNaturalSort       = 1
let NERDTreeSortHiddenFirst   = 1
let NERDTreeQuitOnOpen        = 1
let NERDTreeWinPos            = "right"
let NERDTreeWinSize           = 20
let NERDTreeMinimalUI         = 1
let NERDTreeDirArrows         = 1
let NERDTreeAutoDeleteBuffer  = 1


" ----------------------------------------------------------------------------
" Tabman
" ----------------------------------------------------------------------------
let g:tabman_width = 20
let g:tabman_side = 'right'

" Show windows created by plugins, help and quickfix
let g:tabman_specials = 1

" Disable line numbering in the TabMan window
let g:tabman_number = 0


" ----------------------------------------------------------------------------
" Supertab
" ----------------------------------------------------------------------------
" Change <tab> navigate the completion menu from bottom to top
let g:SuperTabDefaultCompletionType = "<C-N>"

" Escape the tab for word completion
let g:SuperTabMappingTabLiteral     = "<C-V>"


" ----------------------------------------------------------------------------
" Unimpaired
" ----------------------------------------------------------------------------
" Toggle cursorcolumn
nn yoc :set cursorcolumn!                              <CR>
au FileType * nn [oc :set cursorcolumn                 <CR>
au FileType * nn ]oc :set nocursorcolumn               <CR>

" Toggle spell
nn yoe :set spell! spelllang=en_au                     <CR>
au FileType * nn [oe :set spell spelllang=en_au        <CR>
au FileType * nn ]oe :set nospell                      <CR>

" Toggle cursorline
nn yol :set cursorline!                                <CR>
au FileType * nn [ol :set cursorline                   <CR>
au FileType * nn ]ol :set nocursorline                 <CR>


" ----------------------------------------------------------------------------
" Easymotion
" ----------------------------------------------------------------------------
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


" ----------------------------------------------------------------------------
" Signify
" ----------------------------------------------------------------------------
" Configuration for async update
set updatetime=100

" Enable number column highlighting in addition to using signs by default.
let g:signify_number_highlight = 1


" ----------------------------------------------------------------------------
" Floaterm
" ----------------------------------------------------------------------------
" Configuration
let g:floaterm_gitcommit  = 'floaterm'
let g:floaterm_autoinsert = 1
let g:floaterm_width      = 0.8
let g:floaterm_height     = 0.8
let g:floaterm_wintitle   = 0
let g:floaterm_autoclose  = 1

" Highlight
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line colour to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan


" ----------------------------------------------------------------------------
" Tabular
" ----------------------------------------------------------------------------
if exists(":Tabularize")
  vn :T  :Tabularize /
endif


" ----------------------------------------------------------------------------
" Goyo
" ----------------------------------------------------------------------------
let g:goyo_width = 81

fu! s:goyo_enter()
  if has('gui_running')
    se fullscreen
    se linespace=7
  elsei exists('$TMUX')
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  end
  aug no_rnu
    au!
    au InsertLeave * setl nornu
  aug END
endf

fu! s:goyo_leave()
  if has('gui_running')
    se nofullscreen
    se linespace=0
  elsei exists('$TMUX')
    silent !tmux set status on
  end
  aug toggle_rnu
    au!
    au InsertEnter * setl nornu
    au InsertLeave * setl rnu
  aug END
  " Re-enable Signify.
  SignifyEnableAll
endf

au! User GoyoEnter nested call <SID>goyo_enter()
au! User GoyoLeave nested call <SID>goyo_leave()

" ----------------------------------------------------------------------------
" Commentary
" ----------------------------------------------------------------------------
au FileType gitconfig setl commentstring=#\ %s


" ----------------------------------------------------------------------------
" RainbowParentheses
" ----------------------------------------------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces


" ----------------------------------------------------------------------------
" CtrlP-Funky
" ----------------------------------------------------------------------------
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1


" ----------------------------------------------------------------------------
" CamelCaseMotion
" ----------------------------------------------------------------------------
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Quit Vim
" ----------------------------------------------------------------------------
nn <Leader>q :q<CR>


" ----------------------------------------------------------------------------
" Line operations
" ----------------------------------------------------------------------------
" Add a blank space before the cursor
nn <Space><Space>   a<Space><Left><Esc>
" Add a blank space after the cursor
nn <Bslash><Space>  i<Space><Left><Esc>


" ----------------------------------------------------------------------------
" Press double ,, to escape from Insert mode
" ----------------------------------------------------------------------------
ino ;; <Esc>
vn ;; <Esc>


" ----------------------------------------------------------------------------
" Fix 'Y' and 'vv' behaviours
" ----------------------------------------------------------------------------
nn Y y$
nn vv <C-V>$


" ----------------------------------------------------------------------------
" Keep cursor at the bottom of the visual selection after you yank it
" ----------------------------------------------------------------------------
vm y ygv<Esc>


" ----------------------------------------------------------------------------
" Undo break points
" ----------------------------------------------------------------------------
ino , ,<C-G>u
ino . .<C-G>u
ino [ [<C-G>u
ino ( (<C-G>u
ino { {<C-G>u
ino < <<C-G>u
ino ' '<C-G>u
ino ! !<C-G>u
ino ? ?<C-G>u


" ----------------------------------------------------------------------------
" Move text
" ----------------------------------------------------------------------------
vn J :m '>+1<CR>gv=gv
vn K :m '<-2<CR>gv=gv


" ----------------------------------------------------------------------------
" Move up / down the page
" ----------------------------------------------------------------------------
nn <Leader>j <C-D>
nn <Leader>k <C-U>


" ----------------------------------------------------------------------------
" Visual Shifting (does not exit Visual mode)
" ----------------------------------------------------------------------------
vn < <gv
vn > >gv


" ----------------------------------------------------------------------------
" Record into register 'q' (use 'qq'), playback with 'Q'
" ----------------------------------------------------------------------------
nn Q @q


" ----------------------------------------------------------------------------
" Move between tabs
" ----------------------------------------------------------------------------
nn <silent> <S-H> : tabp<CR>
nn <silent> <S-L> : tabn<CR>


" ----------------------------------------------------------------------------
" Folding shortcuts
" ----------------------------------------------------------------------------
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

hi Folded guibg=Gray8 guifg=Gray ctermbg=235  ctermfg=0


" ----------------------------------------------------------------------------
" Colon shortcuts to access command line mode.
" ----------------------------------------------------------------------------
nn ; :
vn ; :


" ----------------------------------------------------------------------------
" Fast split navigation with <Ctrl> + hjkl
" ----------------------------------------------------------------------------
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


" ----------------------------------------------------------------------------
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
" ----------------------------------------------------------------------------
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


" ----------------------------------------------------------------------------
" Move the current window to the corresponding position.
" ----------------------------------------------------------------------------
nn <C-W>h <C-W>H
nn <C-W>j <C-W>J
nn <C-W>k <C-W>K
nn <C-W>l <C-W>L


" ----------------------------------------------------------------------------
" Map arrow keys nothing so I can get used to hjkl-style movement.
" ----------------------------------------------------------------------------
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" ----------------------------------------------------------------------------
"  Change Working Directory to that of the current file.
" ----------------------------------------------------------------------------
cno cwd lcd %:p:h
cno cd. lcd %:p:h


" ----------------------------------------------------------------------------
" Allow using the repeat operator with a visual selection (!)
" ----------------------------------------------------------------------------
vn . :normal .<CR>

" }}}
" ============================================================================
" HOTKEYS {{{
" ============================================================================

nn  <silent> <Bslash>ek  : sp ~/.vim/hotkeys.txt   <CR>
nn  <silent> <Bslash>eg  : tabe ~/.vim/gitconfig   <CR>
nn  <silent> <Bslash>ev  : tabe $MYVIMRC           <CR>
nn  <silent> <Bslash>sv  : so $MYVIMRC             <CR>
nn  <silent> <Bslash>t   : FloatermToggle          <CR>
tno <silent> <Bslash>t   <C-\><C-n>:FloatermToggle <CR>
nn  <silent> <Bslash>g   : Goyo                    <CR>
nn  <silent> <Bslash>m   : MaximizerToggle         <CR>
vn  <silent> <Bslash>m   : MaximizerToggle         <CR> gv
nn  <silent> <Leader>m   : TMToggle                <CR>
nn  <silent> <F2>        : SignifyFold             <CR>
nn  <silent> <F3>        : SignifyDiff             <CR>
nn  <silent> <F4>        : SignifyList             <CR>
nn  <silent> <F6>        : RainbowParenthesesOn     <CR>

" }}}
" ============================================================================
" ABBREVIATIONS  {{{
" ============================================================================

" ----------------------------------------------------------------------------
" General abbreviations
" ----------------------------------------------------------------------------
ia @@ tan.duc.work@gmail.com
ia unisa University of South Australia
ia SA South Australia
ia ms Microsoft
ia MS Microsoft
ia ytb YouTube


" }}}
" ============================================================================
" FUNCTIONS & COMMANDS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
fu! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    ec 'Not in git repo'
  else
    exe 'lcd' root
    ec 'Changed directory to: '.root
  end
endf
com! Root cal s:root()

" ----------------------------------------------------------------------------
" :AddLineNumber | Add line numbers to each line
" ----------------------------------------------------------------------------
fu! AddLineNumber()
  %s/^/\=printf('%-3d',line('.'))
  %s/\s\+$//e
  ec 'Every Line Has Been Numbered !'
endf
com! LineNumber cal AddLineNumber()

" ----------------------------------------------------------------------------
" :CapitaliseEachWord
" ----------------------------------------------------------------------------
fu! CapitaliseEachWord()
  s/\v<(.)(\w*)/\u\1\L\2/g
  ec 'Every Word Has Been Capitalised !'
endf
com! CapitaliseEachWord cal CapitaliseEachWord()

" ----------------------------------------------------------------------------
" :StripTrailingWhitespace
" ----------------------------------------------------------------------------
fu! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    if &readonly==0 && filereadable(bufname('%'))
      let l:save = winsaveview()
      keepp %s/\s\+$//e
      cal winrestview(l:save)
      ec 'Strip Trailing Whitespace Successfully !'
    end
  end
endf
com! StripTrailingWhitespace cal StripTrailingWhitespace()

" ----------------------------------------------------------------------------
" RainbowParentheses
" ----------------------------------------------------------------------------
fu! RainbowParenthesesOn()
  :RainbowParenthesesToggle       " Toggle it on/off
  :RainbowParenthesesLoadRound    " (), the default when toggling
  :RainbowParenthesesLoadSquare   " []
  :RainbowParenthesesLoadBraces   " {}
  :RainbowParenthesesLoadChevrons " <>
  ec 'RainbowParentheses Has Been Toggled'
endf
com! RainbowParenthesesOn cal RainbowParenthesesOn()

" }}}
" ============================================================================
" VIM SCRIPTS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Spell checking
" ----------------------------------------------------------------------------
" Enable spell checking for gitcommit
au FileType gitcommit setl spell spelllang=en_au

" Highlight spelling mistakes
" Badly spelled word
hi SpellBad    term=reverse   ctermbg=12 gui=undercurl guisp=Red
" Word with wrong caps
hi SpellCap    term=reverse   ctermbg=9  gui=undercurl guisp=Blue
" Rare word
hi SpellRare   term=reverse   ctermbg=13 gui=undercurl guisp=Magenta
" Word only exists in other region
hi SpellLocale term=underline ctermbg=11 gui=undercurl guisp=DarkCyan

" ----------------------------------------------------------------------------
" Ignore CamelCase words when spell checking
" ----------------------------------------------------------------------------
fun! IgnoreSpell()
  sy match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  sy cluster Spell add=CamelCase
  sy match InlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/ contains=@NoSpell transparent
  sy cluster Spell add=InlineURL
endf

au BufRead,BufNewFile * :cal IgnoreSpell()


" ----------------------------------------------------------------------------
" Open pdf files in the default pdf reader
" ----------------------------------------------------------------------------
au BufRead *.pdf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!


" ----------------------------------------------------------------------------
" Disable making changes to file (plugins)
" ----------------------------------------------------------------------------
aug readonly
  au!
  au BufEnter ~/.vim/pack/* setl nomodifiable
  au BufEnter ~/.vim/pack/* setl nocursorline nocursorcolumn
aug END


" ----------------------------------------------------------------------------
" y show the cursor line in the active buffer.
" ----------------------------------------------------------------------------
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END


" ----------------------------------------------------------------------------
" Enable relative numbers in Normal mode; absolute numbers in Insert mode.
" ----------------------------------------------------------------------------
aug toggle_relative_number
  au!
  au InsertEnter * setl nornu
  au InsertLeave * setl rnu
aug END


" ----------------------------------------------------------------------------
" Automatically centre the current line when I enter it in Insert mode.
" ----------------------------------------------------------------------------
au InsertEnter * norm zz


" ----------------------------------------------------------------------------
" Enable the marker method of folding.
" ----------------------------------------------------------------------------
au FileType vim setl foldmethod=marker


" ----------------------------------------------------------------------------
" Make the 81st column stand out (maximum textwidth is 80)
" ----------------------------------------------------------------------------
hi ColorColumn guibg=Gray15 ctermbg=235
cal matchadd('ColorColumn', '\%81v', 100)
" Maximum width of text that is being inserted set to 80.
set tw=80


" ----------------------------------------------------------------------------
" Disable automatic commenting on newline
" ----------------------------------------------------------------------------
au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o


" ----------------------------------------------------------------------------
" Detect trailing whitespace
" ----------------------------------------------------------------------------
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight trailing whitespace
se list


" ----------------------------------------------------------------------------
" Automatically save the file when a change if made
" ----------------------------------------------------------------------------
au TextChanged,InsertLeave * if &readonly==0 && filereadable(bufname('%'))|silent up|end


" ----------------------------------------------------------------------------
" Configuration for colour scheme
" ----------------------------------------------------------------------------
syntax on

if has('termguicolours')
  se termguicolours
end

if &term =~ "xterm\\|rxvt"
  " use a light_cyan cursor in insert mode
  let &t_SI = "\<Esc>]12;LightCyan\x7"
  " use an orange cursor otherwise
  let &t_EI = "\<Esc>]12;LightGreen\x7"
  silent !ec -ne "\033]12;LightGreen\007"
end


" ----------------------------------------------------------------------------
" Configuration gruvbox-material
" ----------------------------------------------------------------------------
aug GruvboxMaterial

  packadd gruvbox-material
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

colo gruvbox-material


" ----------------------------------------------------------------------------
" Change colour scheme depending on the time of day
" ----------------------------------------------------------------------------
let hr=(strftime('%H'))

if hr >= 18
  se background=dark
elsei hr >= 7
  se background=light
elsei hr >= 0
  se background=dark
end


" ----------------------------------------------------------------------------
" Highlight
" ----------------------------------------------------------------------------
hi Search guibg=peru guifg=wheat

" SignColumn should match background
hi clear SignColumn

" Remove highlight color from current line number
hi clear CursorLineNr

" Current line number row will have same background color in relative mode
" hi clear LineNr

" Highlight conflicts
mat ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" ----------------------------------------------------------------------------
" Resize splits when the window is resized
" ----------------------------------------------------------------------------
au VimResized * exe "normal! \<c-w>="


" ----------------------------------------------------------------------------
" Line Return
" Make sure Vim returns to the same line when you reopen a file.
" ----------------------------------------------------------------------------
aug line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ en
aug END

" }}}
" ============================================================================
" STATUS LINE {{{
" ============================================================================

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
end
let g:airline_skip_empty_sections = 1
let g:airline_theme='gruvbox_material'

" Unicode Symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" }}}
" ============================================================================
" GIT {{{
" ============================================================================

" Set filetype
au BufEnter ~/.vim/gitconfig      setl ft=gitconfig
au BufEnter ~/.vim/gitmessage.txt setl ft=gitcommit

" Quick push during a commit window
au FileType fugitive nn <Bslash>p :!clear && echo 'Wait for the local commits to be pushed to GitHub ...\n--------------------' && git push<CR>

" Configuration
au FileType gitconfig setl nocul nocuc
au FileType gitconfig setl fdls=99
au FileType gitcommit setl nornu

" Maximum width of text that is being inserted set to 72.
" The column 73 is highlighted.
au FileType gitcommit cal matchadd('ColorColumn', '\%73v', 100)
setl tw=72

" Quit fugitive
au FileType fugitive nn q :q<CR>

" Instead of reverting the cursor to the last position in the buffer
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" }}}
