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
Plug 'itchyny/lightline.vim'

"I'm sure it does something nice
Plug 'christoomey/vim-tmux-navigator'

"Very useful
Plug 'lervag/vimtex'

"Eh I barely use this, fzf is much better
Plug 'preservim/nerdtree'

"Syntax thing. eh, dont need it rn
"Plug 'sheerun/vim-polyglot'

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
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug

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
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"nnoremap <leader>c :call closebuffer()<cr>
nnoremap H 0
nnoremap L $
"nnoremap <leader>c get buffer name, switch buffer, close prev buffer
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
    autocmd FileType fortran :iabbrev <buffer> program <esc>:set autoindent <cr>Amodule<cr><cr>implicit none<cr><cr>end module<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> function <esc>:set autoindent <cr>Afunction<cr><cr>implicit none<cr><cr>end function<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> fct <esc>:set autoindent <cr>Afunction<cr><cr>implicit none<cr><cr>end function<esc>:set noautoindent <cr>kkkkA
    autocmd FileType fortran :iabbrev <buffer> int integer ::
    autocmd FileType fortran :iabbrev <buffer> lg logical ::
    autocmd FileType fortran :iabbrev <buffer> real real ::
    autocmd FileType fortran :iabbrev <buffer> rd real, dimension() :: <esc>F)i
    autocmd FileType fortran :iabbrev <buffer> ra real, allocatable :: 
    autocmd FileType fortran nnoremap <buffer> <TAB> >>
    autocmd FileType fortran vnoremap <buffer> ( c()<esc>P
    "autocmd FileType fortran vnoremap <buffer> do cdo<esc>jP
    autocmd FileType fortran :iabbrev <buffer> ( ()<esc>i
augroup END
"}}}

"SBatch (PBS) / Shell (sh) {{{

augroup filetype_pbs

    autocmd!
    autocmd FileType sh :nnoremap <buffer> c I#<esc>$
    autocmd FileType sh :nnoremap <buffer> C I#<esc>$


augroup END 

"}}}

"LSP {{{

"if executable('pylsp')
    " pip install python-lsp-server
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pylsp',
        "\ 'cmd': {server_info->['pylsp']},
        "\ 'allowlist': ['python'],
        "\ })
"endif

"if (executable('fortls'))
	    "au User lsp_setup call lsp#register_server({
		"\ 'name': 'fortls',
		"\ 'cmd': {'fortls', '--lowercase_instrinsics', '--hover_signature', '--hover_language=fortran', '--use_signature_help'} 
		"\ 'allowlist': ['fortran']
		"\ })
	"endif

"function! s:on_lsp_buffer_enabled() abort
    "setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    "if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> gs <plug>(lsp-document-symbol-search)
    "nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "nmap <buffer> gr <plug>(lsp-references)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    "nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    "nmap <buffer> K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    "let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
"endfunction

"augroup lsp_install
    "au!
    "" call s:on_lsp_buffer_enabled only for languages that has the server registered.
    "autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

" allow modifying the completeopt variable, or it will
" be overridden all the time
"let g:asyncomplete_auto_completeopt = 0

"set completeopt=menuone,noinsert,noselect,preview

"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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
set autoread
set hlsearch incsearch
set clipboard^=unnamedplus

set cursorline
set number 

set background=dark
filetype indent off
syntax on
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


