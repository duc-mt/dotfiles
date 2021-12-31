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
packadd gfm-syntax
packadd limelight
packadd speeddating

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
nn fp gqap     :ec 'Format Paragraph Successfully !' <CR>
xn fp gqa<Esc> :ec 'Format Paragraph Successfully !' <CR>

" ----------------------------------------------------------------------------
" Convert md to pdf, html, ppt filetype
" ----------------------------------------------------------------------------
" Requirements: $ sudo apt install pandoc, texlive-latex-extra

nn pdf :!clear && echo 'Start Generating The PDF Version...' &&
      \ pandoc % -t beamer -o %.pdf<CR>
      \ :ec 'The PDF Version Is Ready !'<CR>

" Beautiful display on the web
nn html :!clear && echo 'Start Generating The HTML Version...' &&
      \ pandoc -t slidy -s % -o %.html<CR>
      \ :ec 'The HTML Version Is Ready !'<CR>

" Not very useful since the formatting is not good
nn ppt :!clear && echo 'Start Generating The PPT Version...' &&
      \ pandoc % -o %.pptx<CR>
      \ :ec 'The PPT Version Is Ready !'<CR>

" ----------------------------------------------------------------------------
" Abbreviations for the above conversion
" ----------------------------------------------------------------------------
ia abbr <Esc>ggO---<CR>title:<CR>- My Presentation<CR>author:<CR>- Tan Duc Mai<CR>theme:<CR>- Copenhagen<CR>date:<CR>- December 29th, 2021<CR>---<CR><ESC>
