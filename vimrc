""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader=","
let g:mapleader=","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent
set history=50
set ruler
set showcmd
set incsearch
set foldmethod=marker
set pastetoggle=<F11>
set undolevels=1000
set cindent
set mouse=a
set laststatus=2

if MySys() == "linux"
  set backupdir=/tmp//
  set directory=/tmp//
elseif MySys() == "windows"
  set backupdir=c:\\tmp\\
  set directory=c:\\tmp\\
endif

" tab setup
set tabstop=2
set shiftwidth=2
set expandtab

" keeps 6 lines vertically visable when moving
set so=6

" status line
" set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" file format stuff
nmap <leader>fd :set ff=dos<cr>
nmap <leader>fu :set ff=unix<cr>

" buffers
map <F9> <Esc>:bprevious<CR>
map <F10> <Esc>:bnext<CR>

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" quick way to move a line of text up or down
map <C-Up> dd-P
map <C-Down> ddp

" toggle search highlighting on/off
map H :let &hlsearch = !&hlsearch<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" settings for the gui only
if has("gui_running")
  "set guifont=-adobe-courier-medium-r-normal--10-120-75-75-m-70-iso8859-1
  if has("gui_kde")
    set guifont=Monospace/8/-1/5/50/0/0/0/0/0
  elseif has("gui_win32")
    set guifont=ProggyCleanTT:h12:cANSI
  else
    "set guifont=Courier\ 10\ Pitch\ 8
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
    "set guifont=Monospace\ 8
    set guifont=ProggyCleanTT\ 12
  endif
  set lines=40
  set columns=80
endif

" colorscheme
colorscheme mycolors

" highlight the whitespace characters at end of line
hi WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+\%#\@!$/

if has("autocmd")
  " enable file type detection.
  " use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on C files, etc.
  " also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " for all test files set 'textwidth' to 78 characters.
" autocmd FileType text setlocal textwidth=78

  " when editing a file, always jump to the last known cursor position.
  " don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g '\"" |
    \ endif

  " remove trailing whitespace from lines
  " autocmd BufWritePre * :%s/\s\+$//e

endif " has("autocmd")

