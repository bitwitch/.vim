syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType twig setlocal shiftwidth=2 tabstop=2
autocmd FileType css  setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType text setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.twig setlocal filetype=html
au BufRead,BufNewFile *.p8 setlocal filetype=lua
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

" Highlight custom C types
fun! HighlightCustomCTypes()
    syn keyword cType global local_persist function U8 U16 U32 U64 S8 S16 S32 S64 F32 F64
endfu
autocmd bufenter * :call HighlightCustomCTypes()
autocmd filetype * :call HighlightCustomCTypes()

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
if has('win32') || has('win64')
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'cocopon/iceberg.vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
call plug#end()

" Colors
set t_Co=256
set background=dark
colorscheme iceberg

" Font
set guifont=consolas:h10

" Key Mappings
let mapleader="," 
inoremap jk <esc> 
" yank to system keyboard
noremap <leader>y "+y
noremap <leader>p "+p
" space open/closes folds
nnoremap <space> za
noremap <C-k> d$
noremap <C-e> $
" jumping back to marks a,b,c
noremap 'a `a
noremap 'b `b
noremap 'c `c

" open ctrlp in tag mode
nnoremap tp :CtrlPTag<cr>

" Open man pages with vim pager (:Man <manpage> or K on word under cursor)
runtime! ftplugin/man.vim
noremap K :Man <C-R><C-W> <CR>

" CtrlP ingores
let g:ctrlp_custom_ignore = {
\     'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
\     'file': '\.so$\|\.dat$|\.DS_Store$'
\ }

" NERDTree
nnoremap <leader>f :NERDTreeToggle<Enter>
let NERDTreeShowHidden=1

" compilation
let g:QuickMakeAutoDetect = 1

function! s:QuickMake()
	if g:QuickMakeAutoDetect == "1"
		" Attempt to auto-detect build system
        if has('win32') || has('win64')
            let &makeprg = getcwd() . '\build.bat'
		else
			set makeprg=make
		endif
	endif

	let format = &errorformat	" capture current local efm
	:wall
	:copen
	silent! :make
	let &efm=format " transfer error format to quickfix buffer
endfunction

command! -nargs=0 QuickMake :call s:QuickMake()

" Shortcuts to pop open and close the quickfix
nmap <F5> :copen<CR>
nmap <F6> :cclose<CR>

nmap <F7> :QuickMake<CR>

" Use F8/F9 to jump between errors in the quickfix window
nmap <F8> :cprev<CR>
nmap <F9> :cnext<CR>


" change cursor shape to line in insert mode
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"

" remove menus and shit for gvim on windows
:set guioptions-=m " remove menu bar
:set guioptions-=T " remove toolbar
:set guioptions-=r " remove right-hand scroll bar
:set guioptions-=L " remove left-hand scroll bar

" put backups in a tmp directory
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


