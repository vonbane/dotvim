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

hi Normal      ctermfg=White
hi Normal      guifg=Black guibg=grey90
hi Comment     ctermfg=Cyan
hi Comment     guifg=DarkOrange1
hi PreProc     ctermfg=Magenta
hi PreProc     guifg=Magenta
hi Statement   ctermfg=Blue
hi Statement   guifg=MediumBlue
hi Identifier  ctermfg=Magenta
hi Identifier  guifg=DarkOrchid1
hi Constant    ctermfg=DarkCyan
hi Constant    guifg=DarkCyan
hi Special     ctermfg=Magenta
hi Special     guifg=SeaGreen
hi Type        ctermfg=Red
hi Type        guifg=Red
hi Function    ctermfg=Blue
hi Function    guifg=DarkCyan
hi Repeat      ctermfg=White
hi Repeat      guifg=White
hi Operator    ctermfg=Red
hi Operator    guifg=Red
hi Ignore      ctermfg=black
hi Ignore      guifg=black
hi Error       ctermfg=Black ctermbg=Red
hi Error       guifg=Black guibg=Red
hi Todo        ctermfg=Black ctermbg=Yellow
hi Todo        guifg=Black guibg=Yellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Repeat
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
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
