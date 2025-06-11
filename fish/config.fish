if status is-interactive && test -f ~/.config/fish/custom/fzf.fish
  source ~/.config/fish/custom/fzf.fish
  fzf_key_bindings

  # activate zoxide
  # zoxide init fish | source
  z

  # https://github.com/atuinsh/atuin
  # atuin init fish | source
end

# fish_add_path: with -P we Manipulate PATH directly (not adding to ~/.config/fish/fish_variables fish_user_paths)
fish_add_path -P ~/.usr/bin
# go / golang
fish_add_path -P ~/go/bin
# rust / cargo / rustup
fish_add_path -P ~/.cargo/bin
# python uv
fish_add_path -P ~/.local/bin
# homebrew ruby
fish_add_path -P /opt/homebrew/opt/ruby/bin

set --global --export HOMEBREW_PREFIX "/opt/homebrew";
set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set --global --export HOMEBREW_REPOSITORY "/opt/homebrew";
fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end;
if not contains "/opt/homebrew/share/info" $INFOPATH; set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH; end;

# set -x https_proxy http://127.0.0.1:7890
# set -x http_proxy http://127.0.0.1:7890
# set -x all_proxy socks5://127.0.0.1:7890
# set -x HTTPS_PROXY http://127.0.0.1:7890
# set -x HTTP_PROXY http://127.0.0.1:7890
# set -x ALL_PROXY socks5://127.0.0.1:7890

set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# no proxy
# https_proxy= http_proxy= all_proxy= HTTPS_PROXY= HTTP_PROXY= ALL_PROXY=

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

zoxide init fish | source

alias ls eza
# alias vim nvim

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.usr/lib/google-cloud-sdk/path.fish.inc" ]; . "$HOME/.usr/lib/google-cloud-sdk/path.fish.inc"; end
