#!/bin/bash
# ~/.gitconfig


git_config()
{
  global=${1}
  git config${global} user.name "haishanh"
  git config${global} user.email haishanhan@gmail.com

  git config${global} core.editor vim

  git config${global} color.ui true

  # alias
  git config${global} alias.s status
  git config${global} alias.ci commit
  git config${global} alias.r "remote -v"
  git config${global} alias.d diff
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

