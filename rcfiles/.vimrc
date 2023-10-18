call plug#begin()

Plug 'joshdick/onedark.vim' 

Plug 'itchyny/lightline.vim'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()


let mapleader=" "
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>p :PlugInstall<CR>

set mouse=a
set encoding=UTF-8
set ignorecase
set smartcase
set linebreak
set tabstop=4
set shiftwidth=4
set expandtab

set cursorline
set number relativenumber

set background=dark
filetype indent off
syntax enable

"Color Scheme
let g:lightline = {
\ 'colorscheme': 'onedark',
\}
colorscheme onedark

"Lightline Settings
set laststatus=2
set noshowmode

"Transparency
hi Normal guibg=NONE ctermbg=NONE
