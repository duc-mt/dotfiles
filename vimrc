" From Mastering VIM Quickly (Chapter 7 - Personalizing VIM)


" Load the documentation for all the plugins:

packloadall			" Load all plugins.
silent! helptags ALL		" Load help for all plugins.


" General configuration options:

set nocompatible 		" Use Vim settings, rather then Vi settings. It’s important to have this on the top of your file, as it influences other options.

set backspace=indent,eol,start 	" Allow backspacing over indention, line breaks and insertion start.

set history=1000        	" Set bigger history of executed commands.

set showcmd             	" Show incomplete commands at the bottom.

set showmode            	" Show current mode at the bottom.

set autoread            	" Automatically re-read files if unmodified inside Vim.

set hidden              	" Manage multiple buffers effectively: the current buffer can be “sent” to the background without writing to disk. When a background buffer become current again, marks and undo-history are remembered. See chapter Buffers to understand this better.

let mapleader = "\<Space>"	" Map the leader key to a spacebar.


" Mapping / Shortcuts

nnoremap <Leader>ww :w<Enter>	" Press {Leader w} instead of {:w Enter} to save file - Normal mode.

nnoremap <Leader>wq :wq<Enter>	" Press {Leader wq} instead of {:wq Enter} to save and exit file - Normal mode.

nnoremap <Leader>qq :q!<Enter>	" Press {Leader q} instead of {:wq Enter} to save and exit file - Normal mode.

inoremap <C-C> <Esc>		" Press {Ctrl C} instead of {Esc} to exit Insert mode.

nnoremap <Leader>n :NERDTreeToggle<Enter>	" Press {Leader n} to access NERDTree plugin. 

" Foldings shortcuts
nnoremap za zA              " Press {za} to open / close all folding levels - Normal mode.
nnoremap zo zR              " Press {zc} to open every fold - Normal mode.
nnoremap zc zM              " Press {zc} to close every fold - Normal mode.

" Press {Ctrs Z} to open terminal vertically on the right.
nnoremap <C-Z> :below vert ter<Cr>

" Fast split navigation with <Ctrl> + hjkl - Normal mode
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Fast split navigation with <Ctrl> + hjkl - Terminal mode.
tnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>

" Map arrow keys nothing so I can get used to hjkl-style movement.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" User Interface Options

set laststatus=2        	" Always display the status bar.

set ruler               	" Always show cursor position.

set wildmenu            	" Display command line’s tab complete options as a menu.

set tabpagemax=40       	" Maximum number of tab pages that can be opened from the command line.

set background=light     	" Use colors that suit a dark background.

colorscheme gruvbox      	" Change color scheme.

set cursorline          	" Highlight the line currently under cursor.

set number              	" Show line numbers on the sidebar.

set relativenumber      	" Show line number on the current line and relative numbers on all other lines. Works only if the option above ( number ) is enabled.

augroup toggle_relative_number	" Enable relative numbers only in Normal mode, and absolute numbers only in Insert mode.
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

set noerrorbells        	" Disable beep on errors.

set visualbell          	" Flash the screen instead of beeping on errors.

set mouse=a             	" Enable mouse for scrolling and resizing.

set title               	" Set the window’s title, reflecting the file currently being edited.


" Swap and backup file options - disable all of them:

set noswapfile

set nobackup

set nowb


" Indentation options:

set autoindent         		" New lines inherit the indentation of previous lines.

filetype plugin indent on   " Smart auto indentation (instead of old smartindent option).

set tabstop=4           	" Show existing tab with 4 spaces width.

set shiftwidth=4        	" When indenting with ‘>’, use 2 spaces width.

set expandtab           	" On pressing tab, insert 4 spaces.

set wrap              		" Wrap lines.


" Search options:

set incsearch           	" Find the next match as we type the search.

set hlsearch            	" Highlight searches by default.

set smartcase           	" . . . unless you type a capital.


" Text rendering options

set encoding=utf-8      	" Use an encoding that supports Unicode.

set linebreak           	" Wrap lines at convenient points, avoid wrapping a line in the middle of a word.

set scrolloff=3         	" The number of screen lines to keep above and below the cursor.

set sidescrolloff=5     	" The number of screen columns to keep to the left and right of the cursor.

syntax enable           	" Enable syntax highlighting.

autocmd FileType text setlocal textwidth=79	" For all buffers of file type text, set locally the variable textwidth to 79.

set foldmethod=indent		" Folding code based on indentation.


" Miscellaneous Options

set confirm             	" Display a confirmation dialog when closing an unsaved file.

set nomodeline          	" Ignore file’s mode lines; use vimrc configurations instead.

set nrformats-=octal    	" Interpret octal as decimal when incrementing numbers.

set shell               	" The shell used to execute commands.

set spell               	" Enable spellchecking.


" Status line

set statusline=%t		" tail of the filename

set statusline+=%{&ff}		" file format

set statusline+=%h		" help file flag

set statusline+=%m		" modified flag

set statusline+=%r		" read only flag

set statusline+=%y		" filetype

set statusline+=%c,		" cursor column

set statusline+=%l/%L		" cursor line/total lines

set statusline+=\ %P		" percent through file

