set nocompatible "be improved!

" this is for perl script editing
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <F5> :! perl %<CR>
"
" set tags+=/home/haishanh/src/tags


syntax enable
set t_Co=256
set background=dark

" always show line status
set number 
set ruler

set laststatus=2 " status line
set smartcase   " Search strings that are all-lowercase will do a case-insensitive sear    ch
set incsearch   " Incremental search
" set cursorline  " Highlight current line This one seems cause the low end machine laggy
set tabstop=4
set expandtab
"shorkey to toggle paste, which won't break the original format
set pastetoggle=<F9>
set et
set backspace=indent,eol,start
filetype plugin indent on
set shiftwidth=4
" use jj to escape INSTER mode 
inoremap jj <ESC>
inoremap kk <ESC>
"set background=dark
"colorscheme mango
"colorscheme solarized
"colorscheme atom
"colorscheme zen
"colorscheme osx_like
"colorscheme Monokai

"set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,bytval=0x%B,%n%Y%)\%P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %=%-20%Y 
set statusline=%<%F\ %h%m%r%=%-20.(%l/%L,%c%V%)\ %P\ \ %y



" colors blackdust

" below 2 lines for solarized
let g:solarized_termcolors=256
colorscheme solarized

" below 2 lines for molokai
" let g:rehash256 =1
" colorscheme molokai 

" Google colorscheme
" set bg=light
" colorscheme primary
