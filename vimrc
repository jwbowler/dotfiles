set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'Trinity'
Plugin 'python.vim'
Plugin 'indentpython.vim'
Plugin 'jellybeans.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'wincent/Command-T'
Plugin 'FSwitch'
Plugin 'wesQ3/vim-windowswap'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
" Plugin 'comments.vim'
Plugin 'basepi/vim-conque'

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

if has('win32') || has('win64')
    set directory=$TMP
else
    set directory=/tmp
end

let mapleader=" "

nnoremap ; :

hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi ExtraWhitespace ctermbg=red

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>e :e<CR>

nnoremap H ^
nnoremap J 10<C-e>10j
nnoremap K 10<C-y>10k
nnoremap L $

nnoremap - ;
nnoremap _ ,

nnoremap <silent> <Leader>h :wincmd h<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>

nnoremap <C-j> J
nnoremap <C-k> K

" split window
nnoremap <leader>swh :topleft vsplit<CR>
nnoremap <leader>swj :botright split<CR>
nnoremap <leader>swk :topleft split<CR>
nnoremap <leader>swl :botright vsplit<CR>

" split buffer
nnoremap <leader>sh  :leftabove vsplit<CR>
nnoremap <leader>sj  :rightbelow split<CR>
nnoremap <leader>sk  :leftabove split<CR>
nnoremap <leader>sl  :rightbelow vsplit<CR>

" open corresponding .cc/.h
nnoremap <leader>aa :FSHere<CR>
nnoremap <leader>ah :vsplit<CR>:wincmd l<CR>:FSLeft<CR>
nnoremap <leader>aj :FSSplitBelow<CR>
nnoremap <leader>ak :vsplit<CR>:wincmd j<CR>:FSAbove<CR>
nnoremap <leader>al :FSSplitRight<CR>

" goto definition
nnoremap <leader>]] <C-]>
nnoremap <leader>]h ::leftabove vsplit<CR><C-]>
nnoremap <leader>]j ::rightbelow split<CR><C-]>
nnoremap <leader>]k ::leftabove split<CR><C-]>
nnoremap <leader>]l ::rightbelow vsplit<CR><C-]>

" goto last location
nnoremap <leader>oo <C-o>
nnoremap <leader>oh ::leftabove vsplit<CR><C-o>
nnoremap <leader>oj ::rightbelow split<CR><C-o>
nnoremap <leader>ok ::leftabove split<CR><C-o>
nnoremap <leader>ol ::rightbelow vsplit<CR><C-o>

nnoremap ; :

nnoremap c- ct_

vnoremap y y`]

if has("autocmd")
    filetype plugin indent on

    " Use actual tabs in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

command! Vimrc e $MYVIMRC
command! Revim so $MYVIMRC

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

set cursorline
set hlsearch
set ignorecase
set number
set smartcase

set encoding=utf-8
set formatoptions=croq
set scrolloff=10
set textwidth=80

syntax enable
set background=dark
set t_Co=256
colorscheme jellybeans
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi ExtraWhitespace ctermbg=red

" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.whitespace = 'Ξ'

autocmd! BufEnter *.cc let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
autocmd! BufEnter *.c let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
autocmd! BufEnter *.h let b:fswitchdst = 'cc,c' | let b:fswitchlocs = '.'
