" Vim filetype plugin
" Language:     Markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             __  __    _    ____  _  ______   _____        ___   _
"            |  \/  |  / \  |  _ \| |/ /  _ \ / _ \ \      / / \ | |
"            | |\/| | / _ \ | |_) | ' /| | | | | | \ \ /\ / /|  \| |
"            | |  | |/ ___ \|  _ <| . \| |_| | |_| |\ V  V / | |\  |
"            |_|  |_/_/   \_\_| \_\_|\_\____/ \___/  \_/\_/  |_| \_|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("b:did_ftplugin")
  fini
end

ru! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

setl comments=fb:*,fb:-,fb:+,n:> commentstring=<!--%s-->
setl formatoptions+=tcqln formatoptions-=r formatoptions-=o
setl formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:\\&^.\\{4\\}

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl cms< com< fo< flp<"
el
  let b:undo_ftplugin = "setl cms< com< fo< flp<"
end

if !exists("g:no_plugin_maps") && !exists("g:no_markdown_maps")
  nn <silent><buffer> [[ :<C-U>call search('\%(^#\{1,5\}\s\+\S\\|^\S.*\n^[=-]\+$\)', "bsW")<CR>
  nn <silent><buffer> ]] :<C-U>call search('\%(^#\{1,5\}\s\+\S\\|^\S.*\n^[=-]\+$\)', "sW")<CR>
  xn <silent><buffer> [[ :<C-U>exe "normal! gv"<Bar>call search('\%(^#\{1,5\}\s\+\S\\|^\S.*\n^[=-]\+$\)', "bsW")<CR>
  xn <silent><buffer> ]] :<C-U>exe "normal! gv"<Bar>call search('\%(^#\{1,5\}\s\+\S\\|^\S.*\n^[=-]\+$\)', "sW")<CR>
  let b:undo_ftplugin .= '|sil! nunmap <buffer> [[|sil! nunmap <buffer> ]]|sil! xunmap <buffer> [[|sil! xunmap <buffer> ]]'
end

fu! s:NotCodeBlock(lnum) abort
  retu synIDattr(synID(a:lnum, 1, 1), 'name') !=# 'markdownCode'
end

fu! MarkdownFold() abort
  let line = getline(v:lnum)

  if line =~# '^#\+ ' && s:NotCodeBlock(v:lnum)
    retu ">" . match(line, ' ')
  end

  let nextline = getline(v:lnum + 1)
  if (line =~ '^.\+$') && (nextline =~ '^=\+$') && s:NotCodeBlock(v:lnum + 1)
    retu ">1"
  end

  if (line =~ '^.\+$') && (nextline =~ '^-\+$') && s:NotCodeBlock(v:lnum + 1)
    retu ">2"
  end

  retu "="
end

fu! s:HashIndent(lnum) abort
  let hash_header = matchstr(getline(a:lnum), '^#\{1,6}')
  if len(hash_header)
    retu hash_header
  el
    let nextline = getline(a:lnum + 1)
    if nextline =~# '^=\+\s*$'
      retu '#'
    elsei nextline =~# '^-\+\s*$'
      retu '##'
    end
  end
end

fu! MarkdownFoldText() abort
  let hash_indent = s:HashIndent(v:foldstart)
  let title = substitute(getline(v:foldstart), '^#\+\s*', '', '')
  let foldsize = (v:foldend - v:foldstart + 1)
  let linecount = '['.foldsize.' lines]'
  retu hash_indent.' '.title.' '.linecount
end

if has("folding") && get(g:, "markdown_folding", 0)
  setl foldexpr=MarkdownFold()
  setl foldmethod=expr
  setl foldtext=MarkdownFoldText()
  let b:undo_ftplugin .= " foldexpr< foldmethod< foldtext<"
end

" vim:set sw=2:
