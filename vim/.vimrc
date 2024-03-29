" Vundle things:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Javascript Syntax helpers
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'

" Syntax completion
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

" Go Syntax
" Plugin 'fatih/vim-go'

" JSdoc 3 generator assigned to ctrl+j when insert mode on function header
" Plugin 'SirVer/ultisnips'
" Plugin 'jordwalke/JSDocSnippets'
" let g:JSDocSnippetsMapping='<c-j>'

" i3 vim syntax
" Plugin 'PotatoesMaster/i3-vim-syntax'

" ttmux vim
Plugin 'christoomey/vim-tmux-navigator'

" Old timey syntax coloring
Plugin 'morhetz/gruvbox'

" Adhere to .editorconfig in projects that have it
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()			 " required
filetype plugin indent on	 " required

" Actual things:
if v:progname =~? "evim"
	finish
endif

if has("vms")
" do not keep a backup file, use versions instead
	set nobackup
else
" keep a backup file
	set backup
endif

if has('mouse')
  set mouse=n
endif

if &t_Co > 2 || has("gui_running")
	" show current col/row
	"set cursorcolumn
	"set cursorline
	" remove for TeX - slows vim way down
	autocmd Filetype tex set nocursorcolumn
	autocmd Filetype tex set nocursorline
	set guioptions-=r
	set guioptions-=T
	set guioptions-=l
	set guioptions-=L
	" set guifont=Terminus\ 9
	set guifont=ProggyTinyTTSZ\ 12
	colorscheme gruvbox
	" colorscheme distinguished
	" Normal ctermbg=NONE
	set mouse=n
	set guiheadroom=0
	syntax on
	set hlsearch
endif

if has("autocmd")
	augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif
	augroup END
endif

if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

" Helper function for aliasing
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias('W', 'w')
call SetupCommandAlias('Q', 'q')
call SetupCommandAlias('WQ', 'wq')
call SetupCommandAlias('Wq', 'wq')
call SetupCommandAlias('Vsplit', 'vsplit')
call SetupCommandAlias('Split', 'split')
" To work on files that operate under standard JS style
call SetupCommandAlias('standard', 'set tabstop=2 expandtab shiftwidth=2')
call SetupCommandAlias('fourspaces', 'set tabstop=4 expandtab shiftwidth=4')

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
  set noai nocin nosi inde=
  %s/{\ze[^\r\n]/{\r/g
  %s/){/) {/g
  %s/};\?\ze[^\r\n]/\0\r/g
  %s/;\ze[^\r\n]/;\r/g
  %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
  normal ggVG=
endfunction

" Settings
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set backupdir=./.backup,/tmp,.
set directory=.,./.backup,/tmp
set nowrap
set number
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set nobomb
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Settings deprecated in nvim
if !has('nvim')
	set ttyscroll=3
endif

" Style for javascript
set t_Co=256
syntax on
set background=dark
set expandtab

" Mappings
imap <C-c> <CR><Esc>O
map <C-l> cw<C-r>0<ESC>
map Q gq
inoremap <C-U> <C-G>u<C-U>
" Shift between vim panes with CTRL+h|j|k|l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Sudo from within vim
cmap w!! w !sudo tee > /dev/null %

" Windows compatibility settings
" To be used when developing on windows and having trouble with compatibility
set clipboard=unnamed
"set ff=unix
"let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
"let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
"let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
"call vundle#rc(expand(vimDir . '/bundle'))
