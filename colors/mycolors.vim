""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" mycolors.vim - Vim color file
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mycolors"

hi Normal      ctermfg=254  ctermbg=none cterm=none
hi Normal        guifg=Black  guibg=grey90  gui=none

hi Bold        ctermfg=Blue        cterm=none
hi Bold          guifg=MediumBlue    gui=none

hi Comment     ctermfg=214         cterm=none
hi Comment       guifg=DarkOrange1    gui=none

hi Constant    ctermfg=DarkCyan  cterm=none
hi Constant      guifg=DarkCyan    gui=none

hi Identifier  ctermfg=Magenta      cterm=none
hi Identifier    guifg=DarkOrchid1    gui=none

hi Function    ctermfg=Blue      cterm=none
hi Function      guifg=DarkCyan    gui=none

hi Statement   ctermfg=Blue        cterm=none
hi Statement     guifg=MediumBlue    gui=none

hi Operator    ctermfg=Red  cterm=none
hi Operator      guifg=Red    gui=none

hi PreProc     ctermfg=Magenta  cterm=none
hi PreProc       guifg=Magenta    gui=none

hi Type        ctermfg=Blue        cterm=none
hi Type          guifg=MediumBlue    gui=none

hi Special     ctermfg=Magenta   cterm=none
hi Special       guifg=SeaGreen    gui=none

hi Ignore      ctermfg=black  cterm=none
hi Ignore        guifg=black    gui=none

hi Error       ctermfg=Black  ctermbg=Red  cterm=none
hi Error         guifg=Black    guibg=Red    gui=none

hi Todo        ctermfg=Black  ctermbg=Yellow  cterm=none
hi Todo          guifg=Black    guibg=Yellow    gui=none


" hi LineNR
hi MoreMsg      ctermfg=Green cterm=none
hi MoreMsg      guifg=SeaGreen gui=none
hi ModeMsg      cterm=none
hi ModeMsg      gui=none
hi NonText      ctermfg=Blue cterm=none
hi NonText      guifg=Blue gui=none
hi StatusLine   cterm=none,reverse
hi StatusLine   gui=none,reverse
hi Title        ctermfg=Magenta cterm=none
hi Title        guifg=Magenta gui=none
hi Question     ctermfg=Green cterm=none
hi Question     guifg=Green gui=none
hi cursorline   guibg=#d6dde6
hi CursorColumn guibg=#d6dde6


" Common groups that link to default highlighting.
" You can specify other highlighting easily.

hi link Function        Identifier
hi link cshExtVar       Identifier

hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement

hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc

hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type

hi link SpecialChar     Special
hi link Tag             Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special

hi link tclProcName     Constant

