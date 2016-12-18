set nocompatible              " be iMproved, required
let mapleader=","  " default is key `\`

set tags+=/home/haishanh/repo/dpdk-2.2.0/tags

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
map <Leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" close vim if only NERDTree window exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Plug 'sjl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]node_modules$'
  \ }
set wildignore+=*.so,*.swp,*.zip

Plug 'taglist.vim'
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <Leader>l :TlistToggle<CR>

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

Plug 'godlygeek/tabular'
nnoremap <Leader>t :Tabularize /=<CR>:Tabularize /:<CR>
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>

Plug 'klen/python-mode'
let g:pymode_rope = 0
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Plug 'davidhalter/jedi-vim'  " Python autocompletion

" Plug 'tpope/vim-markdown'
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'          " syntax - JS
let g:javascript_plugin_jsdoc = 1         " enable highlight for jsdoc
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'nathanaelkane/vim-indent-guides'  " display indent guide


Plug 'JulesWang/css.vim'  " syntax Highlight CSS3
" Plugin 'genoma/vim-less'  " syntax for less - CSS
" Plugin 'lepture/vim-css'       " syntax for CSS - CSS
" Plugin 'wavded/vim-stylus'     " syntax for stylus - CSS
" Plugin 'blockloop/vim-swigjs'  " syntax for swig template - JS

" Highlight html tags
Plug 'valloric/MatchTagAlways'
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1,
                      \ 'jinja' : 1 }

Plug 'jlanzarotta/bufexplorer'
nnoremap <silent> <leader>bb :ToggleBufExplorer<CR>
let g:bufExplorerShowRelativePath=1  " Show relative paths.

Plug 'mileszs/ack.vim'
"" https://github.com/ggreer/the_silver_searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>g :Ack! "<cword>"<CR>
Plug 'xavierchow/vim-sequence-diagram', { 'for': 'seq' }
nmap <unique> <leader>q <Plug>GenerateDiagram

"" Aync Lint Engine
Plug 'w0rp/ale'
"""""
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips', { 'on': [] }
let g:UltiSnipsExpandTrigger="<C-e>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
Plug 'Valloric/YouCompleteMe', { 'on': [] }
let g:ycm_register_as_syntastic_checker = 0

augroup load_us_ycm
  autocmd!
  " autocmd CursorHold, CursorHoldI * call plug#load('ultisnips', 'YouCompleteMe')
  "                    \| autocmd! load_us_ycm
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END
" Optional:
Plug 'honza/vim-snippets'

""" Theme
Plug 'mango.vim'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'ashfinal/vim-colors-paper'

call plug#end()

"""" COLOR
set t_Co=256  " this one should be put before colorscheme setting
" set background=dark
" colorscheme dracula
colorscheme paper
"
" let g:seoul256_background = 233
" let g:seoul256_light_background = 256
" colorscheme seoul256
" colorscheme jellybeans
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
" switch to next buffer 
map <leader>. :bn<CR>
" switch to previous buffer
map <leader>, :bp<CR>
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
set backspace=2 " make backspace work like most other apps

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"""" UI
set number " show line number
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching brackets
set colorcolumn=79 " display a line length limit guiding gutter
set scrolloff=6  " keep some more lines for scope

"""" SEARCH
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " case insensitive matching
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"""" FOLDING
" set foldenable " enable folding
" unfold every fold
set foldlevelstart=99
" 10 nested fold max
set foldnestmax=10
" space open/close folds
nnoremap <space> za
" fold based on syntax
" another value can be "level"
" run `:help foldmethod` for more
set foldmethod=syntax

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
set hidden " enable switch from unsaved buffer

" set complete+=kspell " autocomplete with dictionary words
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
  autocmd FileTYpe python setlocal sw=4 ts=4 sts=4
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.seq setlocal filetype=seq " sequence diagram
augroup END

" restore last cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

set undodir=$HOME/.vim/undo-dir
set backupdir=$HOME/.vim/backup
