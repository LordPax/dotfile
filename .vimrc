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
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-repeat'
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'
Plug 'github/copilot.vim'
Plug 'bfrg/vim-jqplay'
Plug 'lumiliet/vim-twig'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'peterhoeg/vim-qml'
Plug 'rstacruz/sparkup'
Plug 'easymotion/vim-easymotion'

" Plug 'madox2/vim-ai'
" Plug 'skanehira/gh.vim'
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'tpope/vim-rhubarb'
" Plug 'OmniSharp/omnisharp-vim' " need mono-msbuild
" Plug 'puremourning/vimspector'
" Plug 'mg979/vim-visual-multi'
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
    echo "F11 ......... Toggle spell check"
    " echo "F11 ......... Acitve Jqplay"
    " echo "F12 ......... Deactive Jqplay with JqplayClose!"
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
command! -nargs=1 AsyncRunMdpdf :AsyncRun echo <q-args> | entr -n mdpdf <q-args>
command Sudow :w !sudo tee % >/dev/null

let s:back = 232
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
set cursorcolumn
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
set listchars=tab:>-,space:.,trail:. ",eol:↲
set invlist
set re=0
set encoding=utf-8
scriptencoding utf-8
set spelllang=fr
set term=screen-256color
" set completeopt=menuone,noinsert,noselect,popuphidden
" set completepopup=highlight:Pmenu,border:off

autocmd FileType javascript set makeprg=npm\ run\ test
autocmd FileType typescript set makeprg=npm\ run\ build
autocmd FileType cs set makeprg=dotnet\ build

nmap <C-i> :bp<CR>
nmap <C-o> :bn<CR>
nmap <C-h> :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <C-k> :tabp<CR>
nmap <C-l> :tabn<CR>

nmap <leader>j :Prettier<CR>
nmap <leader>k :nohlsearch<CR>
nmap <leader>l :bel term<CR>
nmap <leader>L :vert rightb term<CR>
nmap <leader>n :vert term ++close ranger<CR>
nmap <leader>N :bel term ++close ranger<CR>
nmap <leader>m :call cursor(0, getpos(".")[2] + (len(expand("<cword>"))/2))<CR>
nmap <leader>o :Copilot panel<CR>
nmap <leader>f :ToggleFileManager<CR>
nmap <leader>u :UndotreeToggle<CR>
nmap <leader>z zfiB<CR>
nmap <leader>s ]s
nmap <leader>S [s

nmap <leader>ga :Git add
nmap <leader>gaa :Git add *<CR>
nmap <leader>gpu :Git push origin
nmap <leader>gpum :Git push origin master<CR>
nmap <leader>gpud :Git push origin develop<CR>
nmap <leader>gpl :Git pull origin
nmap <leader>gplm :Git pull origin master<CR>
nmap <leader>gpld :Git pull origin develop<CR>
nmap <leader>gs :Git status<CR>
nmap <leader>gch :Git checkout
nmap <leader>gco :Git commit
nmap <leader>gl :Git log<CR>
nmap <leader>gb :Git branch

vmap <leader>y "+y
map <leader>yy "+yy
map <leader>p "+p
map <leader>P "+P

vmap <leader>ay "ay
map <leader>ayy "ayy
map <leader>ap "ap
map <leader>aP "aP

vmap <leader>by "by
map <leader>byy "byy
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
nmap <F9> :Ack! "<<<<<<< HEAD"<CR>
nmap <F10> :Ack! TODO<CR>
nmap <F11> :set spell!<CR>
" nmap <F11> :Jqplay<CR>
" nmap <F12> :JqplayClose!<CR>

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
    \'dir':  '\v(\.git|node_modules|build|dist)$',
    \'file': '\v\.(swp|o|so)$',
\}

let g:gitgutter_sign_priority = 1
let b:ale_linters = {
    \'javascript': ['eslint'],
    \'typescript': ['eslint'],
    \'sh': ['shellcheck', 'sh'],
    \'c': ['gcc'],
    \'cpp': ['clang', 'g++'],
    \'php': ['php'],
    \'cs': ['OmniSharp'],
    \'ruby': ['mri'],
    \'css': ['stylelint'],
    \'scss': ['stylelint']
\}

let g:undotree_WindowLayout = 3

let g:ackprg = "ag --vimgrep"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"

let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
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
highlight ErrorMsg ctermbg=NONE
highlight SpecialKey ctermfg=237
highlight ALEErrorSign ctermfg=red ctermbg=NONE
highlight ALEWarningSign ctermfg=yellow ctermbg=NONE
highlight ALEError ctermfg=red ctermbg=NONE
highlight ALEWarning ctermfg=yellow ctermbg=NONE
highlight ALEVirtualTextError ctermfg=red ctermbg=NONE
highlight ALEVirtualTextWarning ctermfg=yellow ctermbg=NONE
highlight SignColumn ctermbg=NONE ctermfg=NONE
