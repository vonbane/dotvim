"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" tcl.vim - Vim syntax file
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
endif

" syn keyword tclStatement proc global return lindex

syn keyword tclStatement after append auto_execok auto_import
syn keyword tclStatement auto_load auto_mkindex auto_qualify auto_reset
syn keyword tclStatement bgerrer binary break catch cd close
syn keyword tclStatement concat continue dde encoding eof error eval
syn keyword tclStatement exec exit expr fblocked fconfigure fcopy
syn keyword tclStatement fileevent flush for foreach format
syn keyword tclStatement gets glob global history http if incr
syn keyword tclStatement interp join lappend lindex linsert list
syn keyword tclStatement llength load lrange lreplace lsearch lset
syn keyword tclStatement lsort memory msgcat open
syn keyword tclStatement parray pid pkg::create pkg::mkIndex puts
syn keyword tclStatement pwd read resexp registry regsub rename
syn keyword tclStatement resource return scan seek set socket source
syn keyword tclStatement split subst switch tcl_endofWord
syn keyword tclStatement tcl_findLibrary tcl_startOfNextWord
syn keyword tclStatement tcl_startOfPrevoiusWord tcl_wordBreakAfter
syn keyword tclStatement tcl_wordBreakBefore tcltest tclvars tell time
syn keyword tclStatement trace unknown unset update uplevel upvar
syn keyword tclStatement variable vwait while

syn region tclComment start="^\s*\#" end="$" contains=tclTodo,tclError
syn region tclComment start=/;\s*\#/hs=s+1 end="$" contains=tclTodo,tclError

syn keyword tclTodo contained TODO
syn keyword tclError contained FIXME

syn match tclVariable "$[a-zA-Z0-9_:]*"
syn match tclVariable "${[a-zA-Z0-9_.:-]*}"
syn match tclVariable "$::[a-zA-Z0-9_:]*"
syn match tclVariable "${::[a-zA-Z0-9_.:-]*}"

syn match tclLineContinue "\\\s*$"

syn match  tclEnclosure "{"
syn match  tclEnclosure "}"

syn match   tclSpecial contained "\\\d\d\d\=\|\\."

syn region  tclString start=+^"+hs=s+1 start=+[^\\]"+hs=s+2  skip=+\\\\\|\\"+  end=+"+he=e-1 contains=tclVariable,tclSpecial,tclInterpret

syn region  tclInterpret matchgroup=tclStatement start="\[" end="\]" contains=ALL

" array command
syn keyword tclArrayOptions contained anymore donesearch exists get names nextelement set size startsearch unset
syn region  tclArrayCommand matchgroup=tclStatement start="\<array\>" matchgroup=NONE end="\s*\w*" contains=tclArrayOptions

" clock command
syn keyword tclClockOptions contained format scan seconds
syn region  tclClockCommand matchgroup=tclStatement start="\<clock\>" matchgroup=NONE end="\s*\w*" contains=tclClockOptions

" file command
syn keyword tclFileOptions contained atime attributes channels copy delete dirname executable exists extension isdirectory isfile join lstat mkdir mtime nativename owned pathtype readable readlink rename rootname size split stat tail type volume writable
syn region  tclFileCommand matchgroup=tclStatement start="\<file\>" matchgroup=NONE end="\s*\w*" contains=tclFileOptions

" info command
syn keyword tclInfoOptions contained args body cmdcount commands complete default exists globals hostname level library loaded locals nameofexecutable patchlevel procs script sharedlibextension tclversion vars
syn region  tclInfoCommand matchgroup=tclStatement start="\<info\>" matchgroup=NONE end="\s*\w*" contains=tclInfoOptions

" namespace command
syn keyword tclNamespaceOptions contained children code current delete eval export forget import inscope origin parent qualifiers tail which
syn region  tclNamespaceCommand matchgroup=tclStatement start="\<namespace\>" matchgroup=NONE end="\s*\w*" contains=tclNamespaceOptions

" package command
syn keyword tclPackageOptions contained forget ifneeded names present provide require unknown vcompare versions vsatisfies
syn region  tclPackageCommand matchgroup=tclStatement start="\<package\>" matchgroup=NONE end="\s*\w*" contains=tclPackageOptions

" proc command
syn region tclProcCommand matchgroup=tclStatement start="\<proc\>" matchgroup=tclProcName end="\s*[a-zA-Z0-9:._-]*"

" string command
syn keyword tclStringOptions contained compare equal first index last length match range tolower toupper trim trimleft trimright wordstart wordend
syn region  tclStringCommand matchgroup=tclStatement start="\<string\>" matchgroup=NONE end="\s*\w*" contains=tclStringOptions

" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tcl_syntax_inits")
  if version < 508
    let did_tcl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tclStatement         Statement
  HiLink tclComment           Comment
  HiLink tclVariable          Identifier
  HiLink tclString            Constant
  HiLink tclArrayOptions      Statement
  HiLink tclClockOptions      Statement
  HiLink tclFileOptions       Statement
  HiLink tclInfoOptions       Statement
  HiLink tclStringOptions     Statement
  HiLink tclNamespaceOptions  Statement
  HiLink tclPackageOptions    Statement
  HiLink tclTodo              Todo
  HiLink tclError             Error
  HiLink tclEnclosure         Statement
  HiLink tclProcName          Function
  HiLink tclSpecial           Special

  delcommand HiLink
endif

let b:current_syntax = "tcl"

" vim: ts=8

