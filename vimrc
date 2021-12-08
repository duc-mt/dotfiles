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
" => Load the documentation for all the plugins:
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
" See chapter Buffers to understand this better.
set hidden

let mapleader="\<Space>"  " Map the leader key to a spacebar.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2               " Always display the status bar.

set ruler                      " Always show cursor position.

" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=40

set noerrorbells               " Disable beep on errors.

set visualbell                 " Flash screen instead of beeping on errors.

set mouse=a                    " Enable mouse for scrolling and resizing.

" Set the window’s title, reflecting the file currently being edited.
set title


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
" => Clipboard / Registers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow copied vim text to also be added to clipboard
set clipboard=unnamed,unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cursor line / column
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => (Relative) Number Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers on the sidebar.
set number

" Show line number on the current line and relative numbers on other lines.
" Works only if the option above (number) is enabled.
set relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix splitting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation options:
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

set hlsearch     " Highlight searches by default.

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
"    means that you can undo even when you close a buffer/VIM.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/tmp/undo/     " undo files
    set undofile
    set undoreload=10000
catch
endtry

" Create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/tmp/undo"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
    call mkdir(targetdir, "p", 0700)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backup and swap file options - disable all of them:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set backupdir=~/.vim/tmp/backup/ " backups
" " Create undodir directory if possible and does not exist yet
" let targetdir=$HOME . "/.vim/tmp/backup"
" if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
"     call mkdir(targetdir, "p", 0700)
" endif

" set directory=~/.vim/tmp/swap/   " swap files
" " Create undodir directory if possible and does not exist yet
" let targetdir=$HOME . "/.vim/tmp/swap"
" if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
"     call mkdir(targetdir, "p", 0700)
" endif

set nowritebackup    " Only in case you don't want a backup file while editing
set nobackup           " Enable backups
set noswapfile       " It's 2012, Vim.
set makeef=error.err " When using make, where should it dump the file

                            " *backup-table*
" 'backup' 'writebackup'  action
   " off       off    no backup made
   " off       on     backup current file, deleted afterwards (default)
   " on        off    delete old backup, backup current file
   " on        on     delete old backup, backup current file

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press {Leader n} to access NERDTree plugin.
nnoremap <Leader>n  : NERDTreeToggle<Cr>

" Press {Leader rn} to refresh NERDTree plugin.
nnoremap <Leader>rn  : NERDTreeRefreshRoot<Cr>

" Disable cursorline & cursorcolumn on NERDTree.
au Filetype nerdtree setl nocursorline nocursorcolumn

" au VimEnter * NERDTree     " Enable NERDTree on Vim start-up.

" Autoclose NERDTree if it's the only open window left.
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
\ b:NERDTree.isTabTree()) | q | endif

" Open NERDTree at the current file or close NERDTree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<Cr>" : bufexists(expand('%')) ? "\:NERDTreeFind<Cr>" : "\:NERDTree<Cr>"

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
let NERDTreeWinSize           = 35
let NERDTreeMinimalUI         = 1
let NERDTreeDirArrows         = 1
let NERDTreeAutoDeleteBuffer  = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => NERDTree Syntax Highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mitigate lag issues
let g:NERDTreeLimitedSyntax                  = 1
let g:NERDTreeHighlightCursorline            = 0

" Highlight full name (not only icons)
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName    = 1
let g:NERDTreePatternMatchHighlightFullName  = 1

" Highlight folders using exact match
let g:NERDTreeHighlightFolders               = 1 " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName       = 1 " Highlights the folder name

" Customising colours
let s:brown       = "905532"
let s:aqua        = "3AFFDB"
let s:blue        = "689FB6"
let s:darkBlue    = "44788E"
let s:purple      = "834F79"
let s:lightPurple = "834F79"
let s:red         = "AE403F"
let s:beige       = "F5C06F"
let s:yellow      = "F09F17"
let s:orange      = "D4843E"
let s:darkOrange  = "F16529"
let s:pink        = "CB6F6F"
let s:salmon      = "EE6E73"
let s:green       = "8FAA54"
let s:lightGreen  = "31B53E"
let s:white       = "FFFFFF"
let s:rspec_red   = 'FE405F'
let s:git_orange  = 'F54D27'

let g:NERDTreeExtensionHighlightColor                    = {}           " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css']             = s:blue       " sets the colour of css files to blue

let g:NERDTreeExactMatchHighlightColor                   = {}           " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore']     = s:git_orange " sets the colour for .gitignore files

let g:NERDTreePatternMatchHighlightColor                 = {}           " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red  " sets the colour for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor                = s:beige      " sets the colour for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor                  = s:blue       " sets the colour for files that did not match any rule

" Disable Highlight for specific file extension
let g:NERDTreeExtensionHighlightColor        = {} "this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = '' "assigning it to an empty string will skip highlight

" Disable uncommon file extensions highlighting
let g:NERDTreeLimitedSyntax = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType vim nnoremap gcc I"<Space><Esc>0
" au FileType vim vnoremap gc I"<Space><Esc>0

" au FileType vim nnoremap guc 0xx<Esc>
" au FileType vim vnoremap guc 0xx<Esc>

" au FileType python nnoremap gcc I#<Space><Esc>0
" au FileType python vnoremap gc I#<Space><Esc>0


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
nnoremap <Space><Space>   a<Space><Left><Esc>
" Add [count] blank spaces after the cursor
nnoremap <Bslash><Space>  i<Space><Left><Esc>

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

nnoremap yob :BG<Cr>
au FileType * nnoremap [ob :set background=light                  <Cr>
au FileType * nnoremap ]ob :set background=dark                   <Cr>

" Toggle cursorcolumn
nnoremap yoc :set cursorcolumn!                                   <Cr>
au FileType * nnoremap [oc :set cursorcolumn                      <Cr>
au FileType * nnoremap ]oc :set nocursorcolumn                    <Cr>

" Toggle spell
nnoremap yoe :set spell! spelllang=en_au                          <Cr>

au FileType * nnoremap [oe :set spell spelllang=en_au             <Cr>
au FileType * nnoremap ]oe :set nospell spelllang=en_au           <Cr>

" Toggle highlight search
nnoremap yoh :set hlsearch!                                       <Cr>
au FileType * nnoremap [oh :set hlsearch                          <Cr>
au FileType * nnoremap ]oh :set nohlsearch                        <Cr>

" Toggle ignorecase
au FileType * nnoremap [oi :set ignore                            <Cr>
au FileType * nnoremap ]oi :set noignorecase                      <Cr>

" Toggle cursorline
nnoremap yol :set cursorline!<Cr>
au FileType * nnoremap [ol :set cursorline                        <Cr>
au FileType * nnoremap ]ol :set nocursorline                      <Cr>

" Toggle number
nnoremap yon :set number!                                         <Cr>
au FileType * nnoremap [on :set number                            <Cr>
au FileType * nnoremap ]on :set nonumber                          <Cr>

" Toggle relativenumber
nnoremap yor :set relativenumber!                                 <Cr>
au FileType * nnoremap [or :set relativenumber                    <Cr>
au FileType * nnoremap ]or :set norelativenumber                  <Cr>

" Toggle wrap
nnoremap yow :set wrap!                                           <Cr>
au FileType * nnoremap [ow :set wrap                              <Cr>
au FileType * nnoremap ]ow :set nowrap                            <Cr>

" Toggle cursorline
nnoremap yox :set cursorcolumn! cursorline!<Cr>
au FileType * nnoremap [ox :set cursorcolumn cursorline           <Cr>
au FileType * nnoremap ]ox :set no cursorcolumn nocursorline      <Cr>


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
" nnoremap <leader>gd  : Gdiff<Cr>
" nnoremap <leader>gs  : Gstatus<Cr>
" nnoremap <leader>gw  : Gwrite<Cr>
" nnoremap <leader>ga  : Gadd<Cr>
" nnoremap <leader>gb  : Gblame<Cr>
" nnoremap <leader>gco : Gcheckout<Cr>
" nnoremap <leader>gci : Gcommit<Cr>
" nnoremap <leader>gm  : Gmove<Cr>
" nnoremap <leader>gr  : Gremove<Cr>
" nnoremap <leader>gl  : Shell git gl -18<Cr> : wincmd \|<Cr>

" augroup ft_fugitive
"     au!
"     au BufNewFile,BufRead .git/index setl nolist
" augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
" Disable all predefined mappings
let g:gitgutter_map_keys=0

" Update time controls the delay before vim writes its swap file
set updatetime=100

" Jump between hunks (differing lines)
nnoremap ) :GitGutterNextHunk<Cr>
nnoremap ( :GitGutterPrevHunk<Cr>

" Toggle folding all unchanged lines, leaving just the hunks visible.
nnoremap <F2> :GitGutterFold<Cr>
set foldtext=gitgutter#fold#foldtext()

" Toggle highlighting changed lines (hunks)
nnoremap <F3> :GitGutterLineHighlightsToggle<Cr>

" Sign column
" set signcolumn=yes
" highlight SignColumn guibg=yellow ctermbg=yellow

" Signs' colours and symbols

" let g:gitgutter_set_sign_backgrounds=1
" highlight GitGutterAdd    guifg=#009900 ctermfg=Green
" highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
" highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

" Preview the hunk the cursor is in
nnoremap ghp :GitGutterPreviewHunk<Cr>
nnoremap ghq :pclose<Cr>


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

" Mapping
nnoremap   <silent>   \ft    :FloatermNew<CR>
tnoremap   <silent>   \ft    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F6>   :FloatermPrev<CR>
tnoremap   <silent>   <F6>   <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F7>   :FloatermNext<CR>
tnoremap   <silent>   <F7>   <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F8>   :FloatermKill<CR>
tnoremap   <silent>   <F8>   <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <F12>  :FloatermToggle<CR>
tnoremap   <silent>   <F12>  <C-\><C-n>:FloatermToggle<CR>

" Highlight
" Set floaterm window's background to black
highlight Floaterm guibg=black
" Set floating window border line colour to cyan, and background to orange
highlight FloatermBorder guibg=orange guifg=cyan


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap :T  :Tabularize /

" Tabularize used in vimrc's comments.
vnoremap :T" :Tabularize /"<Cr>

" Tabularize used for multiple assignments.
vnoremap :T= :Tabularize /=<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shoot (opt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap gs         :TOhtml
nnoremap <Bslash>gs :TOhtml


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

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcut to open vimrc anywhere
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader><Bslash><Bslash> :tabe ~/.vim/vimrc<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic file system commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Bslash>t :!touch<Space>
nnoremap <Bslash>r :!rm<Space>
nnoremap <Bslash>d :!mkdir<Space>
nnoremap <Bslash>m :!mv<Space>%<Space>
nnoremap <Bslash>c :!cp<Space>%<Space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save/quit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <C-S> :w<Cr>         " Press {Ctrl S} instead of {:w Cr}

" nnoremap <Leader>wq :wq<Cr>   " Press {Leader wq} instead of {:wq Cr}

" Press {Leader q} to quit Vim instead of {:q Cr}
nnoremap <Leader>q :q<Cr>

" Press double ,, to escape from Insert mode
inoremap ,, <Esc>
vnoremap ,, <Esc>

" Quickreturn
" inoremap <c-cr> <esc>A<cr>
" inoremap <s-cr> <esc>A:<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix 'Y' behaviour
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y y$


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix indenting visual block
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap << <gv
" vnoremap >> >gv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Add blank line before and after the current line.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Cr> A<Cr><Esc>
nnoremap <Bslash><Cr> I<Cr><Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Move between tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <S-Left>  : tabp<Cr>
nnoremap <silent> <S-Right> : tabn<Cr>
nnoremap <silent> <S-Down>  : tabc<Cr>
nnoremap <silent> <S-Up>    : tabo<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding code based on indentation.
set foldmethod=indent

" Press {za} to open/close all folding levels.
nnoremap za zA
vnoremap za zA

" Press {zo} to open every fold.
nnoremap zo zR
vnoremap zo zR

" Press {zc} to close every fold.
nnoremap zc zM
vnoremap zc zM

" Start editing with all folds closed
set foldlevelstart=0
set foldlevel=5

" function! MyFoldText()
"     let line = getline(v:foldstart)

"     let nucolwidth = &fdc + &number * &numberwidth
"     let windowwidth = winwidth(0) - nucolwidth - 3
"     let foldedlinecount = v:foldend - v:foldstart

"     " expand tabs into spaces
"     let onetab = strpart('          ', 0, &tabstop)
"     let line = substitute(line, '\t', onetab, 'g')

"     let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
"     let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
"     return line . '$(B!D(B' . repeat(" ",fillcharcount) . foldedlinecount . '$(B!D(B' . ' '
" endfunction
" set foldtext=MyFoldText()

highlight Folded guibg=Gray8 guifg=Gray ctermbg=235  ctermfg=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colon shortcuts to access command line mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :
vnoremap ; :
nnoremap : :!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast split navigation with <Ctrl> + hjkl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" 2. Terminal mode
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
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Press <Space>p to print the current file to the default printer
"    from a Linux operating system.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
" nnoremap <silent> <leader>p :%w !lp<CR>

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
au FileType python ia """ """<Cr><Cr>"""<Esc>kh
au FileType python ia var # Variable initialisation.<Cr>
au FileType python ia validanswers VALID_ANSWERS = ['y', 'yes', 'n', 'no']<Cr>


" Description

" # ----------------------------------------------------------------------------
" # | !/usr/bin/python3
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
au FileType python ia df def :<Cr>"""<Cr><Cr>Parameters<Cr>----------<Cr><Cr><Cr>Returns<Cr>-------<Cr><Cr>"""<Cr><Cr><Esc>14kllli<Del>


" Section headings
au FileType python ia -constant- # ------------------------------- Named Constant ------------------------------<Cr><Esc>h

au FileType python ia -constants- # ------------------------------- Named Constants -----------------------------<Cr><Esc>h

au FileType python ia -import- # ------------------------------- Module Import -------------------------------<Cr><Esc>h

au FileType python ia -imports- # ------------------------------- Module Imports -------------------------------<Cr><Esc>h

au FileType python ia -func- # ---------------------------- Function Definition ----------------------------<Cr><Esc>h

au FileType python ia -funcs- # ---------------------------- Function Definitions ---------------------------<Cr><esc>h

au filetype python ia -program- # ---------------------------------- Program ----------------------------------<Cr><Esc>h

au FileType python ia -m- # ------------------------------- Main Function -------------------------------<Cr>def main():<Cr>

au FileType python ia -main- # --------------------------- Call the Main Function --------------------------<Cr>if __name__ == '__main__':<Cr>main()<Esc>

" }}}


" VIM SCRIPTS ------------------------------------------------------------ {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map the <F5> key to run a Python script inside Vim.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype python nnoremap <F5> :w<CR>:!clear<CR>:!python3 %<CR>


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
augroup readonly
  au!
  au BufEnter ~/.vim/pack/* setl nomodifiable
augroup END

" Disable colourcolumn if the buffer is read only
" function CheckRo()
"     if &readonly
"         set colourcolumn=0
"     endif
" endfunction
" au BufReadPost * call CheckRo()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable relative numbers in Normal mode; absolute numbers in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup toggle_relative_number
  au!
  au InsertEnter * setl norelativenumber
  au InsertLeave * setl relativenumber
augroup END


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
au Filetype html,vim,vimwiki setl tabstop=2 shiftwidth=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Make the 80th column stand out (PEP 8 Style Guide for Python Code)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ColorColumn guibg=Gray15 ctermbg=235
call matchadd('ColorColumn', '\%80v', 100)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight matches when jumping to next:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> n     n:call HLNext(0.4)<Cr>
nnoremap <silent> N     N:call HLNext(0.4)<Cr>

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

" function! HLNext (blinktime)
"     let [bufnum, lnum, col, off]=getpos('.')
"     let matchlen=strlen(matchstr(strpart(getline('.'),col-1),@/))
"     let target_pat='\c\%#'.@/
"     let blinks=3
"     for n in range(1,blinks)
"         let red=matchadd('WhiteOnRed', target_pat, 101)
"         redraw
"         exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"         call matchdelete(red)
"         redraw
"         exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"     endfor
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable automatic commenting on newline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight white space and tab characters.
" => Automatically remove trailing whitespace after saving.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight WhitespaceEOL term=standout ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

call matchadd('WhitespaceEOL', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')

" Highlight trailing whitespace
au BufEnter exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~" | set list | match ErrorMsg '\s\+$'

" Two options to automatically remove trailing whitespace
au InsertLeave,BufWritePre * : %s/\s\+$//e
nnoremap <silent> <C-S>      : %s/\s\+$//e<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colour scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

if has("gui_running")
    colorscheme xoria256
    if (hostname() == 'wollnashorn')
        set guifont=DejaVu\ Sans\ Mono\ 12
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    " highlight Cursor guifg=black guibg=DarkOrange
    " highlight iCursor guifg=black guibg=Green
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait0
    cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'bd' : 'x'
    cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'bd' : 'q'
else
    set t_Co=256
    colorscheme xoria256
    au InsertEnter * highlight  CursorLine ctermbg=52 ctermfg=None
    " Revert colour to default when leaving Insert Mode
    au InsertLeave * highlight  CursorLine ctermbg=237 ctermfg=None
endif

if &term =~ "xterm\\|rxvt"
    " use a light_cyan cursor in insert mode
    let &t_SI = "\<Esc>]12;LightCyan\x7"
    " use an orange cursor otherwise
    let &t_EI = "\<Esc>]12;orange\x7"
    silent !echo -ne "\033]12;orange\007"
    " reset cursor when vim exits
    au VimLeave * silent !echo -ne "\033]12;white\007"
    " use \003]12;gray\007 for gnome-terminal
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gruvbox-material
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! gruvbox-material

" Change theme depending on the time of day
let hr=(strftime('%H'))

if hr >= 24
  set background=dark
  let g:gruvbox_material_background = 'hard'
elseif hr >= 12
  set background=light
  let g:gruvbox_material_background = 'soft'
endif

" Configuration
if has('termguicolours')
  set termguicolours
endif

" Enable italic, but disable for comment
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

" Enable bold in function name
let g:gruvbox_material_enable_bold = 1

" Customize the background colour of |hl-PmenuSel| and |hl-WildMenu|
let g:gruvbox_material_menu_selection_background = 'red'

" Make the background colour of sign column the same as normal text
let g:gruvbox_material_sign_column_background = 'none'

" The contrast of line numbers, indent lines, etc.
let g:gruvbox_material_ui_contrast = 'high'

" Some plugins support highlighting error/warning/info/hint texts, by default
" these texts are only underlined, but you can use this option to also highlight
" the background of them.
let g:gruvbox_material_diagnostic_text_highlight = 1

" Some plugins support highlighting error/warning/info/hint lines, but this
" feature is disabled by default in this color scheme. To enable this feature,
" set this option to `1`.
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

" Set the colorscheme
colorscheme gruvbox-material


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For the GUI
hi Search guibg=peru guifg=wheat

" For terminals
hi Search cterm=NONE ctermfg=grey ctermbg=blue


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
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


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
nnoremap <leader>B :call BlockColor()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ~/.gitconfig file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType gitconfig setl nocursorline nocursorcolumn
au FileType gitconfig setl foldlevelstart=99

" }}}


" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=

" Colour statusline
set statusline+=%#PmenuSel#

" Get a list of counts of added, modified, and removed lines (current buffer)
function! GitStatus()
  let [a,m,r]=GitGutterGetHunkSummary()
  return printf('+%d  ~%d  -%d', a, m, r)
endfunction
set statusline=\\|\ %{GitStatus()}\ \|

" Status line left side.
set statusline+=\ %f\ \|\ %M
set statusline+=\ %Y\ %R\ \|

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\/\%L\ \|\ col:\ %c\ \|\ percent:\ %p%%\ \|

" Show the status on the second to last line.
set laststatus=2

" }}}


" PYTHON ------------------------------------------------------------ {{{
augroup ft_python
    au!

    " au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType python setl define=^\s*\\(def\\\\|class\\)
    " au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <d-'> _(u'')<left><left>

augroup END

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au FileType python map <buffer> F :setl foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

" }}}
