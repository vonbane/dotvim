" Tcl filetype detection
au BufNewFile,BufRead *
  \ if getline(1) =~ '\(tclsh\|wish\)' |
  \	set filetype=tcl |
  \ endif

