"" The basics
set nocompatible            " This isn't vi
syntax enable
set showcmd                 " Display incomplete commands
filetype plugin indent on   " Load filetype plugins/indenting
set noswapfile              " No swapfiles in this day and age

"" Unicode, where applicable
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif

"" Whitespace
set nowrap                  " Don't wrap lines
set shiftwidth=4 tabstop=4  " 4 spaces per tab
set expandtab               " Use spaces
set autoindent              " Use indent from previous line by default
set smartindent             " ...with some accommodation for C

"" Searching
set hlsearch                " Highlight matches
set incsearch               " Incremental searching
set ignorecase              " Case-insensitive searches...
set smartcase               " ...unless there are explicit capitals

"" User Interface
set laststatus=2                " Always show the stat line
set showtabline=2               " Always show the tab line
set number                      " Line numbering
set numberwidth=4               " Width of the line number column

set scrolloff=3                 " Scroll context
set backspace=indent,eol,start  " Better backspacing
set diffopt+=iwhite             " Ignore whitespace-only differences
colorscheme zenburn

" Text navigation
"
map <Up> gk
map <Down> gj
imap <Up> <C-o>gk
imap <Down> <C-o>gj

" Window navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

set modeline

" source pluginrc
