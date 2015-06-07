" vundle things:
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'rentalcustard/exuberant-ctags'
"Bundle 'thisivan/vim-taglist'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/buftabs'
Bundle 'vim-scripts/harlequin'
Bundle 'morhetz/gruvbox'
"Bundle 'bling/vim-airline'
"Bundle 'LaTeX-Box-Team/LaTeX-Box'

call vundle#end()
filetype plugin indent on

set number
set background=dark
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set showmatch
set ruler
set virtualedit=all
set backupdir=~/.vim/backup
set nowrap
set expandtab
set showcmd
set wildmenu

syntax enable

if has("gui_running")
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
    colorscheme gruvbox
    set mouse=a
    set guiheadroom=0
endif
                 
if !has("gui_running")
    set mouse-=a 
    colorscheme harlequin
    set mouse=a
endif

autocmd FileType make setlocal noexpandtab


" key bindings 

map <C-tab> :bnext <CR>
map <C-S-tab> :bprevious <CR>
map <C-e> :NERDTreeToggle <CR>

cmap w!! %!sudo tee > /dev/null %
