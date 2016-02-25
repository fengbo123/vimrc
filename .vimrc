"ubuntu 全局 /etc/vim/vimrc
"用户 ~/.vimrc
"vim 练级教程
set nocompatible " Must be first line 不与vi兼容 防止出现bug
" style 样式 
color evening " 设置夜晚风格 color desert
set background=dark " set background=light
"  易用
filetype plugin indent on " 自动识别文件类型 Automatically detect file types.
set autowrite " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore " Allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)
" set spell " Spell checking on打开拼写检查
set hidden " Allow buffer switching without saving
set iskeyword-=. " '.' is an end of word designator
set iskeyword-=# " '#' is an end of word designator
set iskeyword-=- " '-' is an end of word designator

" Case insensitive search
set ignorecase
set smartcase

set showcmd
syntax on " Syntax highlighting 高亮语法
set mouse=a " Automatically enable mouse usage 鼠标
set mousehide " Hide the mouse cursor while typing
scriptencoding utf-8
set showmode " Display the current mode
set cursorline " Highlight current line
set backspace=indent,eol,start " Backspace for dummies
set linespace=0 " No extra spaces between rows
set number " Line numbers on"设置行号 set number " 不显示行号 set nonu
set showmatch " Show matching brackets/parenthesis
set incsearch " Find as you type search 增量式搜索
set hlsearch " Highlight search terms  高亮搜索
set winminheight=0 " Windows can be 0 line high
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set foldenable " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"格式化

set nowrap " Do not wrap long lines
set backspace=indent,eol,start "在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来 
set smartindent " Indent at the same level of the previous line 自动缩进 set ai "设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致) 
set shiftwidth=4 " Use indents of 4 spaces 默认缩进4个空格
set expandtab " Tabs are spaces, not tabs 用空格替换制表符
set tabstop=4 " An indentation every four columns 制表符占用4个空格
set softtabstop=4 " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

"防止乱码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1et fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin
set termencoding=utf-8
set encoding=utf-8

" Plugin //TODO
"href
  "https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
  "https://github.com/tankywoo/dotfiles/blob/master/.vimrc
  "https://github.com/ma6174/vim/blob/master/.vimrc


"set" nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
