" Colors
syntax enable "enable syntax processing
"set t_Co=16
let g:solarized_termcolors=256
set term=xterm-256color
set background=dark
colorscheme solarized
"colorscheme slate
"set t_Co=256

" Mouse Settings
set mouse=a

" Filetype Detection
filetype on " enable filetype detection
filetype plugin on " enable plugings for specific filetypes

" Spaces and Tabs
set tabstop=4 " number of spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=4 "shift by x with < >
set nowrap " no line wrapping
set autoindent
set smartindent
set bs=2 " allow backspacing over everything in insert mode

" UI Config
set number   " show line numbers
set showcmd  " show prev command in bottom bar
set wildmenu " visual autocomplete for command menu
set ruler    " show the cursor position all the time
set lazyredraw " redraw only when we need to
set showmatch " highlight matching {[()]}
filetype indent on

" Searching
set hlsearch " highlight matches
set incsearch " search as characters are entered
"turn off search highlights with \<space>
nnoremap <leader><space> :nohlsearch<CR> 

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" Backups
set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
set writebackup
set viminfo='20,\"50   " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50  " keep 50 lines of command line history

" Split Setting
set splitbelow
set splitright

" Custom Filetypes
au BufNewFile,BufRead *.ocn set filetype=lisp
au BufNewFile,BufRead *.il set filetype=lisp
au BufNewFile,BufRead *.scs set filetype=scs
au BufNewFile,BufRead *.mdl set filetype=mdl
au BufNewFile,BufRead *.lib set filetype=python

"setup for Vim Latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_ViewRule_dvi='evince'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat = 'pdf'
