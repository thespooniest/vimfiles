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
    " General keybindings {{{
    " The all-important leader.
    let mapleader = ','

    " vimrc editing
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " Ctrl-Shift-L clears search
    if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<cr><C-L>
    endif

    " Window navigation
    nnoremap <silent> <C-Up> :wincmd k<CR>
    nnoremap <silent> <C-Down> :wincmd j<CR>
    nnoremap <silent> <C-Left> :wincmd h<CR>
    nnoremap <silent> <C-Right> :wincmd l<CR>

    " Buffer navigation
    nnoremap <silent> <C-PageUp> :bp<CR>
    nnoremap <silent> <C-PageDown> :bn<CR>

    " Arrow key training
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>

    nnoremap j gj
    nnoremap k gk
    " }}}
    " Quickfix {{{
    function! GetBufferList()
        redir =>buflist
        silent! ls
        redir END
        return buflist
    endfunction

    function! ToggleList(bufname, pfx)
        let buflist = GetBufferList()
        for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
            if bufwinnr(bufnum) != -1
                exec(a:pfx.'close')
                return
            endif
        endfor
        if a:pfx == 'l' && len(getloclist(0)) == 0
            echohl ErrorMsg
            echo "Location List is Empty."
            return
        endif
        let winnr = winnr()
        exec(a:pfx.'open')
        if winnr() != winnr
            wincmd p
        endif
    endfunction

    " Key bindings
    nnoremap <silent><F4> :call ToggleList("Quickfix List", 'c')<CR>
    nnoremap <silent><F5> :call ToggleList("Location List", 'l')<CR>
    " }}}
    " Status line {{{
    set statusline=%<%f         " Tail of the filename
    set statusline+=\ %y         " File type
    set statusline+=%=          " Split left/right
    set statusline+=[%{&ff}]    " Linebreak format
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}]    " encoding
    set statusline+=%h%m%r    " Flags: help, modified, readonly
    set statusline+=\ 0x%B      " Character value, hex
    set statusline+=\ %l,%c%V   " Position: line/column/virtual
    set statusline+=\ %P        " percentage
    " }}}
    " GUI {{{
    if has("gui_running")
        set guifont=Menlo\ For\ Powerline
    endif
    " }}}
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
" Plugins {{{
    " netrw {{{
    let g:netrw_banner = 0          " No need for the banner
    let g:netrw_keepdir = 1         " Do not change cwd
    " }}}
    " Airline {{{
    let g:airline_powerline_fonts=1
    let g:airline_theme='zenburn'
    " Built-in airline extensions
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#use_vcscommand = 1

    " Airline plugin integration
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#minibufexpl#enabled = 1
    " }}}
    " Tagbar {{{
    nnoremap <F3> :TagbarToggle<cr>
    vnoremap <F3> <esc>:TagbarToggle<cr>
    inoremap <F3> <esc>:TagbarToggle<cr>
    " }}}
    " MiniBufexpl {{{
    nnoremap <F2> :MBEToggle<cr>
    vnoremap <F2> <esc>:MBEToggle<cr>
    inoremap <F2> <esc>:MBEToggle<cr>
    " }}}
" }}}
" Source our sub-files.
runtime macros
runtime keysrc
" vim:foldmethod=marker:foldlevel=0
