"File: vimrc
"Author: Dante Buhl
"Email: dbuhl@ucsc.edu

"This is my .vimrc file, it gives me some nice fortran tools and autocompletion
"Notice that some of my binds overwrite others. For example, pressing c in
"normal mode will usually comment out at the first non-white space character
"and C will uncomment (delete the first nonwhite space character)


"Plugins {{{
call plug#begin()

"Colorscheme plugins
"Plug 'sainnhe/everforest'
"Plug 'andreasvc/vim-256noir'
"Plug fcpg/vim-fahrenheit'
"Plug 'catppuccin/vim', {'as': 'catppuccin'}
"Plug 'Rigellute/shades-of-purple.vim'
"If you can't tell onedark is my favorite
"I'm currenly using the onehalfdark, but I was using onedark for a long time
Plug 'joshdick/onedark.vim' 
Plug 'sonph/onehalf', {'rtp': 'vim'}

"Oh yeah
"This can be further customized by coc.nvim
Plug 'itchyny/lightline.vim'

"I'm sure it does something nice
Plug 'christoomey/vim-tmux-navigator'

"Very useful
Plug 'lervag/vimtex'

"Eh I barely use this, fzf is much better
Plug 'preservim/nerdtree'

"I have configurated this repo a lot! So much so that I made my own custom
"command laying in the fzf.vim/plugin/fzf.vim file
"The command goes in line 57, after the function :Files is defined, this
"function calls ripgrep in order to supply the fzf find
"\'command!      -bang -nargs=* SFiles                           call fzf#run(fzf#wrap({"source": "rg ~ --files --hidden -g \"!*.o\" -g \"!*.mod\" -g \"!*.pdf\" ".fzf#shellescape(<q-args>), "options": "--multi -i --preview \"bat --color=always --style=numbers --line-range=:500 {}\""}), fzf#vim#with_preview(), <bang>0)',
"This function is used by one of my main vim binds, <leader>f, calls a fuzzy
"find and will open a new buffer based off of the result
"If you delete these two lines, I stop breathing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"I haven't gotten any of them working :/
"LSP Plugins
"Be sure to update the CocConfig file for fortls and semanticHighlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nnoremap <leader>c :CocConfig<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap H 0
nnoremap L $
"}}}

"Functions {{{

"This is from the Coc.nvim documentation
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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

"Tmux {{{
augroup filetype_tmux
    autocmd!
    autocmd FileType tmux nnoremap c I#<esc>$
    autocmd FileType tmux nnoremap C ^x<esc>$
    autocmd FileType tmux nnoremap - ddp
    autocmd FileType tmux nnoremap _ ddkkp
    autocmd FileType tmux set tabstop=4
    autocmd FileType tmux set shiftwidth=4
augroup END
"}}}

"LaTeX {{{
augroup filetype_tex
    autocmd!
    autocmd FileType tex nnoremap c I%<esc>$
    autocmd FileType tex nnoremap C ^x<esc>$
    autocmd FileType tex nnoremap - ddp
    autocmd FileType tex nnoremap _ ddkkp
    autocmd FileType tex set autoindent
augroup END
"}}}

"Python {{{
"I don't really use python that much, but if I ever do again this will get
"longer trust me
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
    autocmd FileType fortran :iabbrev <buffer> do <esc>:set autoindent <cr>Ado<cr><cr>end do <esc>:set noautoindent <cr>kkA
    autocmd FileType fortran :iabbrev <buffer> sr <esc>:set autoindent <cr>Asubroutine<cr><cr>implicit none<cr><cr>end subroutine <esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> subroutine <esc>:set autoindent <cr>Asubroutine<cr><cr>implicit none<cr><cr>end subroutine <esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> module <esc>:set autoindent <cr>Amodule<cr><cr>implicit none<cr><cr>end module<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> md <esc>:set autoindent <cr>Amodule<cr><cr>implicit none<cr><cr>end module<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> pg <esc>:set autoindent <cr>Aprogram<cr><cr>implicit none<cr><cr>end program<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> program <esc>:set autoindent <cr>Aprogram<cr><cr>implicit none<cr><cr>end program<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> function <esc>:set autoindent <cr>Afunction<cr><cr>implicit none<cr><cr>end function<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> fct <esc>:set autoindent <cr>Afunction<cr><cr>implicit none<cr><cr>end function<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> int integer ::
    autocmd FileType fortran :iabbrev <buffer> lg logical ::
    autocmd FileType fortran :iabbrev <buffer> real real ::
    autocmd FileType fortran :iabbrev <buffer> rd real, dimension() :: <esc>F)i
    autocmd FileType fortran :iabbrev <buffer> ra real, allocatable :: 
    autocmd FileType fortran nnoremap <buffer> <TAB> >>
    autocmd FileType fortran vnoremap <buffer> ( c()<esc>P
    "autocmd FileType fortran :iabbrev <buffer> ( ()<esc>i
    autocmd FileType fortran setlocal textwidth=80
    autocmd FileType fortran setlocal tabstop=2
    autocmd FileType fortran setlocal shiftwidth=2
augroup END
"}}}

"Make {{{
augroup filetype_make
    autocmd!
    autocmd FileType make nnoremap c I#<esc>$
    autocmd FileType make nnoremap C ^x<esc>$
    autocmd FileType make nnoremap - ddp
    autocmd FileType make nnoremap _ ddkkp
augroup END
"}}}

"SBatch (PBS) / Shell (sh) {{{
"I don't do shell script editting all that much so this is not the most used. 
augroup filetype_pbs
    autocmd!
    autocmd FileType sh :nnoremap <buffer> c I#<esc>$
    autocmd FileType sh :nnoremap <buffer> C I#<esc>$
augroup END 

"}}}

"LSP {{{

"Some of the Coc Config file contains LSP configuration options. This section is to adjust binds and vim functions that utilize the LSP

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Use tab to refresh the list
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
"Press shift+k in order to show documentation for a function
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)


"Use Tab / Shift+Tab in order to navigate the dropdown
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"Use <CR> in order to select an option from the LSP dropdown
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"}}}

"General Settings {{{
set updatetime=300
set mouse=a
set encoding=UTF-8
set ignorecase
set smartcase
set linebreak
set tabstop=4
set shiftwidth=4
set expandtab
set autoread
set hlsearch incsearch
set clipboard^=unnamedplus

set cursorline
set number 
set signcolumn=yes

set background=dark
filetype indent off
syntax on
syntax enable
set t_Co=256


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Color Scheme
"if you switch color themes check the themes github to see if they have
"lightline support
let g:lightline = {
\ 'colorscheme': 'onehalfdark',
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
colorscheme onehalfdark

"Lightline Settings
set laststatus=2
set noshowmode

"Transparency
hi Normal guibg=NONE ctermbg=NONE

"Note: in the onehalfdark/vim/colors/onehalfdark.vim
    "set s:h("CursorLineNr, "", s:cursor_line, "", )
    "set s:h("LineNr, s:fg, "", "")
"highlight CursorLineNr 'cterm={"cterm": "188"}'
"highlight LineNr ctermbg=NONE ctermfg=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE

"}}}


