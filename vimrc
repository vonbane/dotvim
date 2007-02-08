""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" detect OS
if has("unix")
  let OS='unix'
elseif has("win32") || has("win64")
  let OS='windows'
else
  echo "Unknown Operating System."
  let OS='unknown'
endif

let mapleader=","
let g:mapleader=","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" turn filetype, plugin and indent detection on
filetype plugin indent on

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

if OS == "unix"
  set backupdir=/tmp//
  set directory=/tmp//
elseif OS == "windows"
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
  if has("gui_win32")
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


