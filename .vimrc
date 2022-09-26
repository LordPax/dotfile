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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim' " need the_silver_searcher 
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-markdown'
Plug 'skywind3000/asyncrun.vim'
Plug 'skanehira/gh.vim'
Plug 'ap/vim-css-color'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'tpope/vim-rhubarb'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'prettier/vim-prettier', {
" \ 'do': 'yarn install',
" \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'OmniSharp/omnisharp-vim' " need mono-msbuild
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-repeat'
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'
Plug 'github/copilot.vim'
" Plug 'LordPax/vim-code-dark', { 'branch': 'improve.diffReadability' }
" Plug 'nickspoons/vim-sharpenup'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'LordPax/vim-encrypt'

call plug#end()

let g:useSpace = 1
let g:length = 4

fun HelpKey()
    echo "Help : "
    echo "F1 .......... This help"
    echo "F2 .......... Search with Ack"
    echo "F3 .......... Search with AckFromSearch"
    echo "F4 .......... Open snippet editor"
    echo "F5 .......... Refresh vimrc"
    echo "F6 .......... Toggle with space and tab"
    echo "F7 .......... Toggle with tab length 4 and 2"
    echo "F8 .......... Toggle ale for a buffer"
    echo "F9 .......... Generate doc for a function"
    echo "F10 ......... Find all TODO in project"
endfun

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

fun ToggleLength()
    if g:length == 4
        let g:length = 2
        echo "length set to 2"
    else
        let g:length = 4
        echo "length set to 4"
    endif
    exe "set tabstop="..g:length
    exe "set shiftwidth="..g:length
endfun

command HelpKey call HelpKey()
command ToggleExpandTab call ToggleExpandTab()
command ToggleLength call ToggleLength()

let s:back = 233
let s:back2 = 234
let s:back3 = 235
let s:front = 240

for i in range(97,122)
    let c = nr2char(i)
    exec "map \e".c." <M-".c.">"
endfor

let mapleader = " "
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
set smartindent
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
set re=0
set encoding=utf-8
scriptencoding utf-8
" set completeopt=menuone,noinsert,noselect,popuphidden
" set completepopup=highlight:Pmenu,border:off

autocmd FileType javascript set makeprg=npm\ run\ test
autocmd FileType typescript set makeprg=npm\ run\ build
autocmd FileType cs set makeprg=dotnet\ build

nmap <C-i> :bp<CR>
nmap <C-o> :bn<CR>
nmap <C-h> :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <C-j> :tabp<CR>
nmap <C-k> :tabn<CR>

nmap <leader>j :Prettier<CR>
nmap <leader>k :nohlsearch<CR>
nmap <leader>l :bel term<CR>
nmap <leader>m :call cursor(0, getpos(".")[2] + (len(expand("<cword>"))/2))<CR>
" map <ESC> <C-c>

vmap h "+y

nmap <F1> :HelpKey<CR>
nmap <F2> :Ack! 
nmap <F3> :AckFromSearch!<CR>
nmap <F4> :UltiSnipsEdit<CR>
nmap <F5> :source ~/.vimrc<CR>
nmap <F6> :ToggleExpandTab<CR>
nmap <F7> :ToggleLength<CR>
nmap <F8> :ALEToggleBuffer<CR>
let g:doge_mapping="<F9>"
nmap <F10> :Ack! TODO<CR>

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

" let g:prettier#config#parser = 'babylon'

let g:ctrlp_custom_ignore = {
\ 'dir':  '\v(\.git|node_modules|build|dist)$',
\ 'file': '\v\.(swp|o|so)$',
\ }

let g:gitgutter_sign_priority = 1
let b:ale_linters = {
    \'javascript': ['eslint'],
    \'typescript': ['eslint'],
    \'sh': ['shellcheck', 'sh'],
    \'c': ['gcc'],
    \'php': ['php'],
    \'cs': ['OmniSharp'],
    \'ruby': ['mri']
\}

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
exe "highlight SpecialKey ctermfg=237"
highlight ALEErrorSign ctermfg=white ctermbg=red
set term=screen-256color
