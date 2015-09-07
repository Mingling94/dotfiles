" Vundle things:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Javascript Syntax helpers
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" Syntax completion
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
Plugin 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
Plugin 'marijnh/tern_for_vim'

" Go Syntax
Plugin 'fatih/vim-go'

" JSdoc 3 generator assigned to ctrl+j when insert mode on function header
Plugin 'SirVer/ultisnips'
Plugin 'jordwalke/JSDocSnippets'
let g:JSDocSnippetsMapping='<c-j>'

" i3 vim syntax
Plugin 'PotatoesMaster/i3-vim-syntax'

" Some of Galen's stuff
Plugin 'morhetz/gruvbox'

call vundle#end()			 " required
filetype plugin indent on	 " required

" Actual things:
if v:progname =~? "evim"
	finish
endif

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file
endif

if has('mouse')
	set mouse=v
endif

if &t_Co > 2 || has("gui_running")
	" show current col/row
	set cursorcolumn
	set cursorline
	" remove for TeX - slows vim way down
	autocmd Filetype tex set nocursorcolumn
	autocmd Filetype tex set nocursorline
	set guioptions-=r
	set guioptions-=T
	set guioptions-=l
	set guioptions-=L
	" set guifont=Terminus\ 9
	set guifont=ProggyTinyTTSZ\ 12
	" colorscheme gruvbox
	" colorscheme distinguished
	" Normal ctermbg=NONE
	set mouse=v
	set guiheadroom=0
	syntax on
	set hlsearch
endif

if has("autocmd")
	filetype plugin indent on
	augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\ endif
	augroup END
else
	set autoindent
endif

if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set backupdir=./.backup,/tmp,.
set directory=.,./.backup,/tmp
set tabstop=4
set nowrap
set number
set shiftwidth=4
set noexpandtab
set clipboard=unnamed
set ttyscroll=3

" Style for javascript
set t_Co=256
syntax on
set background=dark

" Mappings
imap <C-c> <CR><Esc>O
map <C-l> cw<C-r>0<ESC>
map Q gq
inoremap <C-U> <C-G>u<C-U>

cmap w!! %!sudo tee > /dev/null %
