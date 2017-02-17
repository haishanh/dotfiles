set nocompatible              " be iMproved, required
let mapleader=","  " default is key `\`

" set tags+=/home/haishanh/repo/dpdk-2.2.0/tags

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim --startuptime vim.log

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
map <Leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" close vim if only NERDTree window exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Plug 'sjl/gundo.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = {
"   \ 'dir': '\v[\/]node_modules$'
"   \ }
set wildignore+=*.so,*.swp,*.zip

Plug 'taglist.vim'
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <Leader>l :TlistToggle<CR>

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
set laststatus=2

Plug 'godlygeek/tabular'
nnoremap <Leader>t :Tabularize /=<CR>:Tabularize /:<CR>
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter = 1

" Plug 'klen/python-mode'
" let g:pymode_rope = 0
" let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Plug 'davidhalter/jedi-vim'  " Python autocompletion

Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-after-object'
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" va=  visual after =
" ca=  change after =
" da=  delete after =
" ya=  yank after =

""" syntax highlight
Plug 'sheerun/vim-polyglot'  " A collection of language packs

Plug 'pangloss/vim-javascript'          " syntax - JS
let g:javascript_plugin_jsdoc = 1         " enable highlight for jsdoc
" Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 1
Plug 'nathanaelkane/vim-indent-guides'  " display indent guide

Plug 'mattn/emmet-vim'
" <c-y>,

" Plug 'JulesWang/css.vim'  " syntax Highlight CSS3
Plug 'cakebaker/scss-syntax.vim'
" Plugin 'genoma/vim-less'  " syntax for less - CSS
" Plugin 'lepture/vim-css'       " syntax for CSS - CSS
" Plugin 'wavded/vim-stylus'     " syntax for stylus - CSS
" Plugin 'blockloop/vim-swigjs'  " syntax for swig template - JS

" Highlight html tags
Plug 'valloric/MatchTagAlways'
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1,
                      \ 'jinja' : 1 }

Plug 'mileszs/ack.vim'
"" https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"     let g:ackprg = 'ag --vimgrep'
" endif
" nnoremap <Leader>g :Ack! "<cword>"<CR>
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
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

if (has("nvim"))
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

else
Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': function('BuildYCM') }
" Plug 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {
    \  'nerdtree' : 1,
    \}
" I do not need sematic completion
let g:ycm_filetype_specific_completion_to_disable = {
    \ '*': 1
    \}

augroup load_us_ycm
  autocmd!
  " autocmd CursorHold, CursorHoldI * call plug#load('ultisnips', 'YouCompleteMe')
  "                    \| autocmd! load_us_ycm
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END
endif
" Optional:
Plug 'honza/vim-snippets'

Plug 'airblade/vim-gitgutter'
" `]c` => to next change
" `[c` => to prev change
" Plug 'mhinz/vim-signify'

""" Theme
Plug 'mango.vim'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'ashfinal/vim-colors-paper'
" 24bit color supported
Plug 'joshdick/onedark.vim'
Plug 'AlessandroYorba/Monrovia'
Plug 'alessandroyorba/sidonia'
Plug 'jacoborus/tender.vim'
Plug 'zanglg/nova.vim'
Plug 'rakr/vim-one'

" Temporary
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'junegunn/vim-xmark', { 'do': 'make' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Ctrl+P
nnoremap <c-p> :Files<CR>
" Grep text
" see https://github.com/junegunn/fzf.vim/issues/50
nnoremap <silent> <leader>g :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>
" Buffer navigation
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader><Enter> :Buffers<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

"""" COLOR
set background=dark
" set t_Co=256  " this one should be put before colorscheme setting
" colorscheme dracula
" colorscheme paper
colorscheme onedark
" let g:airline_theme='onedark'
let g:onedark_terminal_italics=1
highlight Comment cterm=italic

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
nnoremap <leader>. :bn<CR>
nnoremap ]b :bn<CR>
nnoremap <silent> <Left> :bp<CR>
nnoremap <silent> <Right> :bn<CR>
" switch to previous buffer
nnoremap <leader>, :bp<CR>
nnoremap [b :bp<CR>
inoremap jk <esc>  " jk is escape
inoremap kj <esc>  " kj is escape
nnoremap <leader>u :GundoToggle<CR> " toggle gundo
" save session / vim -S to restore session
nnoremap <leader>s :mksession<CR>
set pastetoggle=<F10>

nnoremap ++ :m .+1<CR>==
nnoremap __ :m .-2<CR>==
vnoremap ++ :m '>+1<CR>gv=gv
vnoremap __ :m '<-2<CR>gv=gv
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

set visualbell

"""" SPACE & TAB
set tabstop=2 " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
set smarttab
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
" set lazyredraw

" windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

if (has("nvim"))
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

"""" SEARCH
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " case insensitive matching
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" easy copy to system clipboard in visual mode
vnoremap <leader>y "*y

" set nofoldenable
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
  " autocmd VimEnter * highlight clear SignColumn
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd FileType python setlocal sw=4 ts=4 sts=4
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.seq setlocal filetype=seq " sequence diagram
  autocmd BufNewFile,BufRead *.apib        set filetype=markdown
  autocmd BufNewFile,BufRead Dockerfile*   set filetype=dockerfile
  " autocmd BufEnter *.md setlocal foldlevelstart=0
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

" tmp
nnoremap <leader>z <C-Z>
