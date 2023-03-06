syntax on
set spell spelllang=en_us

set expandtab
set tabstop=4
set number

set encoding=utf-8

set scroll=8
set scrolloff=8

set hlsearch

set wrap
set linebreak

let mapleader = '.'

set foldmethod=indent
set foldlevel=99
" set foldclose=all

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

call plug#end()

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
let g:multi_cursor_start_word_key = "<C-o>"
let g:multi_cursor_next_key       = "<C-o>"
let g:multi_cursor_quit_key       = '<Esc>'

" Cursor layout options 
let &t_SI = "\e[5 q" " thin cursor on insert mode
let &t_EI = "\e[1 q" " block on normal mode

nnoremap <C-l> gt<CR>
nnoremap <C-h> gT<CR>
nnoremap <C-t> :tabnew<CR>


" Mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <leader>c :Commentary<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <C-j> :m+<CR>
nnoremap <C-k> :m -2<CR>
nnoremap <leader>` :term<CR>

" put a matching quote/bracket when in insert mode
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
