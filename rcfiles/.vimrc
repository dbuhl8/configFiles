"File: vimrc
"Author: Dante Buhl
"Email: dbuhl@ucsc.edu

"This is my .vimrc file, it gives me some nice fortran tools and autocompletion
"Notice that some of my binds overwrite others. For example, pressing c in
"normal mode will usually comment out at the first non-white space character
"and C will uncomment (delete the first nonwhite space character)


"Plugins {{{
call plug#begin()

Plug 'joshdick/onedark.vim' 

Plug 'itchyny/lightline.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'lervag/vimtex'

Plug 'preservim/nerdtree'

"Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
"}}}

"General Binds {{{
let mapleader=" "
let maplocalleader="\\"
nnoremap <leader>s :w<CR>
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>p :PlugInstall<CR>
nnoremap <leader>u :PlugUpdate<CR>
nnoremap <leader>f :SFiles<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>v :vsplit<CR>
"}}}

"Vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap c I"<esc>$
    autocmd FileType vim nnoremap C ^x<esc>$
    autocmd FileType vim nnoremap - ddp
    autocmd FileType vim nnoremap _ ddkkp
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"Python {{{
augroup filetype_python
    autocmd!
    autocmd FileType python :nnoremap <buffer> c I#<esc>$
augroup END
"}}}

"Fortran {{{
augroup filetype_fortran 
    autocmd!
    autocmd FileType fortran nnoremap <buffer> c I!<esc>$
    autocmd FileType fortran nnoremap <buffer> C ^x$
    autocmd FileType fortran :iabbrev <buffer> if <esc>:set autoindent <cr>Aif () then<cr><cr>end if <esc>:set noautoindent <cr>kk$F)i
    autocmd FileType fortran :iabbrev <buffer> do <esc>:set autoindent <cr>Ado <cr><cr>end do <esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> sr <esc>:set autoindent <cr>Asubroutine<cr><cr>end subroutine <esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> subroutine <esc>:set autoindent <cr>Asubroutine<cr><cr>end subroutine <esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> module <esc>:set autoindent <cr>Amodule<cr><cr>end module<esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> md <esc>:set autoindent <cr>Amodule<cr><cr>end module<esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> pg <esc>:set autoindent <cr>Aprogram<cr><cr>end program<esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> program <esc>:set autoindent <cr>Amodule<cr><cr>end module<esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> function <esc>:set autoindent <cr>Afunction<cr><cr>end function<esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> fct <esc>:set autoindent <cr>Afunction<cr><cr>end function<esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> int integer ::
    autocmd FileType fortran :iabbrev <buffer> real real ::
    autocmd FileType fortran :iabbrev <buffer> rd real, dimension() :: <esc>F)i
    autocmd FileType fortran nnoremap <buffer> <TAB> >>
    autocmd FileType fortran vnoremap <buffer> <TAB> >>
    autocmd FileType fortran :iabbrev <buffer> ( ()<esc>i
    "autocmd FileType fortran let fortran_fold=1
    "autocmd FileType fortran setlocal foldmethod=syntax
augroup END
"}}}

"General Settings {{{
set mouse=a
set encoding=UTF-8
set ignorecase
set smartcase
set linebreak
set tabstop=4
set shiftwidth=4
set expandtab

set cursorline
set number 

set background=dark
"let fortran_free_source=1
filetype indent off
syntax enable

"Color Scheme
let g:lightline = {
\ 'colorscheme': 'onedark',
\}
let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }
colorscheme onedark

"Lightline Settings
set laststatus=2
set noshowmode

"Transparency
hi Normal guibg=NONE ctermbg=NONE

"}}}




