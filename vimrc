""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set t_Co=256

call pathogen#infect()

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
let g:tcommentMapLeaderOp1=","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" turn filetype, plugin and indent detection on
filetype plugin indent on

set autoindent
set history=100
set ruler
set showcmd
set incsearch
set foldmethod=marker
set pastetoggle=<F11>
set undolevels=1000
set cindent
set mouse=a
set laststatus=2
set nowrap
set sidescroll=1
set sidescrolloff=5

if OS == "unix"
  set backupdir=/tmp//
  set directory=/tmp//
elseif OS == "windows"
  set backupdir=c:\\windows\\temp\\
  set directory=c:\\windows\\temp\\
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

" remove trailing whitespace
nmap <leader>ws :%s/\s\+$//<cr>

" hex editing
nmap <leader>hon :%!xxd<cr>
nmap <leader>hof :%!xxd -r<cr>

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
  set background=light
"   set lines=40
"   set columns=80

  " setup cursorline
  set cursorline

  "set guifont=-adobe-courier-medium-r-normal--10-120-75-75-m-70-iso8859-1
  if OS == "windows"
    set guifont=ProggyCleanTT:h12:cANSI
  else
    "set guifont=Courier\ 10\ Pitch\ 8
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
    "set guifont=Monospace\ 8
    set guifont=ProggyCleanTT\ 12
    set guifont=Source\ Sans\ Pro\ Semi-Bold\ 10
  endif
else
  set background=dark
endif

" colorscheme
" colorscheme mycolors
colorscheme solarized

" highlight the whitespace characters at end of line
hi WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+\%#\@!$/

" Show syntax highlighting groups for word under cursor
nmap <leader>hg :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:Powerline_colorscheme = 'solarized'

