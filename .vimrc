
" __ _(_)_ __  _ _ __ 
" \ V / | '  \| '_/ _|
"  \_/|_|_|_|_|_| \__|
"

filetype off
filetype plugin on
syntax on

set autoindent
set expandtab
set softtabstop=2

set ts=2 sw=2
set incsearch
set nu
set noswapfile
set path+=**
set relativenumber
set smartcase
set smartindent
set smarttab
set splitbelow				"Preview window to the bottom
set undodir=~/.vim/undodir
set undofile
set wildmenu

"
"	  REMAPPING
"
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
map <C-s> <Esc>:w<CR>
map! <C-s> <Esc>:w<CR>

"
"	TEMPLATES
"	
if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh 0r ~/Templates/Bash/default.sh
		autocmd BufNewFile *.c 0r ~/Templates/C/default.c
		autocmd BufNewFile *.py 0r ~/Templates/Python/default.py
		autocmd BufNewFile answers.tex 0r ~/Templates/LaTeX/answers.tex
		autocmd BufNewFile notes.tex 0r ~/Templates/LaTeX/notes.tex
	augroup END
endif


"
"	PLUGINS
"
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'
""	Plug 'tpope/vim-fugitive'
  Plug 'raimondi/delimitmate'
	Plug 'scrooloose/syntastic'
	Plug 'valloric/youcompleteme'
  Plug 'vim-airline/vim-airline'
  Plug 'xuhdev/vim-latex-live-preview'
""  Plug 'rip-rip/clang_complete'
call plug#end()

"
"	CONFIGURATIONS
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:livepreview_previewer = 'zathura'
let g:tex_flavor = 'latex'
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
colorscheme onedark

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END
endif
