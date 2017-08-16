set history=500


set background=dark

set so=7 "scrolloff

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

function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

nnoremap <F3> :set list! list?<CR>

nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on')? 'syn off' : 'syn on'<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
call vundle#end()

colorscheme molokai

filetype plugin indent on


filetype on
filetype plugin on
filetype indent on
syntax on
