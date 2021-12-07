call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
Plug 'tomasiser/vim-code-dark'

call plug#end()

for i in range(97,122)
    let c = nr2char(i)
    exec "map \e".c." <M-".c.">"
endfor

syntax on
set nu
set rnu
filetype plugin indent on
let g:airline#extensions#tabline#enabled = 1

nmap <C-i> :bp<CR>
nmap <C-o> :bn<CR>
nmap <C-l> :tabp<CR>
nmap <C-m> :tabn<CR>
nmap <C-n> :TagbarToggle<CR>
nmap <C-j> :bel term<CR>
nmap <C-k> :vert term<CR>

nmap <M-j> <C-w>5<
nmap <M-k> <C-w>5-
nmap <M-l> <C-w>5+
nmap <M-m> <C-w>5>

map j <Left>
map k <Down>
map l <Up>
map m <Right>

set mouse=a
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

let g:airline_theme="codedark"
colorscheme codedark

set term=screen-256color

" let g:airline_theme="material"
" colorscheme material
" let g:material_theme_style="palenight"

" let g:airline_theme="simple"
" let g:airline_theme="onedark"
" colorscheme onedark
" colorscheme nord

