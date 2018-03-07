" vim: set foldmethod=marker foldlevel=0:

" mapping
" n  Normal
" v  Visual and Select
" s  Select
" x  Visual
" o  Operator-pending
" !  Insert and Command-line
" i  Insert
" l  ":lmap" mappings for Insert, Command-line and Lang-Arg
" c  Command-line
"
"
" variables
" g:  global variables
" b:  local buffer variables
" w:  local window variables
" t:  local tab page variables
" s:  script-local variables
" l:  local function variables
" v:  vim variables
" to list all global vars, run `:let g:`

" Notes {{{
""" startuptime debug
" vim --startuptime vim.log
""" with empty conf
" vim -u NONE
"
" }}}

"" be iMproved
set nocompatible
"" defaut one is `\`
let mapleader=","

set complete+=kspell

" set tags+=/home/haishanh/repo/dpdk-2.2.0/tags
"
if has('termguicolors')
  set termguicolors
endif

""" {{{ plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" nerdtree {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <silent> <leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = "right"
" close vim if only NERDTree window exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" delete buffer without close the window
" https://stackoverflow.com/questions/1864394
nnoremap <leader>q :bp<cr>:bd #<cr>
" }}}

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
nnoremap <leader>u :UndotreeToggle<cr>   " toggle undotree

Plug 'tpope/vim-fugitive'

" lightline {{{
" set showtabline=2
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
" hide "-- INSERT --"
set noshowmode
" subseparator': { 'left': '¦', 'right': '' },
" 'separator': { 'left': '¦', 'right': '¦' },
let g:lightline = {
      \   'colorscheme': 'flatcolor',
      \   'active': {
      \     'left': [  ['mode', 'paste'], ['fugitive', 'readonly', 'relativepath', 'bufnum', 'modified'] ]
      \   },
      \   'component': {
      \     'readonly': '%{&readonly? "\u229D":""}',
      \   },
      \   'subseparator': { 'left': '/', 'right': '¦' },
      \   'enable': { 'statusline': 1, 'tabline': 1 },
      \   'tabline': {'left': [['buffers']], 'right': [['close']]},
      \   'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \   'component_type': {'buffers': 'tabsel'},
      \   'component_function': {
      \     'fugitive': 'fugitive#head'
      \   },
      \ }
" }}}

" taglist {{{
" Plug 'taglist.vim'
" let Tlist_Compact_Format = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" nnoremap <leader>l :TlistToggle<CR>
" }}}

" airline {{{
" Plug 'vim-airline/vim-airline'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" " let g:airline_powerline_fonts = 1
" set laststatus=2
" }}}

" vim-markdown {{{
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
" :Tocv => open TOC in a vertical split
Plug 'junegunn/goyo.vim', { 'for': 'markdown', 'on': 'Goyo' }
" autocmd! User goyo.vim echom 'Goyo is now loaded!'
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

" Plug 'brooth/far.vim'

Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-after-object'
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" va=  visual after =
" ca=  change after =
" da=  delete after =
" ya=  yank after =

" syntax plugins {{{
""" syntax highlight
" Plug 'sheerun/vim-polyglot'  " A collection of language packs

""" syntax - JS
Plug 'pangloss/vim-javascript'
""" enable highlight for jsdoc
let g:javascript_plugin_jsdoc = 1
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" }}}

" Plug 'flowtype/vim-flow'
" Plug 'steelsojka/deoplete-flow'

Plug 'chr4/nginx.vim', { 'for': 'nginx' }

" indent guides {{{
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" <leader>ig to display indent guides
" }}}

Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] }
" <c-y>,

"= syntax scss
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
"= syntax typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }

Plug 'jparise/vim-graphql', { 'for': 'graphql' }

"= syntax pug/jade
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }

Plug 'posva/vim-vue'

Plug 'nathangrigg/vim-beancount', { 'for': 'beancount' }

" Highlight html tags
" Plug 'valloric/MatchTagAlways'
" let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1,
"                       \ 'jinja' : 1,
"                       \ 'javascript.jsx': 1 }
" nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Plug 'xavierchow/vim-sequence-diagram', { 'for': 'seq' }
" nmap <unique> <leader>sq <Plug>GenerateDiagram

" async lint engine {{{
" Plug 'w0rp/ale'
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 1
" }}}

" Automatically close parenthesis, etc
" Plug 'Townk/vim-autoclose'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'

" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
"
"
" testing
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory='~/.vim/snips'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

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

" {{{

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" }}}

" {{{
" Plug 'roxma/nvim-completion-manager'
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}

else
Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': function('BuildYCM') }
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
  " autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
  "                    \| autocmd! load_us_ycm
augroup END
endif
" Optional:
" Plug 'honza/vim-snippets'

Plug 'airblade/vim-gitgutter'
" When you make a change to a file tracked by git, the diff markers should appear automatically
" The delay is governed by vim's updatetime option
" https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100
" `]c` => to next change
" `[c` => to prev change
" Plug 'mhinz/vim-signify'

""" Theme
" Plug 'dracula/vim'
Plug 'haishanh/vim-dracula'
" Plug 'nanotech/jellybeans.vim'
Plug 'ashfinal/vim-colors-paper'
" 24bit color supported
Plug 'joshdick/onedark.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jacoborus/tender.vim'
" Plug 'zanglg/nova.vim'
" Plug 'rakr/vim-one'
" Plug 'iCyMind/NeoSolarized'
Plug 'MaxSt/FlatColor'
" Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'

" Temporary
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
imap <unique> <c-e> <Plug>(fzf-complete-word)
Plug 'junegunn/gv.vim'

Plug 'junegunn/vim-xmark', { 'do': 'make' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags --exclude=node_modules -R'

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
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 10%,0'}, <bang>0)

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
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <leader><Enter> :Buffers<CR>

imap <c-x><c-l> <plug>(fzf-complete-line)

" Golang
Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_fmt_command = "goimports"

" Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]

" Plug 'sbdchd/neoformat'
" let g:neoformat_try_formatprg = 1
" nnoremap <silent> gp :Neoformat<cr>

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'none'
nnoremap <silent> gp :PrettierAsync<cr>
" nnoremap <silent> gp :Prettier<cr>

" Plug 'fleischie/vim-styled-components'

" Plug 'aklt/plantuml-syntax'

" Plug 'tpope/vim-liquid' " Jeyll template

""" run tests
" Plug 'janko-m/vim-test'
" API Blueprint syntax
Plug 'kylef/apiblueprint.vim', { 'for': 'apib' }
call plug#end()

""""}}}

""" {{{ colorschemes

"" let g:airline_theme='onedark'
set background=dark
" let g:onedark_terminal_italics=1
" colorscheme onedark
" colorscheme dracula

" let g:neosolarized_italic = 0

" let g:airline_theme='quantum'
" let g:quantum_italics=1
" let g:quantum_black=1
" colorscheme quantum
" colorscheme flatcolor
" highlight Comment cterm=italic

colorscheme tender

" set background=dark
" colorscheme NeoSolarized
" let g:neosolarized_italic = 0
" highlight Comment cterm=italic

"""}}}

""" {{{ keymap

if has('nvim')
  " tnoremap => terminal noremap
  " vs term://zsh
  " A for ALT key
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
  " Terminal mode
  tnoremap <A-h> <c-\><c-n><c-w>h
  tnoremap <A-j> <c-\><c-n><c-w>j
  tnoremap <A-k> <c-\><c-n><c-w>k
  tnoremap <A-l> <c-\><c-n><c-w>l
  " " Normal mode
  nnoremap <A-h> <c-w>h
  nnoremap <A-j> <c-w>j
  nnoremap <A-k> <c-w>k
  nnoremap <A-l> <c-w>l
  " " Insert mode
  " inoremap <A-h> <Esc><c-w>h
  " inoremap <A-j> <Esc><c-w>j
  " inoremap <A-k> <Esc><c-w>k
  " inoremap <A-l> <Esc><c-w>l
  " " Visual mode
  " vnoremap <A-h> <Esc><c-w>h
  " vnoremap <A-j> <Esc><c-w>j
  " vnoremap <A-k> <Esc><c-w>k
  " vnoremap <A-l> <Esc><c-w>l
endif

"""" common key binding
" switch to next buffer
nnoremap <leader>. :bn<CR>
nnoremap ]b :bn<CR>
" switch to previous buffer
nnoremap <leader>, :bp<CR>
nnoremap [b :bp<CR>

" broken in neovim
map <unique><silent> <leader>1 :buffer1<cr>
map <unique><silent> <leader>2 :buffer2<cr>
map <unique><silent> <leader>3 :buffer3<cr>

inoremap kj <esc>  " kj is escape
inoremap jk <esc>  " jk is escape
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

"""}}}

set autoread
" au FocusGained,BufEnter * :silent! !
" au FocusLost,WinLeave * :silent! w

""" {{{ SPACE & TAB

" number of visual spaces per TAB
set tabstop=2
set shiftwidth=2
" number of spaces in tab when editing
set softtabstop=2
" tab to spaces
set expandtab
set smarttab
" make backspace work like most other apps
set backspace=2
" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

""" }}} SPACE & TAB

""" {{{ UI
set number
" show command in bottom bar
set showcmd
" visual autocomplete for command menu
set wildmenu
" highlight matching brackets
set showmatch
" display a line length limit guiding gutter
set colorcolumn=79
" keep some more lines for scope
set scrolloff=6
" set lazyredraw
""" }}} UI

" windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

""" {{{ search
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" case insensitive matching
set ignorecase
" turn off search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>
""" }}} search

" easy copy to system clipboard in visual mode
vnoremap <leader>y "*y

""" {{{ folding

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

""" }}} folding

""" {{{ split
" more natual split
set splitbelow
set splitright
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
nnoremap <silent> <leader>= :resize +10<cr>
nnoremap <silent> <leader>- :resize -10<cr>
nnoremap <silent> <leader>v= :vertical resize +10<cr>
nnoremap <silent> <leader>v- :vertical resize -10<cr>
""" }}} split

""" {{{ cscope
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
""" }}} cscope

set encoding=utf-8
scriptencoding utf-8
set hidden
set fileformats=unix,dos,mac
set visualbell

" hide some files and remove help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'
nnoremap <leader>n :Explore<CR> 
" sw -> shiftwidth, ts -> tabstop, sts -> softtabstop

" autocmd {{{
augroup configgroup
  autocmd!
  " autocmd VimEnter * highlight clear SignColumn
  autocmd FileType python                  setlocal commentstring=#\ %s
  autocmd FileType python                  setlocal sw=4 ts=4 sts=4
  autocmd BufEnter Makefile                setlocal noexpandtab
  autocmd FileType go                      setlocal nolist
  autocmd BufEnter *.zsh-theme             setlocal filetype=zsh
  " sequence diagram
  autocmd BufEnter *.seq                   setlocal filetype=seq
  " api blueprint
  " autocmd BufNewFile,BufRead *.apib        set filetype=markdown
  autocmd BufNewFile,BufRead Dockerfile*   set filetype=dockerfile

  autocmd BufEnter *babelrc                  setlocal filetype=json

  " wechat miniapp
  autocmd BufEnter *.wxss                  setlocal filetype=scss
  autocmd BufEnter *.wxml                  setlocal filetype=xml
  autocmd BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css

  " spell check
  autocmd BufRead,BufNewFile *.md          setlocal spell
  autocmd FileType gitcommit               setlocal spell

  " yarn global add prettier => gq{motion}
  " use gggqG to format the whole file
  " 'gg' go to line 1,
  " 'gq' fomat,
  " 'G' motion
  autocmd FileType javascript set formatprg=prettier\ --single-quote\ --stdin
augroup END
" autocmd }}}

" restore last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

if has('persistent_undo')
  set noswapfile
  set nobackup
  set nowritebackup
  set undodir=$HOME/.vim/undo-dir
  set backupdir=$HOME/.vim/backup
  set undofile
endif

" tmp
" nnoremap <c-j> gggqG
nnoremap <leader>z <C-Z>
let g:matchparen_insert_timeout=5

" using OS clipboard
set clipboard=unnamed
" help ins-completion
" help i_^n
set hidden
