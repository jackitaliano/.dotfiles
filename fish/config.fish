if test -e "$HOME/.config/fish/.env"
    source ~/.config/fish/.env
else
    echo "no .env loaded"
end
if test -e "$HOME/.keys"
    source ~/.keys
else
    echo "no .keys loaded"
end

source ~/.config/fish/functions/abbr.fish
#source ~/.config/fish/functions/zoxide.fish
source ~/.dotfiles/scripts/source_funcs.fish

set -U fish_history_max_entries 5000

set localBinScripts "$HOME/.local/bin/scripts"
set localBin "$HOME/.local/bin"
set brewBin /opt/homebrew/bin

contains $localBin $fish_user_paths; or fish_add_path $localBin
contains $localBinScripts $fish_user_paths; or fish_add_path $localBinScripts
contains $brewBin $fish_user_paths; or fish_add_path $brewBin

export PATH="/opt/homebrew/bin:$HOME/bin/:$PATH"
export HOMEBREW_NO_ANALYTICS=1
