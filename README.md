
## vim

### vimrc

create symlink `~/.vimrc` points to `vimr` in the repo

### neovim

create symlink `~/.config/nvim/init.vim` points to `~/.vimr`

### plugins setup

plugins are managed by [`junegunn/vim-plug`](https://github.com/junegunn/vim-plug/)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

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
