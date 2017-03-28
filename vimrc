" vim: set foldmethod=marker foldlevel=0:
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
" nerdtree {{{
Plug 'scrooloose/nerdtree'
map <leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" close vim if only NERDTree window exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<cr>   " toggle undotree

Plug 'tpope/vim-fugitive'

" Plug 'itchyny/lightline.vim'
" let g:lightline = {
"       \   'active': {
"       \     'left': [  ['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified'] ]
"       \   },
"       \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"       \   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"       \ }
" set laststatus=2

" taglist {{{
Plug 'taglist.vim'
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <leader>l :TlistToggle<CR>
" }}}

" ariline {{{
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
set laststatus=2
" }}}

" tabular {{{
Plug 'godlygeek/tabular'
nnoremap <Leader>t :Tabularize /=<CR>:Tabularize /:<CR>
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>
" }}}

" vim-markdown {{{
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
" :Tocv => open TOC in a vertical split
" }}}

" python-mode {{{
" Plug 'klen/python-mode'
" let g:pymode_rope = 0
" let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" }}}

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
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" <leader>ig to display indent guides

Plug 'mattn/emmet-vim'
" <c-y>,

Plug 'cakebaker/scss-syntax.vim'

" Highlight html tags
Plug 'valloric/MatchTagAlways'
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1,
                      \ 'jinja' : 1,
                      \ 'javascript.jsx': 1 }
nnoremap <leader>% :MtaJumpToOtherTag<cr>

Plug 'xavierchow/vim-sequence-diagram', { 'for': 'seq' }
nmap <unique> <leader>q <Plug>GenerateDiagram

" async lint engine {{{
Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_save = 1
" }}}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
"
"
"
" testing
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory='~/.vim/snips'

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Plug 'SirVer/ultisnips'
" let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsExpandTrigger="<leader>e"
" let g:UltiSnipsSnippetsDir = "~/.vim/snips"
""" use <c-j> / <c-k> to jump between positional anchors

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

if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
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
Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ashfinal/vim-colors-paper'
" 24bit color supported
Plug 'joshdick/onedark.vim'
Plug 'AlessandroYorba/Monrovia'
Plug 'alessandroyorba/sidonia'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jacoborus/tender.vim'
Plug 'zanglg/nova.vim'
Plug 'rakr/vim-one'

" Temporary
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
imap <unique> <c-e> <Plug>(fzf-complete-word)
Plug 'junegunn/gv.vim'

Plug 'junegunn/vim-xmark', { 'do': 'make' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
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
" vertical split :Colors
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" autocmd VimEnter * 
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" to use ripgrep
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
nnoremap <silent> <leader>g :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>tg :Tags <C-R><C-W><CR>
" Buffer navigation
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader><Enter> :Buffers<CR>

imap <c-x><c-l> <plug>(fzf-complete-line)

" Golang
Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

call plug#end()

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"""" COLOR
" set background=dark

" colorscheme dracula
" colorscheme paper

" let g:onedark_terminal_italics=1
" let g:airline_theme='onedark'
" colorscheme onedark

" colorscheme tender

colorscheme quantum
let g:airline_theme='quantum'
let g:quantum_italics = 1

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  " esc in nvim terminal
  " vs term://zsh
  tnoremap <Esc> <C-\><C-n>
endif

"""" COMMON KEY BINDING
" switch to next buffer 
nnoremap <leader>. :bn<CR>
nnoremap ]b :bn<CR>
nnoremap <silent> <Left> :bp<CR>
nnoremap <silent> <Right> :bn<CR>
" switch to previous buffer
nnoremap <leader>, :bp<CR>
nnoremap [b :bp<CR>
map <unique><silent> <leader>1 :buffer1<cr>
map <unique><silent> <leader>2 :buffer2<cr>
map <unique><silent> <leader>3 :buffer3<cr>

inoremap jk <esc>  " jk is escape
inoremap kj <esc>  " kj is escape
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
inoremap <C-l> <C-o>l
" inoremap <C-j> <C-o>j
" inoremap <C-k> <C-o>k
" inoremap <C-^> <C-o><C-^>


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
set lazyredraw

" windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

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
nnoremap <silent> <leader>= :resize +10<cr>
nnoremap <silent> <leader>- :resize -10<cr>
nnoremap <silent> <leader>v= :vertical resize +10<cr>
nnoremap <silent> <leader>v- :vertical resize -10<cr>

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


set encoding=utf-8
set hidden
set fileformats=unix,dos,mac
" set noerrorbells               " no beeping or screen flashing
" set visualbell t_vb=           " no beeping or screen flashing
set visualbell

" hide some files and remove help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'
nnoremap <leader>n :Explore<CR>

" sw -> shiftwidth, ts -> tabstop, sts -> softtabstop
augroup configgroup
  autocmd!
  " autocmd VimEnter * highlight clear SignColumn
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd FileType python setlocal sw=4 ts=4 sts=4
  autocmd FileType go setlocal nolist
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.seq setlocal filetype=seq " sequence diagram
  autocmd BufNewFile,BufRead *.apib        set filetype=markdown
  autocmd BufNewFile,BufRead Dockerfile*   set filetype=dockerfile
  " autocmd BufEnter *.md setlocal foldlevelstart=0

  " yarn global add prettier => gq{motion}
  " use gggqG to format the whole file
  " 'gg' go to line 1,
  " 'gq' fomat,
  " 'G' motion
  autocmd FileType javascript set formatprg=prettier\ --single-quote\ --stdin
augroup END

" restore last cursor position
if has('autocmd')
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

set undodir=$HOME/.vim/undo-dir
set backupdir=$HOME/.vim/backup

" tmp
nnoremap <leader>z <C-Z>
let g:matchparen_insert_timeout=5

" using OS clipboard
set clipboard=unnamed
" help ins-completion
" help i_^n
