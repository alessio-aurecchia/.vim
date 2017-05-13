" ====  VUNDLE  ===============================================================

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'nanotech/jellybeans.vim'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dominikduda/vim_current_word'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'


call plug#end()
filetype plugin indent on


" ====  BEHAVIOUR  ============================================================

if has("multi_byte") " Enable UTF-8 supportw

    if &termencoding == ""
        let &termencoding = &encoding
    endif

    set encoding=utf-8
    setglobal fileencoding=utf-8 bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif

" Buffers can exist in background
set hidden

" Enable spell check
set spelllang=en

" 15 line offset when scrolling
set scrolloff=15

" Save when switching focus
au FocusLost * silent! :wa

" Automatically change directory on file open
set autochdir

" Reload file when changed on disk
set autoread

" Enable mouse usage (all modes)
set mouse=a

" sudo save file with w!
cmap w!! %!sudo tee > /dev/null %

" Always show status line
set laststatus=2

" ====  REMAPS  ===============================================================

" no more shift holding for :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Leader on ,
let mapleader = ","

" move by screen lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" reselect after indenting
vnoremap < <gv
vnoremap > >gv

" <leader><space> clears search
nmap <silent> <leader><space> ;nohlsearch<CR> 

" insert a blank line with <leader>o and <leader>O
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>O O<ESC>

" jj as escape
inoremap jj <ESC>
inoremap j; <ESC>:
inoremap kk <ESC>

" use <leader>y and <leader>p to copy and paste from system clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

nnoremap Y y$

" automatically jump to last misspelled word and attempt replacing it
noremap <leader>ss [sz=
noremap <leader>sa [sz=1<cr><cr>

" use regular regex syntax rather than vim regex
nnoremap / /\v
vnoremap / /\v

" Run ctags
map <C-F12> ;!ctags -R .<CR>

" Easy tab creation
nnoremap <Leader>tc :tabc<return>
nnoremap <Leader>tn :tabn<return>
nnoremap <Leader>tp :tabp<return>
nnoremap <Leader>te :tabe<space>

" Move through tabs with C-Tab and C-Shift-Tab
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" Easy navigation for split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Normalize split sizes
au VimResized * exe "normal! \<c-w>="

nnoremap <Leader>qn :cn<CR>
nnoremap <Leader>qp :cp<CR>




" ====  NUMBERING  ============================================================

set cul " Highlight cursor line


" ====  FORMATTING AND INDENTATION  ===========================================

" enable soft word wrap
set formatoptions=l
set lbr

set expandtab
set tabstop=2     " use hard tabs for indentation
set softtabstop=2 " makes backspace treat 4 spaces like a tab
set shiftwidth=2  " makes indents 4 spaces wide as well


" ====  SEARCH AND MATCHES  ===================================================

set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching

set incsearch          " incremental search
set hlsearch           " highlights searches

set noerrorbells       " Suppress error bell


" ====  HISTORY AND SWAP  =====================================================

" save more in undo history
set history=1000

" keep a persistent backup file
if v:version >= 703
    set undofile
    set undodir=$TEMP
endif

" Disable swap files
set nobackup
set nowritebackup
set noswapfile


" ====  SYNTAX HIGHLIGHTING AND INDENTATION  ==================================

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set autoindent  " Always indent
set copyindent  " Copy previous indent
set smartindent

" Backspace over everything in insert mode
set backspace=indent,eol,start

" Show invisibles
set list
set listchars=tab:→\ ,trail:•
set showbreak=↪\ 
set fillchars+=vert:▌

set tw=80
set fo+=t

" ====  AUTOCOMPLETION  =======================================================

set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~

" Longer more descriptive auto-complete prompts
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete


" ====  COLOR  ================================================================

set t_Co=256

let g:jellybeans_use_term_italics = 1

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', 'guibg': 'none' },
\    'VertSplit': { 'guifg': '262626', 'guibg': '151515',
\                   'ctermfg': '262626', 'ctermbg': 'none' },
\    'FoldColumn': { 'guifg': '535D66', 'guibg': 'none',
\                   'ctermfg': '535D66', 'ctermbg': 'none' },
\    'SignColumn': { 'guifg': '777777', 'guibg': '101010',
\                   'ctermfg': '777777', 'ctermbg': '101010' },
\    'ColorColumn': { 'guifg': '', 'guibg': '101010',
\                   'ctermfg': '', 'ctermbg': '101010' }
\}

colorscheme jellybeans
set background=dark

" change the color of column 80
set colorcolumn=80

augroup scala
  autocmd!
  autocmd Filetype scala set colorcolumn=120
augroup END


" ====  PLUGIN CONFIG  ========================================================

" Syntastic
let g:syntastic_error_symbol = 'E!'
let g:syntastic_style_error_symbol = '~~'
let g:syntastic_warning_symbol = 'W!'
let g:syntastic_style_warning_symbol = '~~'
let g:syntastic_python_flake8_args='--ignore=F841'


let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java', 'cpp', 'cs', 'scala']
let g:markdown_syntax_conceal = 0

" Python: Better syntax highlighting
let python_highlight_all = 1

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~20%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:airline_theme='powerlineish'

function! NrBufs()
    let i = bufnr('$')
    let j = 0
    while i >= 1
        if buflisted(i)
            let j+=1
        endif
        let i-=1
    endwhile
    return j
endfunction

" set statusline=
" set statusline+=%(%{'help'!=&filetype?(bufnr('%')):''}\/%)
" set statusline+=%(%{'help'!=&filetype?(NrBufs()):''}\ >\ %)
" set statusline+=%< " Where to truncate line
" set statusline+=%1*%f%* " Path to the file in the buffer, as typed or relative to current directory
" set statusline+=\ %m
" set statusline+=\ %r
" set statusline+=%= " Separation point between left and right aligned items
" set statusline+=\ %{''!=#&filetype?&filetype:'none'}
" set statusline+=%(\ <%{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'')
"   \.('unix'!=#&fileformat?'\ '.&fileformat:'')}%)
" set statusline+=\ <
" set statusline+=\ %3l:%v " Virtual column number

" hi User1 cterm=bold ctermfg=233 ctermbg=253 gui=italic guifg=#000000 guibg=#dddddd




 " ============================================================================
" File:        statline.vim
" Maintainer:  Miller Medeiros <http://blog.millermedeiros.com/>
" Description: Add useful info to the statusline and basic error checking.
" Last Change: 2011-11-10
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================


" using link instead of named highlight group inside the statusline to make it
" easier to customize, reseting the User[n] highlight will remove the link.
" Another benefit is that colors will adapt to colorscheme.

"filename
hi default link User1 Statement
" hi User1 cterm=bold ctermfg=233 ctermbg=253 gui=bold guifg=#8197bf guibg=#dddddd
" hi User1 cterm=bold ctermfg=233 ctermbg=253 gui=bold guifg=#8197bf guibg=#dddddd
" flags
hi default link User2 Identifier
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special



" ====== basic info ======

" ---- number of buffers : buffer number ----

function! StatlineBufCount()
    if !exists("s:statline_n_buffers")
        let s:statline_n_buffers = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
    endif
    return s:statline_n_buffers
endfunction

if !exists('g:statline_show_n_buffers')
    let g:statline_show_n_buffers = 1
endif

if g:statline_show_n_buffers
    set statusline=\ %n\:%{StatlineBufCount()}\ %<
    " only calculate buffers after adding/removing buffers
    augroup statline_nbuf
        autocmd!
        autocmd BufAdd,BufDelete * unlet! s:statline_n_buffers
    augroup END
else
    set statusline=[%n]\ %<
endif


" ---- filename (relative or tail) ----

if exists('g:statline_filename_relative')
    set statusline+=%1*\ %f\ %*
else
    set statusline+=%1*\ %t\ %*
endif


" ---- flags ----

" (h:help:[help], w:window:[Preview], m:modified:[+][-], r:readonly:[RO])
set statusline+=%2*%h%w%m%r%*


" ---- filetype ----

set statusline+=\ %y


" ---- file format → file encoding ----



" ---- separation between left/right aligned items ----

set statusline+=%=


" ---- current line and column ----

" (-:left align, 14:minwid, l:line, L:nLines, c:column)
set statusline+=%-14(\ %l,%c\ %)

if &encoding == 'utf-8'
    let g:statline_encoding_separator = '→'
else
    let g:statline_encoding_separator = ':'
endif

if !exists('g:statline_show_encoding')
    let g:statline_show_encoding = 1
endif
if !exists('g:statline_no_encoding_string')
    let g:statline_no_encoding_string = 'No Encoding'
endif
if g:statline_show_encoding
    set statusline+=[%{&ff}%{g:statline_encoding_separator}%{strlen(&fenc)?&fenc:g:statline_no_encoding_string}]\ 
endif

" ---- Fugitive ----

if !exists('g:statline_fugitive')
    let g:statline_fugitive = 0
endif
if g:statline_fugitive
    set statusline+=%4*%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
endif


" ---- Syntastic errors ----

if !exists('g:statline_syntastic')
    let g:statline_syntastic = 1
endif
if g:statline_syntastic
    set statusline+=\ %3*%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}%*
endif



" ====== custom errors ======


" based on @scrooloose whitespace flags
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html


" ---- mixed indenting ----

if !exists('g:statline_mixed_indent')
    let g:statline_mixed_indent = 1
endif

if !exists('g:statline_mixed_indent_string')
    let g:statline_mixed_indent_string = '[mix]'
endif

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatlineTabWarning()
    if !exists("b:statline_indent_warning")
        let b:statline_indent_warning = ''

        if !&modifiable
            return b:statline_indent_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statline_indent_warning = g:statline_mixed_indent_string
        elseif (spaces && !&et) || (tabs && &et)
            let b:statline_indent_warning = '[&et]'
        endif
    endif
    return b:statline_indent_warning
endfunction

if g:statline_mixed_indent
    set statusline+=%3*%{StatlineTabWarning()}%*

    " recalculate when idle and after writing
    augroup statline_indent
        autocmd!
        autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
    augroup END
endif


" --- trailing white space ---

if !exists('g:statline_trailing_space')
    let g:statline_trailing_space = 1
endif

function! StatlineTrailingSpaceWarning()
    if !exists("b:statline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statline_trailing_space_warning = '[\s]'
        else
            let b:statline_trailing_space_warning = ''
        endif
    endif
    return b:statline_trailing_space_warning
endfunction

if g:statline_trailing_space
    set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*

    " recalculate when idle, and after saving
    augroup statline_trail
        autocmd!
        autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
    augroup END
endif
