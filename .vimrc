call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' 
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'aserebryakov/vim-todo-lists'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'

call plug#end()

syntax on
set nu
set rnu
filetype plugin indent on
let g:airline#extensions#tabline#enabled = 1

nmap <C-j> :bp<CR>
nmap <C-k> :bn<CR>
nmap <C-n> :TagbarToggle<CR>

nmap <C-l> <C-w>5<
nmap <C-m> <C-w>5>

map j <Left>
map k <Down>
map l <Up>
map m <Right>

set mouse=a
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

let g:airline_theme="material"
" let g:airline_theme="simple"
" let g:airline_theme="onedark"
let g:material_theme_style="palenight"
" colorscheme onedark
colorscheme material

set term=screen-256color
