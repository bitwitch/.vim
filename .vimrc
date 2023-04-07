set visualbell
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set backspace=indent,eol,start
set showcmd
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
augroup filetype_specific_stuff
    autocmd!
	autocmd FileType c,cpp let b:comment_leader = '// '
	autocmd FileType html setlocal shiftwidth=2 tabstop=2
	autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
	autocmd FileType twig setlocal shiftwidth=2 tabstop=2
	autocmd FileType css setlocal shiftwidth=2 tabstop=2
	autocmd FileType scss setlocal shiftwidth=2 tabstop=2
	autocmd FileType text setlocal shiftwidth=2 tabstop=2
	autocmd FileType make setlocal noexpandtab
	autocmd BufRead,BufNewFile *.txt setlocal textwidth=80
	autocmd BufRead,BufNewFile *.twig setlocal filetype=html
	autocmd BufRead,BufNewFile *.p8 setlocal filetype=lua
	autocmd BufRead,BufNewFile *.ion setlocal filetype=c
augroup end

" Highlight custom C types
fun! HighlightCustomCTypes()
    syn keyword cType global local_persist function U8 U16 U32 U64 S8 S16 S32 S64 F32 F64
endfu
augroup highlight_custom_types
    autocmd!
	autocmd bufenter * :call HighlightCustomCTypes()
	autocmd filetype * :call HighlightCustomCTypes()
augroup end

" Plugins
if has('win32') || has('win64')
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Colors
syntax on
set t_Co=256
set background=dark
if rand()%2
    colorscheme iceberg
else
    colorscheme magicka
endif

" Font
set guifont=consolas:h13

" Key Mappings
let mapleader="," 
inoremap jk <esc> 
" yank to system clipboard
noremap <leader>y "+y
" paste from system clipboard
noremap <leader>p "+p
" space open/closes folds
nnoremap <space> za
" delete to end of line
noremap <C-k> d$
" jump to end of line
noremap <C-e> $
" jumping back to marks a,b,c
noremap 'a `a
noremap 'b `b
noremap 'c `c
" Use CTRL-L to clear the highlighting of 'hlsearch'  and call :diffupdate
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" use // for c comments
let g:NERDCustomDelimiters = { 'c': { 'left': '// ','right': '' } }

" Delete comment character when joining commented lines.
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif

" make \ search all c files 
noremap <nowait> <Bslash> :vimgrep  **/*.c<C-Left><Left>

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

" compilation
let g:QuickMakeAutoDetect = 1

function! s:QuickMake()
	if g:QuickMakeAutoDetect == "1"
		" Attempt to auto-detect build system
        if has('win32') || has('win64')
            let init_shell='C:\bin\init_shell.bat'
            let &makeprg = init_shell . ' && ' . getcwd() . '\build.bat'
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


