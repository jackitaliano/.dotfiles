if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -a "$HOME/.local/bin"

source ~/.config/fish/functions/abbr.fish
source ~/.config/fish/functions/zoxide.fish

function fish_greeting
    #nothing
end
