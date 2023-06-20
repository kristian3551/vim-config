source $VIMRUNTIME/defaults.vim

set spell spelllang=en_us
filetype plugin indent on
syntax enable

set noswapfile
set expandtab
set tabstop=4
set shiftwidth=4

set encoding=utf-8
set relativenumber

set scroll=8
set scrolloff=8

set hlsearch
set splitbelow

set wrap
set linebreak

let mapleader = '.'

set foldmethod=syntax
set foldlevel=99

set clipboard=unnamed,unnamedplus

set wildmenu
set wildmode=list:longest,full

call plug#begin()

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/everforest'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'xianzhon/vim-code-runner'
Plug 'preservim/tagbar'
Plug 'romainl/vim-cool'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'morhetz/gruvbox'
Plug 'kristian3551/cppsnippets'
Plug 'https://github.com/vantreeseba/coc-haxe.git'

call plug#end()

" CoC options
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> D :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

set statusline^=%{coc#status()}
autocmd User CocStatusChange redrawstatus

let g:cool_total_matches = 1

" Everforest colorscheme options.
if has('termguicolors')
    set termguicolors     
endif

set t_Co=256
set background=dark

let g:everforest_transparent_background = 1
let g:everforest_enable_italic          = 1
let g:everforest_background             = 'hard'
let g:everforest_better_performance     = 1

colorscheme gruvbox

let g:airline_theme                     = 'everforest'
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Enter visual mode when clicking with the mouse.
set mouse=a
set ttymouse=sgr

" Code runner options
nmap <silent> <leader>r <plug>CodeRunner
let g:code_runner_save_before_execute = 1

" Multiline cursor options.
execute "set <M-m>=\em"
let g:multi_cursor_start_word_key = "<M-m>"
execute "set <M-m>=\em"
let g:multi_cursor_next_key       = "<M-m>"
let g:multi_cursor_quit_key       = '<Esc>'

" Cursor layout options 
let &t_SI = "\e[5 q" " thin cursor on insert mode
let &t_EI = "\e[1 q" " block on normal mode

" Mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>

nnoremap <leader>t :TagbarToggle<CR>

nnoremap <silent> C :Commentary<CR>
vnoremap <silent> C :CommentMultiline<cr>

command! -range CommentMultiline call CommentMultiline(<line1>, <line2>)

function! CommentMultiline(line1, line2)
    exe a:line1 .. ',' .. a:line2 .. 'Commentary'
endfunction

nnoremap <C-l> gt<CR>
nnoremap <C-h> gT<CR>
nnoremap <C-b> :bnext<CR>

execute "set <M-j>=\ej"
nnoremap <M-j> :m+<CR>
execute "set <M-k>=\ek"
nnoremap <M-k> :m -2<CR>

nnoremap <tab> >>
nnoremap <S-tab> <<

" nnoremap <leader>f magg=G`a

nnoremap H :shell<CR>

nnoremap j gj
nnoremap k gk
nnoremap J 5gj<CR>
nnoremap K 5gk<CR>

nnoremap <silent> <Up> :resize -3<cr>
nnoremap <silent> <Down> :resize +3<cr>
nnoremap <silent> <Right> :vertical resize +3<cr>
nnoremap <silent> <Left> :vertical resize -3<cr>

nnoremap S :w<CR>
nnoremap Q :q<cr>

inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap ! :source %<cr>

set langmap=
            \АA,БB,ЦC,ДD,ЕE,ФF,ГG,ХH,ИI,ЙJ,КK,ЛL,МM,НN,ОO,ПP,ЯQ,РR,СS,ТT,УU,ЖV,ВW,ѝX,ЪY,ЗZ,
            \аa,бb,цc,дd,еe,фf,гg,хh,иi,йj,кk,лl,мm,нn,оo,пp,яq,рr,сs,тt,уu,жv,вw,ьx,ъy,зz,
            \Ч~,Ш{,Щ},
            \ч`,ш[,щ],

            map Й J
map К K

map Я Q<cr>
map С S<cr>
