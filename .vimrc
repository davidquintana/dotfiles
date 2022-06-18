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

" Use spaces for a tab
set expandtab

" Turn on auto-indentation, i.e. carry-over from line above
set ai

" Show line numbers
set number

" Turn on search highlighting
set hlsearch

" Show the ruler, i.e. row,col in lower right corner
set ruler

" Use mouse for selecting
"set mouse=a

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

