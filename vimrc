set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","  " default is key `\`

set tags+=/home/haishanh/repo/dpdk-2.2.0/tags

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"  Plugin 'scrooloose/nerdtree'
"  map <Leader>f :NERDTreeToggle<CR>
"  let g:NERDTreeDirArrowExpandable = '>'
"  let g:NERDTreeDirArrowCollapsible = 'v'
""  close vim if only NERDTree window exit
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'sjl/gundo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrl_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip,*/node_modules/*

Plugin 'taglist.vim'
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <Leader>l :TlistToggle<CR>

Plugin 'vim-airline/vim-airline'
set laststatus=2

Plugin 'godlygeek/tabular'
nnoremap <Leader>t :Tabularize /=<CR>:Tabularize /:<CR>
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>

Plugin 'klen/python-mode'
let g:pymode_rope = 0
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Plugin 'davidhalter/jedi-vim'  " Python autocompletion

Plugin 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plugin 'pangloss/vim-javascript'          " syntax - JS
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plugin 'nathanaelkane/vim-indent-guides'  " display indent guide


Plugin 'JulesWang/css.vim'  " syntax Highlight CSS3
" Plugin 'genoma/vim-less'  " syntax for less - CSS
" Plugin 'lepture/vim-css'       " syntax for CSS - CSS
" Plugin 'wavded/vim-stylus'     " syntax for stylus - CSS
" Plugin 'blockloop/vim-swigjs'  " syntax for swig template - JS

" Highlight html tags
Plugin 'valloric/MatchTagAlways'
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1,
                      \ 'jinja' : 1 }

"""""
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

""" Theme
Plugin 'mango.vim'
Plugin 'dracula/vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"""" COLOR
set t_Co=256  " this one should be put before colorscheme setting
syntax enable
" set background=dark
" colorscheme dracula
"
" let g:seoul256_background = 233
" let g:seoul256_light_background = 256
" colorscheme seoul256
colorscheme jellybeans
" colorscheme seti

" let g:solarized_termcolors=256
" let g:solarized_termcolors=1
" colorscheme solarized
" colorscheme eclipse
" colorscheme gentooish
" colorscheme herald
" colorscheme railscasts
"
" colorscheme molokai
" let g:rehash256 = 1

"""" COMMON KEY BINDING
map <leader>, :tabn<CR> " switch to next tab
map <leader>. :tabp<CR> " switch to next tab
inoremap jk <esc>  " jk is escape
nnoremap <leader>u :GundoToggle<CR> " toggle gundo
" save session / vim -S to restore session
nnoremap <leader>s :mksession<CR>
set pastetoggle=<F10>

"""" SPACE & TAB
set tabstop=2 " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
" set backspace=2 " make backspace work like most other apps

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

""" UI
set number " show line number
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching brackets
set colorcolumn=79 " display a line length limit guiding gutter
set scrolloff=6  " keep some more lines for scope

""" SEARCH

set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " case insensitive matching
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"""" FOLDING
" set foldenable " enable folding
set foldlevelstart=99 " unfold every fold
set foldnestmax=10 " 10 nested fold max
nnoremap <space> za " space open/close folds
set foldmethod=indent " fold based on indent level / run `:help foldmethod` for more

"""" SPLIT
" more natual split
set splitbelow
set splitright
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"""" MOVE
"" no skip for wrapped lines
" nnoremap j gj
" nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

"// CSCOPE key mapping
"// find this C symbol
nnoremap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
"" find this definition
nnoremap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
"" find functions calling this function
nnoremap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
"" find assignments to
nnoremap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
"" find this egrep pattern
nnoremap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
"" find this file
nnoremap <Leader>cf :cs find f <C-R>=expand("<cword>")<CR><CR>
"" find  files #includeing this file
nnoremap <Leader>ci :cs find i <C-R>=expand("<cword>")<CR><CR>
" nnoremap <Leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"" find functions called by this function
nnoremap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>


set encoding=utf-8 " utf-8 default encoding

set complete+=kspell " autocomplete with dictionary words

set fileformats=unix,dos,mac " perfer unix file format

set noerrorbells           " no beeping or screen flashing
set visualbell t_vb=       " no beeping or screen flashing

" hide some files and remove help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'
nnoremap <leader>n :Explore<CR>

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" sw -> shiftwidth, ts -> tabstop, sts -> softtabstop
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.c,*.h,*.cpp,*.cxx setlocal sw=2 ts=2 sts=2 " google cpp coding style
    autocmd BufEnter *.sh setlocal sw=2 ts=2 sts=2
    autocmd BufEnter *.js setlocal sw=2 ts=2 sts=2
    autocmd BufEnter *.html setlocal sw=2 ts=2 sts=2
    autocmd BufEnter *.css,*scss,*.less setlocal sw=2 ts=2 sts=2
augroup END

" restore last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set undodir=/home/haishanh/.vim/undo-dir
set backupdir=/home/haishanh/.vim/backup
