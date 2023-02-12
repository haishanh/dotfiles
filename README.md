```bash
# node / fnm https://github.com/Schniz/fnm
brew install fnm

# git config
ln -s $PWD/gitconfig ~/.gitconfig

# kitty
ln -s $PWD/kitty.conf ~/.config/kitty/kitty.conf
ln -s $PWD/kitty/snazzy.conf ~/.config/kitty/snazzy.conf

# vim - see setup
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

## Others

```
note -> /Users/haishan/nutstore/50-note
```

vscode snippets via `L3MON4D3/LuaSnip`

```
ln -s ~/dotfiles/nvim/vscode-snips ~/.config/nvim/vscode-snips
```
