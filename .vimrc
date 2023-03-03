syntax on

set number
set tabstop=4
set expandtab
set encoding=utf-8

let mapleader = '.'

set wrap
set linebreak
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

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Everforest colorscheme options.
if has('termguicolors')
    set termguicolors
endif

set background=dark

let g:everforest_transparent_background = 1

let g:everforest_background = 'hard'
let g:everforest_better_performance = 1

let g:airline_theme = 'everforest'

colorscheme everforest

" Enter visual mode when clicking with the mouse.
" set mouse=a
" set ttymouse=sgr

" Multiline cursor options.
let g:multi_cursor_start_word_key = '<C-o>'
let g:multi_cursor_next_key       = '<C-o>'
let g:multi_cursor_quit_key       = '<Esc>'

" Mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <leader>t :bnext<CR>
nnoremap <leader>c :Commentary<CR>
nnoremap <C-t> :TagbarToggle<CR>
