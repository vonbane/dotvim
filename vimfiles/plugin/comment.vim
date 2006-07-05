" comments
au FileType vim                         let b:comment_leader = '" '
au FileType c,cpp,java                  let b:comment_leader = '// '
au FileType sh,csh,make,tcl             let b:comment_leader = '# '
au FileType tex                         let b:comment_leader = '% '
noremap <silent> ,c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

