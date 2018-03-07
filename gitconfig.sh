#!/bin/bash
# ~/.gitconfig

git_config() {
  global=${1}
  git config${global} user.name "Haishan"
  git config${global} user.email haishanhan@gmail.com

  git config${global} core.editor vim
  git config${global} color.ui true

  git config${global} protocol.version 2

  # alias
  git config${global} alias.s status
  git config${global} alias.ci commit
  git config${global} alias.fo "fetch origin"
  git config${global} alias.co checkout
  git config${global} alias.r "remote -v"
  git config${global} alias.d '!f() { [ -z "$GIT_PREFIX" ] || cd "$GIT_PREFIX" && git diff --color "$@" | diff-so-fancy  | less --tabs=4 -RFX; }; f'
  git config${global} alias.ds "diff --shortstat"
  git config${global} alias.l "log --pretty=oneline --graph --abbrev-commit"
  git config${global} alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
}

if [ -z ${1} ]; then
  echo "parameter needed"
  exit 1
fi

if [ ${1} == "local" ]; then
  git_config ""
  exit 0
fi

if [ ${1} == "global" ]; then
  git_config " --global"
  exit 0
fi

