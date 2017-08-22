source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    
    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

" }

filetype off
set rtp+=c:/opt/Vim/vimfiles/bundle/Vundle.vim/
call vundle#begin('c:/opt/Vim/vimfiles/bundle/')

Plugin 'flazz/vim-colorschemes'
" Plugin 'rakr/vim-one'

Plugin 'Raimondi/delimitMate'

Plugin 'tpope/vim-surround'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plugin 'scrooloose/nerdtree'
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Plugin 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_console_startup=1
" let g:nerdtree_tabs_smart_startup_focus=1

Plugin 'mattn/emmet-vim'
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_expandabbr_key = '<Tab>'

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'

call vundle#end()


filetype indent plugin on

filetype on
filetype plugin on
filetype indent on
syntax on

set history=1000

set background=dark
" colorscheme molokai

colorscheme solarized
" set background=light


set so=5
set cursorline
set mouse-=a

set number
set showcmd
set ruler
set showcmd

set visualbell
set autoread

set cmdheight=2

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase

set smartcase
set hlsearch
set incsearch

set wildmenu
" set wildmenu=full

set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set langmenu=en_US
let $LANG='en_US.UTF-8'

set termencoding=utf8
set ffs=unix,dos,mac "use Unix as the standard file type

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set ai
set si
set nowrap

let mapleader = ","
let g:mapleader = ","

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

" set cnoremap <C-p> <Up> "have some problems
" set cnoremap <C-n> <Down>
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction




" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        " if !exists("g:spf13_no_big_font")
            if LINUX() && has("gui_running")
                set guifont=Consolas\ Regular\ 11
            elseif OSX() && has("gui_running")
                set guifont=Consolas\ Regular:h11
            elseif WINDOWS() && has("gui_running")
                set guifont=Consolas:h11
                "  Source_Code_Pro_Medium:h12
                "  Monaco:h11
                "  Courier_New:h12
                "  DejaVu_Sans_Mono:h11
                "  Ubuntu_Mono:12
                "  FiraCode_Medium:h12
                "  InputMono_Medium:h11
                "  InputMono_Light:h11
            endif
        " endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }
