function! MyFoldLevel(lnum)

     let l:line = getline(a:lnum)
     let l:nextline = getline(a:lnum+1)
     let l:previous = foldlevel(a:lnum-1)

     if (l:line =~ "^::proc" || l:line =~ "^proc") && l:previous != 1
         return ">1"
     elseif l:line =~ "^proc" || l:line =~ "^::proc"
         return "="
     elseif l:line =~ "^################" && l:previous != 1
         return ">1"
     elseif l:line =~ "^ı" && l:previous != 1
         return ">1"
     elseif l:line =~ "^#%PS%" && l:previous != 1
         return ">1"
     elseif l:line =~ "^#{{{" && l:previous != 1
         return ">1"
     elseif l:line =~ "^}$" && (l:previous == 1 && match(nextline, "#}}}") == -1)
         return "<1"
     elseif l:line =~ "#}}}"
         return "<1"
     elseif l:line =~ "^$" && (l:previous == 0 || l:previous == "<1")
         return "<1"
     endif

     return "="

 endfunction

 function MyFoldText()
     let line = getline(v:foldstart)

     let n = v:foldstart
     while match(line, "proc.*\{$") == -1
         let line = getline(n)
         let n = n + 1
     endwhile

     let sub = substitute(line, 'rpc::rproc', '', 'g')
     let sub = substitute(sub, '^proc', '', 'g')
     let sub = substitute(sub, '^::proc', '', 'g')
     let sub = substitute(sub, '^::', '', 'g')
     let sub = substitute(sub, '{$', '', 'g')
"      let sub = substitute(sub, '{.*}', '', 'g')

     return v:folddashes . sub . " (" . (v:foldend - v:foldstart) . ") "
 endfunction

 set foldtext=MyFoldText()
 set foldexpr=MyFoldLevel(v:lnum)
 set foldmethod=expr
