if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/nvim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

set nocompatible
filetype plugin indent on
set path+=**
set wildmenu
"set wildmode=longest,list,full
"set lazyredraw
set titleold=
"set nofoldenable
set shell=bash
set showmode
set background=dark
set ttyfast
"set linebreak
set incsearch
set hlsearch
set expandtab
set smartcase
set ignorecase
set backspace=indent,eol,start
set showcmd
set showmatch
set autoindent
set fileformats=unix,dos
set preserveindent
set wrap
set scrolloff=5
set sidescrolloff=5
set sw=4
set ts=4
set sts=4
set smarttab
set vb

set splitbelow splitright

set laststatus=2
set noshowmode
"let g:lightline = { 'colorscheme': 'OldHope', }

set updatetime=100
set nu
set rnu
let g:gitgutter_max_signs=-1

let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap n nzz
nnoremap N Nzz

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au BufRead,BufNewFile *.yml,*.yaml,*.eyaml set ft=yaml
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

syntax on
color codedark
"color molokai
hi Normal guibg=#000000 ctermbg=000
"hi LineNr guifg=#BCBCBC guibg=#3B3A32  ctermfg=243 ctermbg=236
"hi CursorLineNr guifg=#BCBCBC guibg=#3B3A32  ctermfg=NONE ctermbg=239
"hi Visual guifg=#1a1a1a guibg=#e4dfff guisp=#e4dfff gui=NONE ctermfg=234 ctermbg=189 cterm=NONE

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
