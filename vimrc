call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'jellybeans.vim'

" For trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Comment with <leader>cc or <leader>ci
Plug 'scrooloose/nerdcommenter'

" Ignore gitignored files
Plug 'gitignore'

" Improves netrw
Plug 'tpope/vim-vinegar'

" Source navigation
Plug 'ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'

" Navigate between source and header files
" Plug 'FSwitch'

" Swap two windows: <leader>ww <leader>ww
" Plug 'wesQ3/vim-windowswap'

" Autocompletion
Plug 'Shougo/deoplete.nvim'

" Git stuff
" Plug 'tpope/vim-fugitive'

" Python plugins: some I've tried; one I'm using
" Plug 'python.vim'
" Plug 'indentpython.vim'
" Plug 'klen/python-mode'
Plug 'hynek/vim-python-pep8-indent'

" Language support
" Plug 'jplaut/vim-arduino-ino'
" Plug 'vim-coffee-script'
" Plug 'lervag/vim-latex'
" Plug 'vim-less'
Plug 'othree/yajs.vim'
Plug 'sophacles/vim-processing'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'hashivim/vim-terraform'

call plug#end()

if has('win32') || has('win64')
    set directory=$TMP
else
    set directory=/tmp
end

let mapleader=" "

hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi ExtraWhitespace ctermbg=red

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>e :e<CR>

noremap H ^
noremap J 10<C-e>10j
noremap K 10<C-y>10k
noremap L $

"noremap - ;
"noremap _ ,

nnoremap <silent> <Leader>h :wincmd h<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>

noremap <C-j> J
noremap <C-k> 10<C-y>10k

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
" nnoremap <leader>aa :FSHere<CR>
" nnoremap <leader>ah :vsplit<CR>:wincmd l<CR>:FSLeft<CR>
" nnoremap <leader>aj :FSSplitBelow<CR>
" nnoremap <leader>ak :vsplit<CR>:wincmd j<CR>:FSAbove<CR>
" nnoremap <leader>al :FSSplitRight<CR>

" goto definition
" nnoremap <leader>]] <C-]>
" nnoremap <leader>]h ::leftabove vsplit<CR><C-]>
" nnoremap <leader>]j ::rightbelow split<CR><C-]>
" nnoremap <leader>]k ::leftabove split<CR><C-]>
" nnoremap <leader>]l ::rightbelow vsplit<CR><C-]>

" goto last location
" nnoremap <leader>oo <C-o>
" nnoremap <leader>oh ::leftabove vsplit<CR><C-o>
" nnoremap <leader>oj ::rightbelow split<CR><C-o>
" nnoremap <leader>ok ::leftabove split<CR><C-o>
" nnoremap <leader>ol ::rightbelow vsplit<CR><C-o>
nnoremap gb <C-o>

nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader>z :NERDTree<CR>
nnoremap <leader>' :TagbarToggle<CR>

" netrw
nnoremap <leader>n :Explore<CR>

" terminal mode
tnoremap <Esc> <C-\><C-n>

noremap ; :

noremap c- ct_

vnoremap y y`]

" search for highlighted text
vnoremap // y/<C-R>"<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
set completeopt-=preview
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if has("autocmd")
    filetype plugin indent on

    " Use actual tabs in Makefiles.
    au FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

    " Indent .ino files like .c files.
    au FileType arduino set cindent

    au FileType python setlocal smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
    au FileType python nmap gd <C-]>

    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)

    au FileType go nmap <Leader>d <Plug>(go-doc)
    au FileType go nmap <Leader>r <Plug>(go-rename)
endif
command! Vimrc e $MYVIMRC
command! Revim so $MYVIMRC

set tabstop=4
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

set backspace=start

set clipboard=unnamedplus

syntax enable
set background=dark
set t_Co=256
colorscheme jellybeans
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi ExtraWhitespace ctermbg=red

cabbr <expr> %% expand('%:p:h')

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

let g:go_fmt_command = "goimports"
let g:pymode_doc_bind = '^K'

let NERDSpaceDelims=1
