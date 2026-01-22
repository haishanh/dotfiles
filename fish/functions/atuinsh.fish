# moidified based on "atuin init fish"
# "set -gx ATUIN_SESSION (atuin uuid)" is already done in config.fish
function atuinsh --description 'alias http=uvx --from httpie http'
    set -l ATUIN_H (ATUIN_SHELL=fish ATUIN_LOG=error ATUIN_QUERY=(commandline -b) atuin search --keymap-mode=$keymap_mode $argv -i 3>&1 1>&2 2>&3 | string collect)
    if test -n "$ATUIN_H"
        if string match --quiet '__atuin_accept__:*' "$ATUIN_H"
          set -l ATUIN_HIST (string replace "__atuin_accept__:" "" -- "$ATUIN_H" | string collect)
          commandline -r "$ATUIN_HIST"
          commandline -f repaint
          # commandline -f execute
          return
        else
          commandline -r "$ATUIN_H"
        end
    end

    commandline -f repaint
end
