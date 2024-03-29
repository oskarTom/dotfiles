
" __ _(_)_ __  _ _ __ 
" \ V / | '  \| '_/ _|
"  \_/|_|_|_|_|_| \__|
"

filetype off
filetype plugin on
syntax enable

set autoindent
set belloff=all
set conceallevel=1  " For LaTeX concealing
set expandtab
set softtabstop=2

set encoding=UTF-8
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

" Spellchecker
set spelllang=en_gb
"set complete+=kspell
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"
"	  REMAPPING
"
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <Tab> :bn<CR>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap œ <Esc>o
inoremap Œ <Esc>O
map <C-s> <Esc>:w<CR>
map! <C-s> <Esc>:w<CR>
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

"
"	TEMPLATES
"	
if has("autocmd")
  augroup spell
    autocmd FileType markdown setlocal spell
    autocmd FileType mdx setlocal spell
    autocmd FileType tex setlocal spell
	augroup END
	augroup templates
		autocmd BufNewFile *.sh 0r ~/Templates/Bash/default.sh
		autocmd BufNewFile *.c 0r ~/Templates/C/default.c
		autocmd BufNewFile *.cpp 0r ~/Templates/C++/default.cpp
		autocmd BufNewFile *.py 0r ~/Templates/Python/default.py
		autocmd BufNewFile answers.tex 0r ~/Templates/LaTeX/answers.tex
		autocmd BufNewFile notes.tex 0r ~/Templates/LaTeX/notes.tex
		autocmd BufNewFile *.html 0r ~/Templates/HTML/default.html
	augroup END
endif


"
"	PLUGINS
"
call plug#begin('~/.vim/plugged')
""	Plug 'tpope/vim-fugitive'
""	Plug 'valloric/youcompleteme'
""  Plug 'shougo/neocomplete.vim'
  Plug 'lervag/vimtex'
""  Plug 'rip-rip/clang_complete'
"  Plug 'tpope/vim-surround'           "https://github.com/tpope/vim-surround
""  Plug 'vim-scripts/AutoComplPop'
  Plug 'scrooloose/nerdtree'
  Plug 'airblade/vim-gitgutter'
  Plug 'lilydjwg/colorizer'
  Plug 'sheerun/vim-polyglot'
  Plug 'raimondi/delimitmate'
  Plug 'alvan/vim-closetag'
	Plug 'scrooloose/syntastic'
  Plug 'scrooloose/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
  Plug 'SirVer/ultisnips'
  Plug 'ryanoasis/vim-devicons'
  Plug 'joshdick/onedark.vim'
  Plug 'neoclide/coc.nvim'
call plug#end()
colorscheme onedark

"
"	CONFIGURATIONS
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0
"let g:livepreview_engine = 'lualatex' 
let g:tex_conceal='abdmg'
let g:tex_flavor = 'latex'
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/mysnippets"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:vimtex_view_method = 'zathura'
let maplocalleader = ","
let mapleader = ","

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

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

set t_RV=
let &t_ut=''

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
