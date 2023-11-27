call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tomasiser/vim-code-dark'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim' " need the_silver_searcher
Plug 'dense-analysis/ale'
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
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'fatih/vim-go'
Plug 'peterhoeg/vim-qml'
Plug 'rstacruz/sparkup'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mg979/vim-visual-multi'
Plug 'bfrg/vim-cpp-modern'
Plug 'LordPax/vim-cligpt'
Plug 'LordPax/vim-encrypt'
Plug 'nicwest/vim-http'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'azabiong/vim-highlighter'
Plug 'prisma/vim-prisma'
Plug 'vifm/vifm.vim'
Plug 'hashivim/vim-terraform'
runtime ftplugin/man.vim

call plug#end()

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vimwiki/vimwiki'
" Plug 'Frederick888/vim-prettier', { 'branch': 'prettier-3-0', 'do': 'yarn install' }
" Plug 'tpope/vim-markdown'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'easymotion/vim-easymotion'
" Plug 'preservim/tagbar'
" Plug 'madox2/vim-ai'
" Plug 'skanehira/gh.vim'
" Plug 'tpope/vim-rhubarb'
" Plug 'OmniSharp/omnisharp-vim' " need mono-msbuild
" Plug 'puremourning/vimspector'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'LordPax/vim-code-dark', { 'branch': 'feat.netrwMarkFile' }
" Plug 'jalvesaq/Nvim-R'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'posva/vim-vue'

let g:useSpace = 1
let g:length = 4
let g:fileMan = 0
let g:resizeMode = 0
let s:back = 232
let s:back2 = 234
let s:back3 = 235
let s:front = 240

function! HelpKey()
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
    echo "F10 ......... Find all TODO in project"
    echo "F11 ......... Toggle spell check"
    echo "F12 ......... Generate doc for a function"
    " echo "F11 ......... Acitve Jqplay"
    " echo "F12 ......... Deactive Jqplay with JqplayClose!"
endfun

function! ToggleExpandTab()
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

function! ToggleLength()
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

function! ToggleFileManager()
    if g:fileMan == 0
        let g:fileMan = 1
        exe "Lex | vertical resize 30"
    else
        let g:fileMan = 0
        exe "Lex"
    endif
endfun

function! JsonPretty(is_selection) range
    if !executable('jq')
        echohl ErrorMsg | echo "jq is not installed" | echohl None | return
    endif

    silent exe a:is_selection ? "'<,'>!jq ." : "%!jq ."
endfun

function! XmlPretty(is_selection) range
    if !executable('xmllint')
        echohl ErrorMsg | echo "xmllint is not installed" | echohl None | return
    endif

    silent exe a:is_selection ? "'<,'>!xmllint --format -" : "%!xmllint --format -"
endfun

function! ResizeMode()
    if g:resizeMode == 0
        let g:resizeMode = 1
        map j <C-w>5<
        map k <C-w>5-
        map l <C-w>5+
        map m <C-w>5>
        map <silent> <esc> :ResizeMode<cr>
        echo "-- RESIZE --"
    else
        let g:resizeMode = 0
        map j <Left>
        map k <Down>
        map l <Up>
        map m <Right>
        unmap <esc>
        echo ""
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
command! AsyncRunMdpdf :AsyncRun echo % | entr -n mdpdf % --style="$HOME/.script/github-style.css"
command! RunMdpdf :!mdpdf % --style="$HOME/.script/github-style.css"
command Sudow :w !sudo tee % >/dev/null
command -range JsonPretty <line1>,<line2>call JsonPretty(<range>)
command -range XmlPretty <line1>,<line2>call XmlPretty(<range>)
command -nargs=1 Fls :filter /<args>/ ls
command ResizeMode call ResizeMode()
command -nargs=* ManCht :vertical terminal bash -c "~/.script/vimcht <args>"
command -nargs=* ManJS :vertical terminal bash -c "~/.script/vimcht javascript <args>"

" for i in range(97,122)
"     let c = nr2char(i)
"     " exec "map \e".c." <M-".c.">"
" endfor

let mapleader = " "
filetype plugin indent on
syntax on
set nocompatible
set nu
set rnu
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
" set statusline+=%{gutentags#statusline()}
set encoding=UTF-8
set wildignore+=*/node_modules/*,*/.git/*,*/build/*,*/dist/*
set keywordprg=:Man
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
" set completeopt=menuone,noinsert,noselect,popuphidden
" set completepopup=highlight:Pmenu,border:off

autocmd FileType javascript set makeprg=npm\ run\ test
autocmd FileType javascript set keywordprg=:ManCht\ javascript
autocmd FileType typescript set makeprg=npm\ run\ build
autocmd FileType cs set makeprg=dotnet\ build

" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END

nmap <C-i> :bp<CR>
nmap <C-o> :bn<CR>
nmap <C-h> :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <C-k> :tabp<CR>
nmap <C-l> :tabn<CR>
nmap <C-j> [s
nmap <C-m> ]s
nmap <C-p> :find<space>

nmap <leader>j :Prettier<CR>
nmap <leader>k :nohlsearch<CR>
nmap <leader>l :bel term<CR>
nmap <leader>L :vert rightb term<CR>
nmap <leader>n :Vifm<CR>
nmap <leader>m :call cursor(0, getpos(".")[2] + (len(expand("<cword>"))/2))<CR>
nmap <leader>o :Copilot panel<CR>
nmap <leader>f :ToggleFileManager<CR>
nmap <leader>u :UndotreeToggle<CR>
nmap <leader>z zfiB<CR>
nmap <leader>r :ResizeMode<CR>
nmap <leader>i :b #<CR>

nmap <leader>ss z=
nmap <leader>sf :set spelllang=fr<CR>
nmap <leader>se :set spelllang=en<CR>

nmap <leader>Jp :Jqplay<CR>
nmap <leader>Jc :JqplayClose!<CR>

nmap <leader>ga :Git add
nmap <leader>gaa :Git add --all<CR>
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
nmap <leader>gbr :Git branch
nmap <leader>gbl :Git blame<CR>

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
nmap <F2> :Ack!<space>
nmap <F3> :AckFromSearch!<CR>
nmap <F4> :UltiSnipsEdit<CR>
nmap <F5> :source ~/.vimrc<CR>
nmap <F6> :ToggleExpandTab<CR>
nmap <F7> :ToggleLength<CR>
nmap <F8> :ALEToggleBuffer<CR>
nmap <F9> :Ack! "<<<<<<< HEAD"<CR>
nmap <F10> :Ack! TODO<CR>
nmap <F11> :set spell!<CR>
let g:doge_mapping="<F12>"

noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j
noremap <C-w>l <C-w>k
noremap <C-w>m <C-w>l

noremap <C-w>J <C-w>H
noremap <C-w>K <C-w>J
noremap <C-w>L <C-w>K
noremap <C-w>M <C-w>L

tnoremap <C-w>j <C-w>h
tnoremap <C-w>k <C-w>j
tnoremap <C-w>l <C-w>k
tnoremap <C-w>m <C-w>l

tnoremap <C-w>J <C-w>H
tnoremap <C-w>K <C-w>J
tnoremap <C-w>L <C-w>K
tnoremap <C-w>M <C-w>L

map j <Left>
map k <Down>
map l <Up>
map m <Right>

map gk g<Down>
map gl g<Up>

let g:ctrlp_custom_ignore = {
    \'dir':  '\v(\.git|node_modules|build|dist)$',
    \'file': '\v\.(swp|o|so)$',
\}
let g:gutentags_ctags_exclude = [
    \'node_modules',
    \'build',
    \'dist',
    \'vendor'
\]

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
    \'scss': ['stylelint'],
    \'go': ['golint', 'gofmt', 'govet']
\}

let g:go_list_type = "quickfix"

let g:undotree_WindowLayout = 3

let g:ackprg = "ag --vimgrep"
set grepprg=ag\ --vimgrep
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme="codedark"

let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-n>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:doge_mapping_comment_jump_forward = "<c-l>"
let g:doge_mapping_comment_jump_backward = "<c-k>"

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:ft_man_open_mode = 'vert'

let g:vim_http_split_vertically = 1
let g:vim_http_tempbuffer = 1

" let g:vimwiki_list = [{'path': '~/Documents/Note/', 'syntax': 'markdown', 'ext': 'md'}]
" let g:vimwiki_ext2syntax = {}

colorscheme codedark
exe "highlight Normal ctermbg="..s:back
exe "highlight NonText ctermbg="..s:back
exe "highlight EndOfBuffer ctermbg="..s:back
exe "highlight CursorLine ctermbg="..s:back2
exe "highlight CursorColumn ctermbg="..s:back2
exe "highlight VertSplit ctermbg="..s:back3.." ctermfg="..s:front
exe "highlight LineNr ctermbg="..s:back
exe "highlight CursorLineNr ctermbg="..s:back.." cterm=bold"
highlight ModeMsg ctermbg=NONE
highlight! link MoreMsg ModeMsg
highlight Error ctermbg=NONE cterm=NONE
highlight! link ErrorMsg Error
highlight! link SpellBad Error
highlight WarningMsg ctermbg=NONE
highlight Question ctermbg=NONE
highlight SpecialKey ctermfg=237
highlight Visual ctermfg=NONE ctermbg=239
highlight ALEErrorSign ctermfg=red ctermbg=NONE
highlight ALEWarningSign ctermfg=yellow ctermbg=NONE
highlight ALEError ctermfg=red ctermbg=NONE
highlight ALEWarning ctermfg=yellow ctermbg=NONE
highlight ALEVirtualTextError ctermfg=red ctermbg=NONE
highlight ALEVirtualTextWarning ctermfg=yellow ctermbg=NONE
highlight SignColumn ctermbg=NONE ctermfg=NONE
highlight Folded ctermfg=188 cterm=NONE
" highlight VimwikiHeader1 ctermfg=39 ctermbg=NONE cterm=bold
" highlight VimwikiHeader2 ctermfg=39 ctermbg=NONE cterm=bold
" highlight VimwikiHeader3 ctermfg=39 ctermbg=NONE cterm=bold
" highlight VimwikiHeader4 ctermfg=39 ctermbg=NONE cterm=bold
" highlight VimwikiHeader5 ctermfg=39 ctermbg=NONE cterm=bold
" highlight VimwikiHeader6 ctermfg=39 ctermbg=NONE cterm=bold
