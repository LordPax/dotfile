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
Plug 'tpope/vim-markdown'
Plug 'skywind3000/asyncrun.vim'
" Plug 'skanehira/gh.vim'
Plug 'ap/vim-css-color'
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " plugin lent
" Plug 'tpope/vim-rhubarb'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'OmniSharp/omnisharp-vim' " need mono-msbuild
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-repeat'
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'
Plug 'github/copilot.vim'
Plug 'bfrg/vim-jqplay'
Plug 'lumiliet/vim-twig'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'puremourning/vimspector'
" Plug 'mg979/vim-visual-multi'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'

" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'LordPax/vim-code-dark', { 'branch': 'feat.netrwMarkFile' }
" Plug 'jalvesaq/Nvim-R'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'LordPax/vim-encrypt'

call plug#end()

let g:useSpace = 1
let g:length = 4
let g:fileMan = 0

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
    echo "F9 .......... Find all git conflict"
    " echo "F9 .......... Generate doc for a function"
    echo "F10 ......... Find all TODO in project"
    echo "F11 ......... Acitve Jqplay"
    echo "F12 ......... Deactive Jqplay with JqplayClose!"
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

fun ToggleFileManager()
    if g:fileMan == 0
        let g:fileMan = 1
        exe "Lex | vertical resize 30"
    else
        let g:fileMan = 0
        exe "Lex"
    endif
endfun

if has("persistent_undo")
    let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

command HelpKey call HelpKey()
command ToggleExpandTab call ToggleExpandTab()
command ToggleLength call ToggleLength()
command ToggleFileManager call ToggleFileManager()

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
set incsearch
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
nmap <leader>o :Copilot panel<CR>
nmap <leader>f :ToggleFileManager<CR>
nmap <leader>u :UndotreeToggle<CR>

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" vmap h "+y
vmap <leader>y "+y
map <leader>p "+p
map <leader>P "+P

vmap <leader>ay "ay
map <leader>ap "ap
map <leader>aP "aP

vmap <leader>by "by
map <leader>bp "bp
map <leader>bP "bP

nmap <F1> :HelpKey<CR>
nmap <F2> :Ack! 
nmap <F3> :AckFromSearch!<CR>
nmap <F4> :UltiSnipsEdit<CR>
nmap <F5> :source ~/.vimrc<CR>
nmap <F6> :ToggleExpandTab<CR>
nmap <F7> :ToggleLength<CR>
nmap <F8> :ALEToggleBuffer<CR>
" let g:doge_mapping="<F9>"
nmap <F9> :Ack! "<<<<<<< HEAD"
nmap <F10> :Ack! TODO<CR>
nmap <F11> :Jqplay<CR>
nmap <F12> :JqplayClose!<CR>

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

let g:gitgutter_sign_priority = 1
let b:ale_linters = {
    \'javascript': ['eslint'],
    \'typescript': ['eslint'],
    \'sh': ['shellcheck', 'sh'],
    \'c': ['gcc'],
    \'cpp': ['clang', 'g++'],
    \'php': ['php'],
    \'cs': ['OmniSharp'],
    \'ruby': ['mri']
\}

let g:undotree_WindowLayout = 3

let g:ackprg = "ag --vimgrep"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"

let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:netrw_banner = 0
let g:netrw_liststyle = 3

colorscheme codedark
exe "highlight Normal ctermbg="..s:back
exe "highlight NonText ctermbg="..s:back
exe "highlight EndOfBuffer ctermbg="..s:back
exe "highlight CursorLine ctermbg="..s:back2
exe "highlight CursorColumn ctermbg="..s:back2
exe "highlight VertSplit ctermbg="..s:back3.." ctermfg="..s:front
exe "highlight LineNr ctermbg="..s:back
highlight ModeMsg ctermbg=NONE
highlight MoreMsg ctermbg=NONE
highlight SpecialKey ctermfg=237
highlight ALEErrorSign ctermfg=white ctermbg=red
set term=screen-256color
