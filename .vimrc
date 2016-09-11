
" ====  VUNDLE  ===============================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()"

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'AutoClose'
Plugin 'Syntastic'
Plugin 'Tabular'
Plugin 'ScrollColors'
Plugin 'vimlatex'
Plugin 'surround.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlp.vim'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'hdima/python-syntax.git'
Plugin 'tpope/vim-fugitive.git'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


" ====  BEHAVIOUR  ============================================================

set shellcmdflag=-ic " Load shell aliases

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


" ====  GVIM  =================================================================

if has('gui_running')
    set guioptions=              " Reset GUI options
    set guioptions-=T            " Disable tool-bar
    set guioptions-=m            " Disable menu-bar
    set guioptions-=r            " Remove right scrollbar
    set guioptions-=l            " Remove left scrollbar

    set guifont=Ubuntu\ Mono\ 12 " Set font

    " Call wmctrl to maximize GVIM on start
    au GUIEnter * silent! :!wmctrl -a :ACTIVE: -b add,fullscreen
endif

" Toggle fullscreen mode
map <F11> ;silent !wmctrl -a :ACTIVE: -b toggle,fullscreen <CR>


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

" use <leader>y and <leader>p to copy and paste from system clipboard
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

" automatically jump to last misspelled word and attempt replacing it
noremap <leader>ss [sz=
noremap <leader>sa [sz=1<cr><cr>

" use regular regex syntax rather than vim regex
nnoremap / /\v
vnoremap / /\v

" Run ctags
map <C-F12> ;!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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


" ====  NUMBERING  ============================================================

set nu  " Show line numbers
set cul " Highlight cursor line


" ====  FORMATTING AND INDENTATION  ===========================================

" enable soft word wrap
set formatoptions=l
set lbr

set expandtab
set tabstop=4     " use hard tabs for indentation
set softtabstop=4 " makes backspace treat 4 spaces like a tab
set shiftwidth=4  " makes indents 4 spaces wide as well


" ====  SEARCH AND MATCHES  ===================================================

set showmatch    " Show matching brackets.
set ignorecase   " Do case insensitive matching
set smartcase    " Do smart case matching

set incsearch    " incremental search
set hlsearch     " highlights searches

set noerrorbells " Suppress error bell


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
set listchars=tab:▸\ ,trail:•
set showbreak=↪\ 


" ====  AUTOCOMPLETION  =======================================================

set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~

" Longer more descriptive auto-complete prompts
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete


" ====  COLOR  ================================================================

set t_Co=256

colorscheme jellybeans
set background=dark

" change the color of column 80
if v:version >= 703
    set colorcolumn=80
endif


" ====  PLUGIN CONFIG  ========================================================

" Syntastic:
" Check for errors immediately
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '!'
let g:syntastic_warning_symbol = '•'

" Check using c/cpp headers
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1

" Pandoc: Disable folds for pandoc
let g:pandoc_no_folding = 1

" Snipmate: set snippets dir
let g:snippets_dir = "/home/auri/.vim/snippets"

" Python: Better syntax highlighting
let python_highlight_all = 1

