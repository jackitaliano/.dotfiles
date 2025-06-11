test -f "$HOME/.env" && source $HOME/.env
test -f "$HOME/.zprofile" && source $HOME/.zprofile

alias vi=nvim
alias venv='source "$(pwd | cut -d"/" -f1-5)/.venv/bin/activate"'
