" when editing a file, always jump to the last known cursor position.
" don't do it when the position is invalid or when inside an event
" handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g '\"" |
    \ endif

