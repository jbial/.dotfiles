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
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

"turn off search highlighting
nnoremap <leader>h :noh<cr>

" remap Y to yank to end of line
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
map { <Nop>
map } <Nop>
noremap K     {
noremap J     }
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

" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :PluginInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +PluginClean! +PluginInstall +qall
" Filetype off is required by vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""" MY VUNDLES """""""""""""""""""""""
" HEAVILY/MOSTLY taken from https://github.com/skwp/dotfiles 


" Make Git pervasive in vim ( :Gblame + Glog + many more )
Plugin 'tpope/vim-fugitive'
 
" file navigator gutter
Plugin 'scrooloose/nerdtree.git'

" Command+T replacement (ctrl+P)
Plugin 'kien/ctrlp.vim'

" Make it look amazing 
Plugin 'altercation/vim-colors-solarized'

" Pimped out bar at the bottom of current buffer
Plugin 'bling/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'

" Highlights class names + methods more brightly
" Handy for seeing syntax shape before your eyes
Plugin 'vim-scripts/TagHighlight.git'

" Search everything in the current dir via :Ack
Plugin 'mileszs/ack.vim'

" Enable Markdown Preview + GitHub flavored markdown
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'nelstrom/vim-markdown-preview'

" END OF VUNDLE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" NERDTree Mappins
" Open Nerd Tree with <Leader>n
map <Leader>n <esc>:NERDTreeToggle<cr>

" Reveal current file in NERDTree with <Leader>r
map <Leader>r <esc>:NERDTreeFind<cr>

" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <C-1> :tabn 1<cr>
map <silent> <C-2> :tabn 2<cr>
map <silent> <C-3> :tabn 3<cr>
map <silent> <C-4> :tabn 4<cr>
map <silent> <C-5> :tabn 5<cr>
map <silent> <C-6> :tabn 6<cr>
map <silent> <C-7> :tabn 7<cr>
map <silent> <C-8> :tabn 8<cr>
map <silent> <C-9> :tabn 9<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" ===== Add some shortcuts for ctags
map <Leader>tt <esc>:TagbarToggle<cr>
" TODO later, get open tag in new tab working
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" map <C-\>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"" Airline settings
let g:airline_section_c = '%{strftime("%c")}'
let g:airline_theme = 'dark'

" Color theme (drawing from altercation/vim-colors-solarized Plugin)
let g:solarized_visibility="normal"
let g:solarized_termtrans=1
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
highlight clear LineNr

