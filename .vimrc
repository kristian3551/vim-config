source $VIMRUNTIME/defaults.vim

set spell spelllang=en_us
filetype plugin indent on
syntax on

set noswapfile

set expandtab
set tabstop=2
set encoding=utf-8
set relativenumber

set scroll=8
set scrolloff=8

set hlsearch
set splitbelow

set wrap
set linebreak

let mapleader = '.'

set foldmethod=indent
set foldlevel=99

set clipboard=unnamed,unnamedplus

set wildmenu
set wildmode=list:longest,full

" Plugins will be downloaded under the specified directory.
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
Plug 'preservim/tagbar'
Plug 'romainl/vim-cool'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

call plug#end()

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

set background=light

let g:everforest_transparent_background = 1
let g:everforest_enable_italic          = 1
let g:everforest_background             = 'soft'
let g:everforest_better_performance     = 1
let g:airline_theme                     = 'everforest'

colorscheme everforest

" Enter visual mode when clicking with the mouse.
set mouse=a
set ttymouse=sgr

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

nnoremap <leader>c :Commentary<CR>

nnoremap <C-l> gt<CR>
nnoremap <C-h> gT<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-b> :bnext<CR>
nnoremap <S-f> za<CR>

execute "set <M-j>=\ej"
nnoremap <M-j> :m+<CR>
execute "set <M-k>=\ek"
nnoremap <M-k> :m -2<CR>

nnoremap <leader>` :term<CR>

nnoremap j gj
nnoremap k gk
nnoremap J 5gj<CR>
nnoremap K 5gk<CR>

nnoremap <S-s> :w<CR>
nnoremap <C-w> :wq<CR>
nnoremap <S-q> :q!<CR>
