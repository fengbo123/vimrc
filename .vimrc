set nocompatible
" compelete ctrl+n ctrl+p
set nu " number nonumber nonu
set sc " showcmd noshowcmd nosc
set showmode
set mouse-=a " default
set history=1000
set cursorline
" set cursorcolumn
set visualbell
" set autoread
" set hid "A buffer becomes hiddent when it is abandoned

" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

set encoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf8
set ffs=unix,dos,mac "use Unix as the standard file type

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
" Fast saving

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

nmap <leader>w :w!<cr>

let g:solarized_termcolors=256
syntax enable
colorscheme onedark
" colorscheme solarized
" colorscheme desert " 16
set background=dark
set so=8 " scrolloff so=0(reset)
set ru " ruler noruler noru
set cmdheight=2
set ignorecase
set smartcase " 'smartcase'* *'scs'* *'nosmartcase'* *'noscs'*
set nohls " 'hlsearch'* *'hls'* *'nohlsearch'* *'nohls'*
set incsearch
set nowrap
set expandtab " To insert space characters whenever the tab key is pressed, set the 'expandtab' option:
              " With this option set, if you want to enter a real tab character use Ctrl-V<Tab> key sequence.
set tabstop=4 " To control the number of space characters that will be inserted when the tab key is pressed, set the 'tabstop' option. For example, to insert 4 spaces for a tab, use:
              " After the 'expandtab' option is set, all the new tab characters entered will be changed to spaces. This will not affect the existing tab characters. To change all the existing tab characters to match the current tab settings, use:
              " :retab
set softtabstop=4 "backspace delete 4 spaces
set shiftwidth=4 " To change the number of space characters inserted for indentation, use the 'shiftwidth' option:
set ai " autoindent
set si " smartindent
" set paste "set nopaste
set noundofile
set noswapfile
set nobackup
set nowb
" syntax enable

filetype plugin on
" plugins
"
" Plugin 'Raimondi/delimitMate'
" Plugin 'tpope/vim-surround'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'vim-airline/vim-airline'
" Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'mattn/emmet-vim'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'w0rp/ale'
let mapleader = ","
let g:mapleader = ","

" scrooloose/nerdcommenter plugin
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:airline#extensions#tabline#enabled = 1


set t_Co=256

" Turn on the WiLd menu
set wildmenu
set wildmode=full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
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

"
