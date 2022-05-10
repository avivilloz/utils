syntax on

"inserts spaces instead of tabs
set expandtab 

"when tab is pressed it stops after 4 spaces (either way)
set tabstop=4

"changes the number of space characters inserted for indentation
set shiftwidth=4

"?
set softtabstop=4

"changes all the existing tab characters to match the current tab settings
retab

"set line numbers
set nu 

"don't wrap lines, i.e don't automatically moves one line down.
set nowrap

"if your search a string, and it has one or more characters in upper case, 
"it will assume that you want a case-sensitive search.
set smartcase 

"setting directory for swapping files, backup, etc:
set backupdir=~/.vim/.backup//

set directory=~/.vim/.swap//

"if my desire is to not have swap files:
"set noswapfile

"if my desire is to not have backup files:
"set nobackup

set undodir=~/.vim/.undo//
set undofile

"it will move the highlight as you add characters to the search string.
set incsearch 

"sets a column at 80 cm.
set colorcolumn=80

"sets column's color
highlight ColorColumn ctermbg=0 guibg=lightgrey

"alt+down switches line with line bellow
nnoremap <A-Down> ddp
"alt+up switches line with line above
nnoremap <A-Up> dd<Up>P

"prevents yanking removed line when pasting over
vnoremap p "0p
vnoremap P "0P
vnoremap y "0y
vnoremap d "0d

set nocompatible

"plugins
call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"background and theming related commands
"set background=dark
"colorscheme nord
