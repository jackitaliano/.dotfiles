test -e "$HOME/.config/fish/.env";
    and source ~/.config/fish/.env

test -e "$HOME/.keys";
    and source ~/.keys


set -x TMUX_PATH (cat $HOME/.config/fish/.tmux_path)
set -x PATH "/opt/homebrew/bin:$HOME/bin/:$PATH"
set -x HOMEBREW_NO_ANALYTICS 1

source ~/.config/fish/functions/abbr.fish
source ~/.dotfiles/scripts/source_funcs.fish

set -U fish_history_max_entries 5000

set -l localBinScripts "$HOME/.local/bin/scripts"
set -l localBin "$HOME/.local/bin"
set -l brewBin /opt/homebrew/bin
set -l projectPaths "$HOME/projects"

contains $localBin $fish_user_paths; or fish_add_path $localBin
contains $localBinScripts $fish_user_paths; or fish_add_path $localBinScripts
contains $brewBin $fish_user_paths; or fish_add_path $brewBin
