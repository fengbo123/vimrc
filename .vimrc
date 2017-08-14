set history=500

filetype on
filetype plugin on
filetype indent on
syntax on

set so=7"scrolloff

"set cursorcolumn
set cursorline

set mouse-=a

set number
set showcmd
set ruler "Always show current position
set showmode

set cmdheight=2 "height of the command bar

set hid "A buffer becomes hiddent when it is abandoned

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "ignore case when searching

set smartcase
set hlsearch
set incsearch

set encoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf8
set ffs=unix,dos,mac "use Unix as the standard file type

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set ai "auto indent
set si "smart indent
set nowrap "not wrap line

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nnoremap <F2> :call HideNumber()<CR>

nnoremap <F3> :set list! list?<CR>

nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on')? 'syn off' : 'syn on'<CR>
