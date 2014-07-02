set nocompatible            " This isn't vi
set noswapfile              " No swapfiles in this day and age

"" Pathogen
filetype off                " Pathogen needs to run before plugin indent on
call pathogen#incubate()
call pathogen#helptags()    " Generate helptags

"" The basics
set showcmd                 " Display incomplete commands
set wildmenu                " Command completion
if has('autocmd')
    filetype plugin indent on   " Load filetype plugins/indenting
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

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
set smarttab                " Delete spaces like tabs
set shiftround              " Round indents to nearest tab stop
set autoindent              " Use indent from previous line by default

"" Searching
set hlsearch                " Highlight matches
set incsearch               " Incremental searching
set ignorecase              " Case-insensitive searches...
set smartcase               " ...unless there are explicit capitals

" Ctrl-Shift-L clears search
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<cr><C-L>
endif

"" User Interface
set title                       " Inject our title into the window
set ruler                       " Fallback for the stat line
set laststatus=2                " Always show the stat line
set showtabline=2               " Always show the tab line
set number                      " Line numbering
set numberwidth=4               " Width of the line number column
set shortmess=atI               " Shorten certain messages.

set scrolloff=2                 " Scroll context
set backspace=indent,eol,start  " Better backspacing
set diffopt+=iwhite             " Ignore whitespace-only differences
"colorscheme zenburn

" Window navigation
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

runtime macros
runtime pluginrc
runtime quickfixrc
runtime statuslinerc
runtime netrwrc
