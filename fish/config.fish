if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -a "$HOME/.local/bin"
fish_add_path -a "/opt/homebrew/bin"

source ~/.config/fish/functions/abbr.fish
source ~/.config/fish/functions/zoxide.fish
source ~/.config/fish/.keys

function fish_greeting
    #nothing
end
