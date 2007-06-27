" comments

" set default comment leader
let b:comment_leader = '# '

" set file specific comment leaders
au FileType vim                         let b:comment_leader = '" '
au FileType c,cpp,java                  let b:comment_leader = '// '
au FileType tex                         let b:comment_leader = '% '
noremap <silent> <Leader>c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> <Leader>u :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>
