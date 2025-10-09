" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on


" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","

"turn off search highlighting
nnoremap <leader>h :noh<cr>

" remap Y to yank to end of line
nnoremap y "+y
vnoremap y "+y
nnoremap Y y$

" Easy tab switching
noremap gr gT

"remap esc key in insert mode
imap jj <Esc><Right>

"easy window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Save with leader+s
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

"Easy brace/quote management
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

"Enter line break or newline without entering insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>j r<Cr>

" =================== Navigation ====================

"normal mode navigations 
"nmap <Up>    <Nop>
"nmap <Down>  <Nop>
"nmap <Left>  <Nop>
"nmap <Right> <Nop>
map $ <Nop>
map ^ <Nop>
noremap H     ^
noremap L     $
noremap <C-x> :bp<Bar>bd #<Cr>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" NOT WORKING: Didnt work when yanked right out of YADR
"silent !mkdir ~/.vim/backups > /dev/null 2>&1
"set undodir=~/.vim/backups
"set undofile

" ================ Indentation ======================

set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" NERDTree Mappins
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>

" Reveal current file in NERDTree with <Leader>r
map <Leader>r <esc>:NERDTreeFind<cr>

" ====== Cycle tabs with ctrl + H/L
map <silent> <C-H> :tabprevious<cr>
map <silent> <C-L> :tabNext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"" Airline settings
let g:airline_theme = 'minimalist'

"" Theme Settings
colorscheme slate
set background=dark
