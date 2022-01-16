call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tomasiser/vim-code-dark'
Plug 'pangloss/vim-javascript'

call plug#end()

for i in range(97,122)
    let c = nr2char(i)
    exec "map \e".c." <M-".c.">"
endfor

syntax on
set nu
set rnu
filetype plugin indent on
set path+=**
set wildmenu
set mouse=a
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cursorline
set hlsearch

nmap <C-i> :bp<CR>
nmap <C-o> :bn<CR>
nmap <C-h> :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <C-j> :tabp<CR>
nmap <C-k> :tabn<CR>
nmap <C-n> :TagbarToggle<CR>
nmap <C-l> :bel term<CR>
nmap <C-m> :nohlsearch<CR>

map <M-j> <C-w>5<
map <M-k> <C-w>5-
map <M-l> <C-w>5+
map <M-m> <C-w>5>

noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j
noremap <C-w>l <C-w>k
noremap <C-w>m <C-w>l

map j <Left>
map k <Down>
map l <Up>
map m <Right>

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"
colorscheme codedark

set term=screen-256color
