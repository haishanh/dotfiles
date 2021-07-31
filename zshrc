#-
# zinit update  : to update zinit
#-

# # disable auto window rename in tmux
# export DISABLE_AUTO_TITLE="true"

# https://github.com/robbyrussell/oh-my-zsh/issues/6654
# fix - pasting brackets gets escaped
DISABLE_MAGIC_FUNCTIONS=true

# clean this var for pure theme to take control of displaying venv info
VIRTUAL_ENV_DISABLE_PROMPT=""

source ~/.commonrc

PURE_PROMPT_SYMBOL="$"
# prompt pure

# added by travis gem
# [ -f /Users/haishan/.travis/travis.sh ] && source /Users/haishan/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# unalias gm

# yarn
# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
export PATH="$HOME/.usr/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# fnm
eval "$(fnm env)"

# source /Users/haishan/Library/Preferences/org.dystroy.broot/launcher/bash/br

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk


zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# lucid causes the under-prompt message saying
# Loaded zsh-users/zsh-autosuggestions that normally
# appears for every Turbo-loaded plugin to NOT show
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# zinit ice wait'!' lucid
# zinit snippet OMZ::themes/dstufft.zsh-theme

# Load the pure theme, with zsh-async library that's bundled with it.
# PS1="$ " # provide a nice prompt till the theme loads
# zinit ice wait'!' pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure

# ls with colors
export CLICOLOR=1

alias l='exa'
alias ll='exa -abghHliS'
alias i='cat ~/i'
alias see='hub browse'
alias f="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias d='dirs -v | head -10'
# alias 1='cd -'
# alias 2='cd -2'
# alias 3='cd -3'
# alias 4='cd -4'
# alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'

cdd() { for i in $(seq 1 "$1"); do cd ..; done }

# smart case
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

#---------- history
#--- https://github.com/mattjj/my-oh-my-zsh/blob/master/history.zsh

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=10000000
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
# setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt hist_verify               # Don't execute immediately upon history expansion.
#-- ignorespace | don't save lines which begin with a <space> character
#-- ignoredups  | don't save lines matching the previous history entry
#-- ignoreboth  | use both 'ignorespace' and 'ignoredups'
#-- erasedups   | eliminate duplicates across the whole history
# export HISTCONTROL=ignoreboth:erasedups

setopt autocd

# ctrl-a to move the begin of the line
# ctrl-e to move to then end of the line
# etc.
bindkey -e

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/repo/o/z.lua/z.lua ] && eval "$(lua ~/repo/o/z.lua/z.lua --init zsh)"

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

# acme
# . "/Users/hhan13/.acme.sh/acme.sh.env"

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"
