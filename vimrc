set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","  " default is key `\`

set tags+=/home/haishanh/repo/dpdk-2.0.0/tags

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mango.vim'

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

"Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" close vim if only NERDTree window exit 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Plugin 'sjl/gundo.vim'

Plugin 'godlygeek/tabular'
nnoremap <Leader>t :Tabularize /=<CR>:Tabularize /:<CR>
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>

Plugin 'klen/python-mode'
let g:pymode_rope = 0
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" JS syntax
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'

" CSS3
Plugin 'JulesWang/css.vim'
Plugin 'genoma/vim-less'
"Plugin 'lepture/vim-css'
" Syntax Highlight for Stylus
Plugin 'wavded/vim-stylus'
"Plugin 'groenewege/vim-less'

" swig.js
Plugin 'blockloop/vim-swigjs'

" Highlight html tags
Plugin 'valloric/MatchTagAlways'
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1,
                      \ 'jinja' : 1 } 

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required


"""" COLOR
set t_Co=256  " this one should be put before colorscheme setting
syntax on 
set background=dark
" colorscheme dracula 
" colorscheme solarized
" colorscheme eclipse
" colorscheme gentooish
" colorscheme herald
" colorscheme railscasts
" colorscheme molokai

"""" COMMON KEY BINDING
inoremap jk <esc>  " jk is escape
nnoremap <leader>u :GundoToggle<CR> " toggle gundo
" save session / vim -S to restore session
nnoremap <leader>s :mksession<CR>
set pastetoggle=<F10>

"""" SPACE & TAB
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tab to spaces
set backspace=2 " make backspace work like most other apps

""" UI
set number " show line number
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching brackets
set colorcolumn=79
set scrolloff=6  " keep some more lines for scope

""" SEARCH

set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " case insensitive matching
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"""" FOLDING
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
nnoremap <space> za " space open/close folds
set foldmethod=indent " fold based on indent level / run `:help foldmethod` for more

"""" MOVE
"" no skip for wrapped lines
" nnoremap j gj 
" nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]


" utf-8 default encoding
set enc=utf-8

" prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" don't bell or blink
set noerrorbells
set vb t_vb=

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

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal sw=2 ts=2 sts=2
    autocmd BufEnter *.js setlocal sw=2 ts=2 sts=2
    autocmd BufEnter *.html setlocal sw=2 ts=2 sts=2
    autocmd BufEnter *.less setlocal sw=2 ts=2 sts=2
augroup END

" restore last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
