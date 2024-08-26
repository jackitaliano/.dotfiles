source ~/.config/fish/functions/abbr.fish
source ~/.config/fish/functions/zoxide.fish

source ~/.dotfiles/scripts/source_funcs.fish

set -U fish_history_max_entries 5000

set localBinScripts "$HOME/.local/bin/scripts"
set localBin "$HOME/.local/bin"
set brewBin "/opt/homebrew/bin"
# set cargoBin "$HOME/.cargo/bin"
set condaBin "$HOME/anaconda3/bin"

contains $localBin $fish_user_paths; or fish_add_path $localBin
contains $localBinScripts $fish_user_paths; or fish_add_path $localBinScripts
contains $brewBin $fish_user_paths; or fish_add_path $brewBin
# contains $cargoBin $fish_user_paths; or fish_add_path $cargoBin
contains $condaBin $fish_user_paths; or fish_add_path $condaBin

if [ -f "$HOME/fish/.keys" ]
    source ~/.config/fish/.keys
end

if [ -f "$HOME/anaconda3/bin/conda" ]
    eval "$HOME/anaconda3/bin/conda" "shell.fish" "hook" $argv | source
end
