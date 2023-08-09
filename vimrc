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

lua require'init'

set complete+=kspell

let g:loaded_python_provider = 0
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
" pip3 install pynvim

" Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" nnoremap <leader>u :UndotreeToggle<cr>   " toggle undotree

" ≀ ∙ ⦂ ◍ ⦿ ⦰ ⦸ ⨂

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" let g:mkdp_markdown_css = expand('$HOME/md.css')
" let g:home = expand('$HOME')
" Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] }
" Plug 'nathangrigg/vim-beancount', { 'for': 'beancount' }

" set updatetime=300

nnoremap <silent> <c-p> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <silent> <c-l> <cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <silent> <leader>ga <cmd>lua require('fzf-lua').grep_cword()<CR>
nnoremap <silent> <leader>gb <cmd>lua require('fzf-lua').grep()<CR>

" nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
" nnoremap <silent> <leader><Enter> :Buffers<CR>


" use null-ls
" nnoremap <silent> gp :lua vim.lsp.buf.format({ async = true })<CR>

" Plug 'haishanh/zephyr-nvim', { 'branch':'haishan' }
" Plug '$HOME/repo/h/quant-zone-priv/vim-tx'
" Plug '$HOME/repo/h/quant-zone-priv/vim-fe'

" highlight Comment cterm=italic

" if has('nvim')
"   tnoremap <Esc> <C-\><C-n>
"   tnoremap <A-[> <Esc>
"   tnoremap <A-h> <c-\><c-n><c-w>h
"   tnoremap <A-j> <c-\><c-n><c-w>j
"   tnoremap <A-k> <c-\><c-n><c-w>k
"   tnoremap <A-l> <c-\><c-n><c-w>l
"   nnoremap <A-h> <c-w>h
"   nnoremap <A-j> <c-w>j
"   nnoremap <A-k> <c-w>k
"   nnoremap <A-l> <c-w>l
" endif

"""" common key binding
" switch to next buffer
nnoremap <leader>. :bn<CR>
nnoremap ]b :bn<CR>
" switch to previous buffer
nnoremap <leader>, :bp<CR>
nnoremap [b :bp<CR>

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
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
" inoremap <C-h> <C-o>h
" inoremap <C-l> <C-o>l
" inoremap <C-^> <C-o><C-^>

set autoread
set autowriteall

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

" windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

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
" set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c

set number relativenumber
set nu rnu

" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" sw -> shiftwidth, ts -> tabstop, sts -> softtabstop
augroup configgroup
  autocmd!
  autocmd FileType python                  setlocal sw=4 ts=4 sts=4
  autocmd FileType beancount inoremap <Tab> <c-x><c-o>
augroup END

" tmp
" nnoremap <c-j> gggqG
nnoremap <leader>z <C-Z>

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
"  ↗↙⋇⟡*═╔╗╚╝║∙◽◼▪→▶▷▸▹⇒⇨◉๏⦿⊙○●⭗⭘⭘
" ────── ∗ ⋅◈⋅ ∗ ──────

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

" for neovim-qt
if has('gui_running')
  " set guifont=JetBrains\ Mono:h15
  " set guifont=Input\ Mono:h13
  set guifont=Iosevka:h15
  set linespace=6
  " set guifont=SF\ Mono:h12
endif


let $FZF_DEFAULT_COMMAND = 'fd --type file --color=always'
let $FZF_DEFAULT_OPTS = '--ansi'

" <line1> is the first line of the range
" <line2> is the last line ...
" the `e` flag is used in the substitute command so no error is shown if trailing whitespace is not found
command! -range -nargs=0 StripTrailingWhitespaces :execute <line1>.','<line2>.'s:\s\+$::e'

let g:asyncrun_open = 8

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
" command -nargs=* D :Dispatch <args>

" tpope vim-fugitive
command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>

" nnoremap <silent> <leader>te :FloatermToggle<cr>

" https://github.com/neovim/neovim/pull/12279
" augroup highlight_yank
"   autocmd!
"   autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
" augroup END

" coc plugin development
set runtimepath^=/Users/hhan13/h/mdr-priv/packages/coc-mdr
" set runtimepath^='$HOME.'/h/mdr-priv/packages/coc-mdr'

"= coc-swagger
command -nargs=0 Swagger :CocCommand swagger.render

" coc highlight overrides
" hi CocUnderline cterm=NONE gui=NONE

" the underline highlight is annoying
" has to defer the the highlight
" not sure what's the exact issue
" probably coc will overrides our changes after it's loaded
" autocmd VimEnter * call timer_start(200, { tid -> execute('hi CocWarningHighlight cterm=NONE gui=NONE')})
" autocmd VimEnter * call timer_start(200, { tid -> execute('hi CocUnderline cterm=NONE gui=NONE')})

" set runtimepath^=~/repo/h/coc-swagger/packages/coc-swagger

au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>

" command -nargs=0 Reload lua package.loaded.init = nil <cr> " :source ~/.vimrc <cr>
" nmap <leader>ll  :lua package.loaded.init = nil <cr>:source ~/.vimrc <cr>

" set signcolumn=number

" highlight DiagnosticVirtualTextError guifg='#fff1ac' guibg=#07242c
"
" highlight DiffAdd    guifg='#00ff00' guibg=#07242c
" highlight DiffChange guifg='#fff1ac' guibg=#07242c
" highlight DiffDelete guifg='#fc6195' guibg=#07242c

" highlight MatchParen guifg='#a39155' guibg='#f1e6c0' cterm=NONE gui=NONE
highlight MatchParen guibg='#606060' cterm=NONE gui=NONE

" highlight typescriptImport guifg='#111111' guibg=#fff1ac
command! -nargs=0 Out :CocCommand workspace.showOutput
command! -nargs=0 Push :Dispatch gitupdate .

" https://github.com/neoclide/coc-eslint/pull/118
augroup eslint8
  autocmd!
  autocmd BufEnter *.ts,*.tsx,*.js  set runtimepath^=~/tmp/coc-eslint
augroup END

" make it short since i keep forgeting this
command! -nargs=0 Bye :Sayonara
command! -nargs=0 Noh  :nohlsearch

""" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
" autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
" vim.lsp.buf.format({ async = true })

command! -nargs=0 Rename :TSLspRenameFile
" https://github.com/nvim-telescope/telescope-project.nvim
command! -nargs=0 Proj lua require'telescope'.extensions.project.project{ display_type = 'full' }
command! -nargs=0 BufOnly :%bd|e#
command! -nargs=0 DeleteThisFile :call delete(expand('%'))

nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" autocmd FileType typescript lua require'cmp'.setup.buffer {
" \   sources = {
" \     { name = 'nvim_lsp' },
" \     { name = 'ultisnips' },
" \     { name = 'buffer' },
" \     { name = 'dictionary', keyword_length = 2 },
" \   },
" \ }

" new in neovim 0.8
set winbar=%f
" in newovim 0.8" this now only check comments
" set spell
