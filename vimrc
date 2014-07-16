" vimrc
" Organized according to Doug Black's "A Good Vimrc",
" <http://dougblack.io/words/a-good-vimrc.html>
" Pathogen {{{
filetype off                " Pathogen needs to run before plugin indent on
call pathogen#incubate()
call pathogen#helptags()    " Generate helptags
" }}}
" Miscellaneous {{{
"" The basics
set nocompatible            " This isn't vi
set noswapfile              " No swapfiles in this day and age

set hidden                  " Allow multiple active buffers
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
" }}}
" Whitespace {{{
set nowrap                  " Don't wrap lines
set shiftwidth=4 tabstop=4  " 4 spaces per tab
set expandtab               " Use spaces
set smarttab                " Delete spaces like tabs
set shiftround              " Round indents to nearest tab stop
set autoindent              " Use indent from previous line by default
" }}}
" User Interface {{{
set showcmd                     " Display incomplete commands
set wildmenu                    " Command completion
set lazyredraw                  " Don't redraw during macros
set title                       " Inject our title into the window
set titleold="Terminal"         " No thanks for flying Vim
set titlestring="Terminal"
set ruler                       " Fallback for the stat line
set cursorline                  " Highlight the current line.
set showmatch
set laststatus=2                " Always show the stat line
set shortmess=atI               " Shorten certain messages.

set scrolloff=2                 " Scroll context
set backspace=indent,eol,start  " Better backspacing
set diffopt+=iwhite             " Ignore whitespace-only differences
" }}}
" Searching {{{
set hlsearch                " Highlight matches
set incsearch               " Incremental searching
set ignorecase              " Case-insensitive searches...
set smartcase               " ...unless there are explicit capitals
" }}}
" Autocommands {{{
augroup configgroup
    autocmd!
    autocmd BufEnter Makefile setlocal noexpandtab  " Makefile needs real tabs
augroup END
" }}}
" Colors {{{
colorscheme zenburn
set background=dark             " Dark terminal preferred
" }}}
" Source our sub-files.
runtime macros
runtime keysrc
runtime quickfixrc
runtime statuslinerc
runtime netrwrc
runtime pluginrc

" vim:foldmethod=marker:foldlevel=0
