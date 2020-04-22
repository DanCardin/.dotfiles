set breakindent
set breakindentopt=shift:2,min:40,sbr
set breakat=" \t;:,.={([])}"
set cpo+=n
set showbreak=>>
set background=dark             " Enables dark background
set cmdheight=2                 " Sets the height of the cmd window at the bottom
set completeopt-=preview
set nocursorcolumn                " Highlights vertical column on cursor
set nocursorline                  " Highlights horizontal line on cursor
set expandtab                   " Tabs are spaces
set ffs=unix,dos,mac            " The order to try le formatting
set foldlevelstart=99           " Don't autofold by default
set hid                         " Hide (not close) buffers when opening new files
set ignorecase                  " Ignores case in / search
set inccommand=nosplit          " Enables live substitute preview
set langmenu=en                 " Sets the UI language
" set lazyredraw                  " Only redraw when necessary
set linebreak                   " Enable linebreaking
set magic                       " Makes regex searches default available
set mat=2                       " Blinks matching brackets
set nobackup                    " Don't create backup files, that's what git's for
set noshowmode                  " Don't show the mode, its in the statusline
set nostartofline               " Don't jump to the beginning of the line
set noswapfile                  " Don't create swap files
set nowb                        " Disable write backup
set number                      " Enable line numbers
set pumheight=4                 " Set the height of the autocomplete menu
set relativenumber              " Make the line number relative
set shiftwidth=4                " Number of spaces replaced per tab
set showcmd                     " Shows the current command on bottom right
set showmatch                   " Highlights matching [{()}]
set smartcase                   " When there's capital in search, be case sensitive
set smartindent                 " Tab to the previous line's indentation
set so=5                        " Minimum number of lines from the top or bottom
" set signcolumn=yes
set signcolumn=no
set splitbelow
set splitright
set stal=1                      " Only show tabline if there's multiple tabs
set swb=useopen,usetab,newtab   " For buffers, first use open buffers, then..., then...
set t_Co=256                    " Enabled 256 colors
set tabstop=4                   " Number of visual spaces per TAB
set timeoutlen=50               " Lowers the timeout
set tm=500                      " Time to wait for a command to complete
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set tw=500                      " Start linebreaking at 500 chars
set vb t_vb=                    " Disables the error bells
set shada^=%                    " Remember info about open buffers on close
set undofile
set undodir=~/.local/share/nvim/vimundo
set updatetime=50               " Smaller update time
set whichwrap+=<,>,h,l          " Wraps on h and l
set wildmode=list:longest:full  " Sets the style of completion for wildmenu
set winaltkeys=no               " Allow for Alt in bindings
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set concealcursor=c
set shell=/bin/zsh
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i
set display=lastline
set encoding=utf-8
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
set langnoremap
set laststatus=2
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«,nbsp:␣
set mouse=a
set nrformats=hex
set sessionoptions-=options
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set wildmenu

set showtabline=2
set guioptions-=e
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
au VimLeave * set guicursor=a:block-blinkon0

" Remap VIM 0 to first non-blank character
map 0 ^
" Stop space from searching
noremap <Space> <Nop>
" Space is <Leader>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
