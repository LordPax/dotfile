call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tomasiser/vim-code-dark'
Plug 'pangloss/vim-javascript'
Plug 'github/copilot.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bfrg/vim-jqplay'
Plug 'mileszs/ack.vim'
" Plug 'rking/ag.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

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
" set noexpandtab
set shiftwidth=4
set autoindent
set cursorline
set hlsearch
set title
set timeoutlen=1000 
set ttimeoutlen=0
set updatetime=100
set nobackup
set noswapfile

" autocmd BufEnter *.spec.js set makeprg=npm\ run\ test

nmap <C-i> :bp<CR>
nmap <C-o> :bn<CR>
nmap <C-h> :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <C-j> :tabp<CR>
nmap <C-k> :tabn<CR>
nmap <C-n> :nohlsearch<CR>
nmap <C-l> :bel term<CR>
noremap <ESC> <C-c>

map <M-j> <C-w>5<
map <M-k> <C-w>5-
map <M-l> <C-w>5+
map <M-m> <C-w>5>

noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j
noremap <C-w>l <C-w>k
noremap <C-w>m <C-w>l

noremap <C-w>J <C-w>H
noremap <C-w>K <C-w>J
noremap <C-w>L <C-w>K
noremap <C-w>M <C-w>L

map j <Left>
map k <Down>
map l <Up>
map m <Right>

let g:ackprg = "ag --vimgrep"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"
colorscheme codedark

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

set term=screen-256color
