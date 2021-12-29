" Vim filetype plugin
" Language:  Markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            __  __    _    ____  _  ______   _____        ___   _
"           |  \/  |  / \  |  _ \| |/ /  _ \ / _ \ \      / / \ | |
"           | |\/| | / _ \ | |_) | ' /| | | | | | \ \ /\ / /|  \| |
"           | |  | |/ ___ \|  _ <| . \| |_| | |_| |\ V  V / | |\  |
"           |_|  |_/_/   \_\_| \_\_|\_\____/ \___/  \_/\_/  |_| \_|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:did_ftplugin")
  fini
end

ru! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

" Enable plugin
pa! gfm-syntax

colo PaperColor
setl nolisp
setl nosi

setl comments=fb:*,fb:-,fb:+,n:> commentstring=<!--%s-->
setl formatoptions+=tcqln formatoptions-=r formatoptions-=o
setl formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:\\&^.\\{4\\}

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

fu! s:goyo_enter()
  if has('gui_running')
    se fullscreen
    se linespace=7
  elsei exists('$TMUX')
    silent !tmux set status off
  end
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endf

fu! s:goyo_leave()
  if has('gui_running')
    se nofullscreen
    se linespace=0
  elsei exists('$TMUX')
    silent !tmux set status on
  end
  Limelight!
endf

au! User GoyoEnter nested call <SID>goyo_enter()
au! User GoyoLeave nested call <SID>goyo_leave()

" ----------------------------------------------------------------------------
" Tabular
" ----------------------------------------------------------------------------
" Call the :Tabularize command each time a | character is inserted
ino <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
fu! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    norm! 0
    cal search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  end
endf

" ----------------------------------------------------------------------------
" Seamlessly treat visual lines as actual lines when moving around
" ----------------------------------------------------------------------------
nn j gj
nn k gk

" ----------------------------------------------------------------------------
" Format paragraph (selected or not) to 80 character lines
" ----------------------------------------------------------------------------
nn fp gqap
xn fp gqa<Esc>
