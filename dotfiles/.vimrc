set nocompatible

set et
set sw=2
set ts=2
set autoindent
set nu                  " Enable line numbers
syntax on

filetype plugin indent on

set modeline            " Enable modeline.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.

set laststatus=2        " Always show status line.
set wildmode=longest,longest,list    " Perform bash style command completion

call pathogen#runtime_append_all_bundles()

helptags ~/.vim/doc

autocmd BufReadPost Capfile set syntax=ruby
autocmd BufReadPost Gemfile set syntax=ruby

autocmd BufRead *\.{txt,textile} setlocal formatoptions=l
autocmd BufRead *\.{txt,textile} setlocal lbr
autocmd BufRead *\.{txt,textile} map  j gj
autocmd BufRead *\.{txt,textile} map  k gk
autocmd BufRead *\.{txt,textile} setlocal smartindent
autocmd BufRead *\.{txt,textile} setlocal spell spelllang=en_us
autocmd BufRead *\.{txt,textile} setlocal nonumber

au BufRead,BufNewFile *.less setfiletype less

autocmd User Rails Rnavcommand jobs app/jobs
autocmd User Rails Rnavcommand daemons app/daemons
autocmd User Rails Rnavcommand csupport app/controller_support
autocmd User Rails Rnavcommand -suffix=.less less app/stylesheets

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

if has('gui')
  colorscheme solarized
  set background=dark
else
  colorscheme vividchalk
end

if exists('+colorcolumn')
  set colorcolumn=120
  " Less intense color column
  hi ColorColumn guibg=#2d2d2d

  autocmd BufRead *\.{txt,textile} setlocal colorcolumn=0
endif

let g:ruby_debugger_progname = 'mvim'
