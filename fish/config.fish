source ~/.config/fish/functions/abbr.fish
source ~/.config/fish/functions/zoxide.fish

set -U fish_history_max_entries 5000

contains /path $fish_user_paths; or set -Ua fish_user_paths /path

if [ -f "$HOME/fish/.keys" ]
    source ~/.config/fish/.keys
end

if [ -f "$HOME/anaconda3/bin/conda" ]
    eval "$HOME/anaconda3/bin/conda" "shell.fish" "hook" $argv | source
end

function fish_greeting
    #nothing
end

