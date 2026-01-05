fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
fnm env --use-on-cd | source

# fnm
set FNM_PATH "/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]
  fnm env | source
end
