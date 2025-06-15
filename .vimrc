" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" Syntax highlighting on
syntax on

" Number of spaces a tab is equal to
set tabstop=4

" Number of spaces to indent with auto-indentation
set shiftwidth=4

" Something with tabs/spaces
set softtabstop=4

" Use spaces for a tab
set expandtab

" Turn on auto-indentation, i.e. carry-over from line above
set ai

" Autoindent on new-lines
set smartindent

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Turn on search highlighting
set hlsearch

" Highlight all previous search patterns with incsearch
set hlsearch incsearch

" Case insensitive search
set ignorecase

" Except when using capital letters
set smartcase

" Ensure backspace works as it should
set backspace=indent,eol,start

" Show the ruler, i.e. row,col in lower right corner
set ruler

" Always display status line, even if only one window
set laststatus=2

" 2 line cmd window
" set cmdheight=2

" display column at 80
set colorcolumn=80

" Use mouse for selecting
if has('mouse')
    set mouse=a
endif

" Disable swap file
set noswapfile

" See results wil search is being typed
set incsearch

" Display matching brackets or parens
set showmatch

" Completion menu
set wildmenu

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

highlight Comment ctermfg=green

" Set colorscheme

colorscheme one
set background=dark

"colorscheme molokai
"let g:molokai_original=1
"let g:rehash256=1

