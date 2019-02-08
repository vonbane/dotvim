" Vim filetype plugin file
" Language:    Tcl

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

:compiler tcl

" folding
function! MyFoldLevel(lnum)

  " echom "###################################"
  " echom "MyFoldLevel"
  " echom v:lnum

  let l:line = getline(v:lnum)
  " let l:nextline = getline(v:lnum+1)
  let l:previous = foldlevel(v:lnum-1)

  " echom "line="
  " echom l:line
  " echom "l:previous="
  " echom l:previous

  if (l:line =~ "^proc" || l:line =~ "^::proc") && l:previous != 1
    " echom "proc >1"
    return ">1"
  elseif l:line =~ "^proc" || l:line =~ "^::proc"
    " echom "proc ="
    return "="
  elseif l:line =~ "^}$" && l:previous == 1
    " echom "close curly <1"
    return "<1"
  elseif l:line =~ "^$" && l:previous == 1
    let l:pline = getline(v:lnum-1)
    if l:pline =~ "^}$"
      return "0"
    else
      return l:previous
    endif
  elseif (l:line =~ "^oo::class create" || l:line =~ "^::oo::class create") && l:previous != 1
    " echom "oo::class >1"
    return ">1"
  else
    " echom "else"
    if ( l:previous == 0 )
      " echom "l:previous"
      return l:previous
    else
      " echom "="
      return "="
    endif
  endif

  " return "="

endfunction

function! MyFoldText()
  let line = getline(v:foldstart)

"   let n = v:foldstart
"   while match(line, "proc.*\{$") == -1
" "     :echo v:foldstart . " " . v:foldend . " " . n . " " . line
"     let line = getline(n)
"     let n = n + 1
"     if ( n > v:foldend )
"       return
"     endif
"   endwhile

  let sub = substitute(line, 'rpc::rproc', '', 'g')
  let sub = substitute(sub, '^proc', '', 'g')
  let sub = substitute(sub, '^::proc', '', 'g')
  let sub = substitute(sub, '^oo::class create', '', 'g')
  let sub = substitute(sub, '^::oo::class create', '', 'g')
  let sub = substitute(sub, '^::', '', 'g')
  let sub = substitute(sub, '{$', '', 'g')
"  let sub = substitute(sub, '{.*}', '', 'g')

  return v:folddashes . sub ." (" . (v:foldend - v:foldstart) . ") "
endfunction

set foldtext=MyFoldText()
set foldexpr=MyFoldLevel(v:lnum)
set foldmethod=expr



