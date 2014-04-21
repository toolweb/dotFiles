" Use Vim defaults
set nocompatible

" Set to 256-color mode
set t_Co=256


" =============================== Vundle Settings

" Init

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Other bundles

Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-fugitive"
Bundle "scrooloose/syntastic"
Bundle "wincent/Command-T"
Bundle "bling/vim-airline"
Bundle "godlygeek/tabular"
Bundle "tpope/vim-commentary"


" =============================== General Settings

" Colorscheme
set background=dark
colorscheme solarized

" Line numbers
set number

" Allow Backspace
set backspace=indent,eol,start

" Disable blinking cursor
set gcr=a:blinkon0

" Notify visually
set visualbell

" Show partial command in last line
set showcmd

" Show current mode in last line
set showmode

" Reload file automatically if it has been changed outside
set autoread

" Check if the file changed outside of vim
autocmd CursorHold * checktime
autocmd WinEnter * checktime
autocmd BufWinEnter * checktime

" Filepath completion
set wildmenu
set wildmode=list:longest

" Stuff to ignore for completion
set wildignore=*.o,*.obj
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif

" Always show 5-lines of context
set scrolloff=5

" Set editor and file encoding to Unicode
set encoding=utf-8
set fileencoding=utf-8

" Spellcheck on
set spell


" =============== Status Bar

" Always display
set laststatus=2

" =============================== Syntax

" Filetype detection
filetype on

" Load filetype specific plugins
filetype plugin on

syntax enable

" Show matching braces
set showmatch


" =============================== Search

" Case insensitive
set ignorecase

" but respect explict Upper-case
set smartcase

" Highlight matches
set hlsearch

" Search while typing
set incsearch


" =============================== Swap and Backup

" Don't use any swap files
set noswapfile

" or writing to a backup file
set nowb

" or backup file
set nobackup


" =============================== Persistent Undo

" Directory for undo file
silent !mkdir ~/.vim/undos > /dev/null 2>&1
set undodir=~/.vim/undos
set undofile


" =============================== Indentation

" Load filetype indent plugins
filetype indent on

" Carry-over indentation when starting a new line
set autoindent

" Indent new line based on previous line's syntax
set smartindent

" Use shiftwidth when in line beginnings
set smarttab

" Wrap when displaying long lines
set wrap

" Wrap intelligently
set linebreak

" Display tabs, trailing spaces, eol, wrap chars visually
set listchars=tab:»-,trail:·,eol:$,extends:»,precedes:«

" Display trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Tabs are 2-spaces
set tabstop=2

" Use 2-spaces when shifting
set shiftwidth=2

" Tabs are 2-spaces
set softtabstop=2

" Convert tabs to spaces
set expandtab

" Break lines after 79 chars.
set textwidth=79

" Mark the 81st column so it's easily recognizable
if exists('+colorcolumn')
  set colorcolumn=81
endif


" =============================== Folds

" Don't fold by default
set nofoldenable

" Based on indent
set foldmethod=indent

" Max nesting is 3-levels deep
set foldnestmax=3


" =============================== Yelp-specific settings

function YelpSettings()
  " Use 4 spaces when shifting
  set shiftwidth=4

  " Tab char is 4 spaces
  set softtabstop=4
  set tabstop=4

  " <F2> to organize Python imports
  nmap <F2> :! ~/pg/yelp-main/tools/importly %:p<CR>
  map  <F2> :! ~/pg/yelp-main/tools/importly %:p<CR>

endfunction

autocmd BufNewFile,BufRead ~/pg/* call YelpSettings()


" =============================== Custom Mappings

" tags file location
set tags=tags

" Leader key is comma
let mapleader = ","

" ,l - toggle line numbers
nmap <silent> <Leader>l :set invnumber<CR>
map <silent> <Leader>l :set invnumber<CR>

" ,w - to toggle displaying whitespace chars
nmap <silent> <Leader>w :set nolist!<CR>

" ,n - open new tab
noremap <Leader>n :tabnew<CR>

" ,e - open new tab with filename
noremap <Leader>e :tabe

" Firefox-line tab switches
" ,[tabnum] - goto tab
noremap <Leader>1 :tabnext 1<CR>
noremap <Leader>2 :tabnext 2<CR>
noremap <Leader>3 :tabnext 3<CR>
noremap <Leader>4 :tabnext 4<CR>
noremap <Leader>5 :tabnext 5<CR>
noremap <Leader>6 :tabnext 6<CR>
noremap <Leader>7 :tabnext 7<CR>
noremap <Leader>8 :tabnext 8<CR>
noremap <Leader>9 :tabnext 9<CR>

" Diff-mode mappings
if &diff
  " `m` - next change
  nnoremap m ]cz.
  " `M` - previous change
  nnoremap M [cz.
  " `R` - refresh
  nnoremap R :w\|set nodiff\|set diff<cr>
  " `q` - quit both panes
  nnoremap q :qall<cr>
  " place cursor on top of the "new" file
  autocmd VimEnter * normal lgg
endif


" =============================== Custom Config for Plugins

" CtrlP

"" Consider files in current git repo and untracked only
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline

"" Load glyphs for so various fancy symbols show up properly
let g:airline_powerline_fonts = 1

"" Extension - Tabline

""" Disable vim's default mode display as Airline also displays that
set noshowmode

""" Enable
let g:airline#extensions#tabline#enabled = 1

""" Show tab number instead of number of windows next to tab title
let g:airline#extensions#tabline#tab_nr_type = 1

""" Show tabline/tabstatus only if there is more than 1 tab
let g:airline#extensions#tabline#tab_min_count = 2

""" Don't show buffers in tabstatus
let g:airline#extensions#tabline#show_buffers = 0

" Syntastic
let g:syntastic_python_checkers=['pyflakes']
