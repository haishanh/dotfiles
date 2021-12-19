" vim: set foldmethod=marker foldlevel=0:

" mapping
" n  Normal, v  Visual and Select, s  Select, x  Visual, o  Operator-pending, !  Insert and Command-line, i  Insert
" l  ":lmap" mappings for Insert, Command-line and Lang-Arg
" c  Command-line
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
" :help internal-variables

" vim variables
" :set            - shows vars different from defaults
" :set all        - shows all values
" :set foo?       - shows the value of foo
" :set foo+=opt   - add opt to the value w/o changing others
" :set foo-=opt   - remove opt from value
" :set foo&       - reset foo to default value
" :setlocal foo   - only the current buffer

""" startuptime debug
" vim --startuptime vim.log
""" with empty conf
" vim -u NONE

set nocompatible
let mapleader=" "

" disable default plugins
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

set complete+=kspell
set noshowmode " hide "-- INSERT --"

let g:loaded_python_provider = 0
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
" pip3 install pynvim

if has('termguicolors')
  set termguicolors
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:plug_pwindow = 'vertical belowright new'
call plug#begin('~/.vim/bundle')

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
nnoremap <leader>u :UndotreeToggle<cr>   " toggle undotree

Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
" Plug 'rizzatti/dash.vim'
" Plug 'skywind3000/asyncrun.vim'
" Plug 'voldikss/vim-floaterm'

" ≀ ∙ ⦂ ◍ ⦿ ⦰ ⦸ ⨂

" :Tocv => open TOC in a vertical split
" Plug 'junegunn/goyo.vim', { 'for': 'markdown', 'on': 'Goyo' }
" autocmd! User goyo.vim echom 'Goyo is now loaded!'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
let g:mkdp_markdown_css = expand('$HOME/md.css')

" Plug 'liuchengxu/vista.vim'

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" let g:tagbar_iconchars = ['+', '-']
Plug 'junegunn/vim-after-object'
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" va=  visual after =
" ca=  change after =
" da=  delete after =
" ya=  yank after =

""" syntax highlight
" Plug 'sheerun/vim-polyglot'  " A collection of language packs
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'chr4/nginx.vim', { 'for': 'nginx' }
" Plug 'niftylettuce/vim-jinja', { 'for': 'jinja' }
" Plug 'posva/vim-vue'
" Plug 'digitaltoad/vim-pug'

""" syntax - JS
" Plug 'othree/yajs.vim'
" Plug 'pangloss/vim-javascript'
" let g:javascript_plugin_jsdoc = 1
" " 'mxw/vim-jsx' has been deprecated
" Plug 'yuezk/vim-js'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'maxmellon/vim-jsx-pretty'

" Plug 'vim/killersheep'

" Plug 'Yggdroot/indentLine'
" let g:indentLine_enabled = 0
" let g:indentLine_char_list = ['|', '⎸', '┆', '┊']
" let g:indentLine_char_list = ['⎸']
" Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] }
" <c-y>,

Plug 'nathangrigg/vim-beancount', { 'for': 'beancount' }

" Plug 'xavierchow/vim-sequence-diagram', { 'for': 'seq' }
" nmap <unique> <leader>sq <Plug>GenerateDiagram

" surround
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-endwise'
" Closes brackets only when after pressing `Enter`
Plug 'rstacruz/vim-closer'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

set updatetime=300
""" Theme
" Plug 'dracula/vim'
" Plug 'haishanh/vim-dracula'
Plug 'haishanh/night-owl.vim'
"Plug '$HOME/repo/h/night-owl.vim'
" Plug 'iCyMind/NeoSolarized'
" Plug 'lifepillar/vim-gruvbox8'
" Plug 'morhetz/gruvbox'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-l> :Buffers<CR>
" nnoremap <silent> <leader>b :Buffers<CR>
" assigned to vista
" nnoremap <silent> <leader>t :Tags<CR>
" see https://github.com/junegunn/fzf.vim/issues/50
nnoremap <silent> <leader>g :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <silent> <leader><Enter> :Buffers<CR>

imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-e> <Plug>(fzf-complete-word)

" fzf in floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Plug 'junegunn/gv.vim'

" Golang
" Plug 'fatih/vim-go', { 'for': 'go' }
" let g:go_fmt_command = "goimports"

" parser options: flow|babylon|typescript|css|less|scss|json|graphql|markdown
" let g:prettier#config#parser = 'babylon'
" nnoremap <leader>p :PrettierAsync<CR>
" vnoremap <leader>p :PrettierAsync<CR>

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> gp :Prettier<CR>
vmap <leader>ps <Plug>(coc-format-selected)
nmap <leader>ps <Plug>(coc-format-selected)

" nnoremap <silent> gp :PrettierAsync<CR>

" use `:Oi` for organize import of current buffer
command! -nargs=0 Oi :CocCommand editor.action.organizeImport
" coc-eslint
command! -nargs=0 LintFix :CocCommand eslint.executeAutofix
command! -nargs=0 LintProject :CocCommand eslint.lintProject
command! -nargs=0 LintShow :CocCommand eslint.showOutputChannel

" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'fleischie/vim-styled-components'
" Plug 'aklt/plantuml-syntax'
" Plug 'tpope/vim-liquid' " Jeyll template

" personal wiki
" Plug 'blinry/vimboy'
" Plug 'AGhost-7/critiq.vim'
" colorscheme
" Plug '$HOME/repo/h/zephyr-nvim'
Plug 'haishanh/zephyr-nvim', { 'branch':'haishan' }
" Plug 'wuelnerdotexe/vim-enfocado'
" Plug 'catppuccin/nvim'
" Plug 'EdenEast/nightfox.nvim'
" Plug 'relastle/bluewery.vim'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect

" for hrsh7th/nvim-cmp
" set completeopt=menu,menuone,noselect

" breakdown --startuptime output
Plug 'tweekmonster/startuptime.vim'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <CR> to confirm the completion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [x <Plug>(coc-diagnostic-prev)
nmap <silent> ]x <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-git
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
" nmap gc <Plug>(coc-git-commit)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" https://github.com/neoclide/coc-sources
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-word',
  \ 'coc-syntax',
  \ 'coc-dictionary',
  \ 'coc-ultisnips',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-svelte',
  \ 'coc-emoji',
  \ 'coc-eslint',
  \ 'coc-actions'
  \ ]

" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'jacoborus/tender.vim'
" Plug 'adigitoleo/vim-mellow'

" Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
" Plug 'iamcco/git-p.nvim'

" Plug 'mhinz/vim-startify'
Plug 'tpope/vim-repeat'
" Plug 'easymotion/vim-easymotion'
" Plug 'ejholmes/vim-forcedotcom'

" Plug 'dstein64/vim-startuptime'

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'GutenYe/json5.vim'

Plug 'hashivim/vim-terraform'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent' " ai/ii/aI/iI for indented lines
Plug 'kana/vim-textobj-syntax' " ay/iy for a syntax-highlighted item
Plug 'jceb/vim-textobj-uri'    " au/iu for uri
Plug 'beloglazov/vim-textobj-quotes'

" Plug 'NieTiger/halcyon-neovim'

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'kynan/dokuvimki', {'on': 'DokuVimKi'}
" Plug 'mogelbrod/vim-jsonpath'
" svelte
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'

Plug 'neoclide/jsonc.vim'
Plug 'tomlion/vim-solidity'

" plug_end
call plug#end()

" colorscheme dracula
" set background=dark
" colorscheme bluewery
colorscheme zephyr    " 8/10
" let g:enfocado_style = "neon"
" autocmd VimEnter * ++nested colorscheme enfocado
" colorscheme catppuccin    " 7/10
" colorscheme nightfox  " 8/10
" set background=light
" colorscheme night-owl
" set background=light
" colorscheme tokyonight
" colorscheme base16-onedark

" highlight Comment cterm=italic

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

" inoremap kj <esc>  " kj is escape
" inoremap jk <esc>  " jk is escape
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

set autoread
set autowriteall
" Nvim got focus
" autocmd FocusGained * silent! checktime

" steal from https://github.com/neovim/neovim/issues/2127#issuecomment-150954047
augroup AutoSwap
  autocmd!
  autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
  " if swapfile is older than file itself, just get rid of it
  if getftime(v:swapname) < getftime(a:filename)
    call delete(v:swapname)
    let v:swapchoice = 'e'

  endif

endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
      \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
  au!
  if !has("gui_running")
    autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
  endif
augroup END

" make dash(`-`) part of a word hel$lo-world
" 36 is `$`
" set iskeyword+=-,36
set iskeyword+=-
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
" set list listchars=tab:»·,trail:·,nbsp:·
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set number
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching brackets
" set colorcolumn=79
set scrolloff=6 " keep some more lines for scope
set lazyredraw

" windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase
" turn off search highlight
" nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>

" easy copy to system clipboard in visual mode
" vnoremap <leader>y "*y

" set foldenable " enable folding
" unfold every fold
set foldlevelstart=99
" set foldlevelstart=4 " with 4 levels folding open
" 10 nested fold max
set foldnestmax=10
set foldmethod=indent
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

set encoding=utf-8
scriptencoding utf-8
set hidden
set fileformats=unix,dos,mac
set visualbell
" Better display for messages
set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" sw -> shiftwidth, ts -> tabstop, sts -> softtabstop
augroup configgroup
  autocmd!
  " autocmd VimEnter * highlight clear SignColumn
  autocmd FileType python                  setlocal sw=4 ts=4 sts=4
  autocmd BufEnter Makefile                setlocal noexpandtab
  autocmd FileType go                      setlocal nolist
  autocmd BufEnter *.zsh-theme             setlocal filetype=zsh
  " sequence diagram
  autocmd BufEnter *.seq                   setlocal filetype=seq
  autocmd BufNewFile,BufRead Dockerfile*   setlocal filetype=dockerfile
  autocmd BufEnter *babelrc                setlocal filetype=json
  " wechat miniapp
  autocmd BufEnter *.wxss                  setlocal filetype=css
  autocmd BufEnter *.wxml                  setlocal filetype=html
  autocmd BufEnter *.svx                  setlocal filetype=html
  " jsonc
  autocmd FileType json syntax match Comment +\/\/.\+$+

  autocmd FileType gitcommit               setlocal spell
  " disable auto indent for pug files
  " noautoindent nocindent, nosmartindent, indentexpr=
  autocmd FileType pug                     setlocal noai nocin nosi inde=
  autocmd FileType beancount inoremap <Tab> <c-x><c-o>
augroup END

" restore last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

if has('persistent_undo')
  " set noswapfile
  set nobackup
  set nowritebackup
  set undodir=$HOME/.vim/undo-dir
  set backupdir=$HOME/.vim/backup
  set undofile
endif

" tmp
" nnoremap <c-j> gggqG
nnoremap <leader>z <C-Z>
" https://github.com/vim/vim/blob/master/runtime/plugin/matchparen.vim#L17
let g:matchparen_insert_timeout=5

" using OS clipboard
set clipboard=unnamed
" help ins-completion
" help i_^n
set hidden

" show syntax name under the cursor
" map <leader>x :echo "hi<"
"   \. synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"   \. synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"   \. synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" moving lines
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv

" math unicode https://www.fileformat.info/info/unicode/category/Sm/list.htm
" ⦂∘∙°֍ ༝࿏↬↯○◍

" startify
" let g:startify_custom_header = startify#pad(['🐝'])

" vista
nnoremap <silent> <leader>tt :Vista!!<CR>
nnoremap <silent> <leader>tf :Vista finder<CR>
" let g:vista_icon_indent = ["▸ ", ""]
" let g:vista_default_executive = 'coc'
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista_executive_for = {
      \ 'typescript': 'coc',
      \ 'typescriptreact': 'coc',
      \ }
let g:vista#renderer#icons = {
      \ 'class': '⧈',
      \ 'method': '',
      \ 'constant': '◍',
      \ 'function': '',
      \ 'variable': '∨',
      \ 'property': '◇',
      \ }

" instead of having ~/.vim/coc-settings.json
let s:LSP_CONFIG = {}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
endif

" for neovim-qt
if has('gui_running')
  " set guifont=JetBrains\ Mono:h15
  " set guifont=Input\ Mono:h13
  set guifont=Iosevka:h15
  " set guifont=SF\ Mono:h12
endif

set linespace=6

let $FZF_DEFAULT_COMMAND = 'fd --type file --color=always'
let $FZF_DEFAULT_OPTS = '--ansi'

" function to preserve cursor position after execute the command
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" <line1> is the first line of the range
" <line2> is the last line ...
" the `e` flag is used in the substitute command so no error is shown if trailing whitespace is not found
command! -range -nargs=0 StripTrailingWhitespaces :execute <line1>.','<line2>.'s:\s\+$::e'

let g:asyncrun_open = 8

"=== coc-actions https://github.com/iamcco/coc-actions
" Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"=== easymotion
" let g:EasyMotion_smartcase = 1
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)
" Move to line
" map <Leader>j <Plug>(easymotion-bd-jk)
" nmap <Leader>k <Plug>(easymotion-overwin-line)
" nmap f <Plug>(easymotion-bd-f)

" === ultisnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-j>"

"= coc-explorer
" :nmap <space>e :CocCommand explorer<CR>
command! -nargs=0 Render :CocCommand mdr.render

" skywind3000 asyncrun.vim
" command -nargs=* D :AsyncRun <args>
command -nargs=* D :Dispatch <args>

" tpope vim-fugitive
command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>

"=== plasticboy/vim-markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" nnoremap <silent> <leader>te :FloatermToggle<cr>

" https://github.com/neovim/neovim/pull/12279
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

" coc plugin development
set runtimepath^=/Users/hhan13/h/mdr-priv/packages/coc-mdr
" set runtimepath^='$HOME.'/h/mdr-priv/packages/coc-mdr'

"= coc-swagger
command -nargs=0 Swagger :CocCommand swagger.render

" hashivim/vim-terraform config
let g:terraform_fmt_on_save=1

" fix for macvim
if exists('&pythonthreedll')
  set pythonthreedll=/usr/local/Cellar/python@3.9/3.9.0_1/Frameworks/Python.framework/Versions/3.9/Python
endif

" coc highlight overrides
" hi CocUnderline cterm=NONE gui=NONE

" the underline highlight is annoying
" has to defer the the highlight
" not sure what's the exact issue
" probably coc will overrides our changes after it's loaded
autocmd VimEnter * call timer_start(200, { tid -> execute('hi CocWarningHighlight cterm=NONE gui=NONE')})
autocmd VimEnter * call timer_start(200, { tid -> execute('hi CocUnderline cterm=NONE gui=NONE')})
" CocUnderline   xxx cterm=underline gui=underline

" set runtimepath^=~/repo/h/coc-swagger/packages/coc-swagger

lua require'init'

au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>

" command -nargs=0 Reload lua package.loaded.init = nil <cr> " :source ~/.vimrc <cr>
" nmap <leader>ll  :lua package.loaded.init = nil <cr>:source ~/.vimrc <cr>

" lua vim.api.nvim_set_keymap('', 'f', ':HopChar1<CR>', {})
" lua vim.api.nvim_set_keymap('n', 's', ":HopChar2<CR>", {})
" lua vim.api.nvim_set_keymap('', '<leader>j', ":HopLine<CR>", { noremap = true, silent = true })

" set signcolumn=number

" highlight DiffAdd    guifg='#00ff00' guibg=#07242c
" highlight DiffChange guifg='#fff1ac' guibg=#07242c
" highlight DiffDelete guifg='#fc6195' guibg=#07242c

" highlight typescriptImport guifg='#111111' guibg=#fff1ac
command! -nargs=0 Out :CocCommand workspace.showOutput

" https://github.com/neoclide/coc-eslint/pull/118
augroup eslint8
  autocmd!
  autocmd BufEnter *.ts,*.tsx,*.js  set runtimepath^=~/tmp/coc-eslint
augroup END

let g:coc_disable_transparent_cursor = 1

" autocmd FileType typescript lua require'cmp'.setup.buffer {
" \   sources = {
" \     { name = 'nvim_lsp' },
" \     { name = 'ultisnips' },
" \     { name = 'buffer' },
" \     { name = 'dictionary', keyword_length = 2 },
" \   },
" \ }

" autocmd FileType json,yaml lua require'cmp'.setup.buffer {
" \   sources = {
" \     { name = 'buffer' },
" \     { name = 'dictionary', keyword_length = 2 },
" \   },
" \ }
