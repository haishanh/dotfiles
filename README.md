
```
# node / fnm https://github.com/Schniz/fnm
brew install fnm

# git
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# kitty
ln -s $PWD/kitty.conf ~/.config/kitty/kitty.conf

# vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/vimrc ~/.config/nvim/init.vim
ln -s $PWD/nvim/lua ~/.config/nvim/lua
```

### plugins setup

plugins are managed by [`junegunn/vim-plug`](https://github.com/junegunn/vim-plug/)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```vim
call plug#begin('~/.vim/bundle')
```

### UltiSnips

```
ln -s $PWD/UltiSnips ~/.vim/UltiSnips
```

### neosnippet snippets

in `.vimrc`

```vim
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory='~/.vim/snips'
```

create symlink `~/.vim/snips` points `snips` in the repo

### coc

```
ln -s $PWD/coc-settings.json ~/.config/nvim/coc-settings.json
```

## Others

```
note -> /Users/haishan/nutstore/50-note
```
