set nocompatible

set et
set sw=2
set ts=2
set autoindent
set nu                  " Enable line numbers
syntax on
colorscheme ron

filetype plugin indent on

set modeline            " Enable modeline.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.

set laststatus=2        " Always show status line.
set wildmode=longest,longest,list    " Perform bash style command completion

helptags ~/.vim/doc

autocmd BufReadPost Capfile set syntax=ruby

autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map  j gj
autocmd BufRead *\.txt  map  k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us

