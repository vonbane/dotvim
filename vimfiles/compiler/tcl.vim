" Vim compiler file
" Compiler: Tcl syntax checks

if exists("current_compiler")
  finish
endif
let current_compiler = "tcl"

setlocal makeprg=tclchecker\ %

