filetype off
call vundle#rc()

syntax enable

set number
set background=dark
set nocompatible
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set showmatch
set ruler
set virtualedit=all
set backupdir=~/.vim/backup,/tmp
set nowrap
set expandtab
set showcmd

" visual completion
set wildmenu

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'thisivan/vim-taglist'
Bundle 'vim-scripts/harlequin'
Bundle 'scrooloose/nerdtree'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/buftabs'
" Bundle 'bling/vim-airline'
" Bundle 'LaTeX-Box-Team/LaTeX-Box'

colorscheme harlequin

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
    set guifont=Terminus\ 9
    set mouse=a
endif
                 
if !has("gui_running")
    set mouse-=a 
endif

autocmd FileType make setlocal noexpandtab


" key bindings 

map <C-tab> :bnext <CR>
map <C-S-tab> :bprevious <CR>
map <C-e> :NERDTreeToggle <CR>

cmap w!! %!sudo tee > /dev/null %

" LaTeX-Box config
"let g:Tex_DefaultTargetFormat='pdf'
"let g:LatexBox_viewer = 'zathura'
"let g:LatexBox_latexmk_options = '-pv'
