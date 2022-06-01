call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tomasiser/vim-code-dark'
" Plug 'LordPax/vim-code-dark', { 'branch': 'improve.diffReadability' }
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
Plug 'ap/vim-css-color'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'tpope/vim-rhubarb'
" Plug 'LordPax/vim-encrypt'

call plug#end()

let g:useSpace = 1

fun ToggleExpandTab()
    if g:useSpace == 1
        let g:useSpace = 0
        set noexpandtab
        echo "use tabulation"
    else
        let g:useSpace = 1
        set expandtab
        echo "use space"
    endif
endfun

command ToggleExpandTab call ToggleExpandTab()

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
set signcolumn="yes"
set listchars=tab:>-,trail:. ",eol:↲
set invlist

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

" vmap <C-s> "+y
vmap h "+y

nmap <F2> :SyntasticCheck<CR>
nmap <F3> :ToggleExpandTab<CR>
nmap <F4> :UltiSnipsEdit<CR>
nmap <F5> :Ack! 
nmap <F6> :AckFromSearch!<CR>
nmap <F7> :source ~/.vimrc<CR>

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
\ 'dir':  '\v(\.git|node_modules|build|dist)$',
\ 'file': '\v\.(swp|o|so)$',
\ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:gitgutter_sign_priority = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ["eslint"]
" let g:syntastic_sh_checkers = ["shellcheck"]
let g:syntastic_sh_checkers = ["sh"]
let g:syntastic_c_checkers = ["gcc"]
let g:syntastic_php_checkers = ["php"]
let g:syntastic_ruby_checkers = ["mri"]
" let g:syntastic_c_checkers = ["clang_check"]

let g:ackprg = "ag --vimgrep"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"
let g:doge_mapping="<F8>"

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
exe "highlight SpecialKey ctermfg=237"
" exe "highlight TabLine ctermbg="..s:back
" exe "highlight TabLineFill ctermbg="..s:back
" exe "highlight TabLineSel ctermbg="..s:back
highlight SyntasticErrorSign ctermfg=white ctermbg=red
set term=screen-256color
