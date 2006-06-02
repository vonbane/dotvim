"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" filetype.vim - Vim filetype identification file
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  
" Tcl
au BufNewFile,BufRead *
  \ if getline(1) =~ '\(tclsh\|wish\)' |
  \	setf tcl |
  \ endif
  
augroup END

