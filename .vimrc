syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType twig setlocal shiftwidth=2 tabstop=2
autocmd FileType css  setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType text setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.twig setlocal filetype=html
autocmd FileType make setlocal noexpandtab
set showcmd
filetype plugin indent on
set wildmenu
set lazyredraw 
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10

" Highlight TODO, FIXME, NOTE, etc.
if has('autocmd') && v:version > 701
    augroup todo
        autocmd!
        autocmd Syntax * call matchadd(
            \ 'Debug',
            \ '\v\W\zs<(NOTE|INFO|IDEA|TODO|FIXME|HACK)>'
            \ )
    augroup END
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'rking/ag.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'cocopon/colorswatch.vim'
Plug 'cocopon/iceberg.vim'
Plug 'fatih/vim-go'
call plug#end()

" Colors
set t_Co=256
set background=dark
colorscheme iceberg

" Key Mappings
let mapleader="," 
inoremap jk <esc> 
" yank to system keyboard
noremap <leader>y "*y
" space open/closes folds
nnoremap <space> za
noremap <C-k> d$
noremap <C-e> $
" jumping back to marks a,b,c
noremap 'a `a
noremap 'b `b
noremap 'c `c

" NERDTree
nnoremap <leader>f :NERDTreeToggle<Enter>
let NERDTreeShowHidden=1

" NERDCommenter
" nnoremap <C-/> :call NERDComment('n', "toggle")<Cr>

" change cursor shape to line in insert mode
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"

" put backups in a tmp directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


