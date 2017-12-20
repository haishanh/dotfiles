
## vim

### plugins setup

plugins are managed by `junegunn/vim-plug`

```vim
call plug#begin('~/.vim/bundle')
```


### neosnippet snippets

in `.vimrc`

```vim
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory='~/.vim/snips'
```

create symlink `~/.vim/snips` points `snips` in the repo
