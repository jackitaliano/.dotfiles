test -e "$HOME/.env"; and source $HOME/.env
test -e "$HOME/.keys"; and source $HOME/.keys
test -e "$HOME/.tmux_path"; and set -x TMUX_PATH (cat $HOME/.tmux_path)

set -U fish_history_max_entries 5000

contains $localBin $fish_user_paths; or fish_add_path "$HOME/.local/bin"
contains $localBinScripts $fish_user_paths; or fish_add_path "$HOME/.local/bin/scripts"

status is-interactive || exit 0

contains $brewBin $fish_user_paths; or fish_add_path /opt/homebrew/bin
set -x HOMEBREW_NO_ANALYTICS 1

source $HOME/.config/fish/functions/abbr.fish
source $HOME/.local/bin/scripts/source_funcs.fish

#source ./functions/pyenv.fish
