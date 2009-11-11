" Tcl filetype detection
au BufNewFile,BufRead *
  \ if getline(1) =~ '\(tclsh\|wish\|proc\)' |
  \	set filetype=tcl |
  \ endif

