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
  git config${global} alias.st status
  git config${global} alias.ci commit 
  git config${global} alias.d diff
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

