call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
" Plug 'tomasiser/vim-code-dark'
Plug 'LordPax/vim-code-dark', { 'branch': 'improve.diffReadability' }
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim' " need the_silver_searcher 
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-markdown'
Plug 'skywind3000/asyncrun.vim'
Plug 'skanehira/gh.vim'
" Plug 'tpope/vim-rhubarb'
" Plug 'LordPax/vim-encrypt'

call plug#end()

let s:back = 233
let s:back2 = 234
let s:back3 = 235
let s:front = 240

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
set autoread

autocmd FileType javascript set makeprg=npm\ run\ test
autocmd FileType typescript set makeprg=npm\ run\ build

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

let g:ctrlp_custom_ignore = {
\ 'dir':  '\v(\.git|node_modules|build)$',
\ 'file': '\v\.(swp|o|so)$',
\ }

" let g:syntastic_javascript_checkers = ["eslint"]
" let g:syntastic_c_checkers = ["clang_check"]
" let g:syntastic_c_checkers = ["gcc"]
let g:ackprg = "ag --vimgrep"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

colorscheme codedark
exe "highlight Normal ctermbg="..s:back
exe "highlight nontext ctermbg="..s:back
exe "highlight EndOfBuffer ctermbg="..s:back
exe "highlight CursorLine ctermbg="..s:back2
exe "highlight CursorColumn ctermbg="..s:back2
exe "highlight VertSplit ctermbg="..s:back3
exe "highlight VertSplit ctermfg="..s:front
exe "highlight LineNr ctermbg="..s:back
set term=screen-256color
