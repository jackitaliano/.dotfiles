if [ -f "$HOME/.env" ]; then
	source ~/.env
fi
if [ -f "$HOME/.keys" ]; then
	source ~/.keys
fi
if [ -f "$HOME/.zprofile" ]; then
	source ~/.zprofile
fi

alias vi=nvim
alias venv='source "$(pwd | cut -d"/" -f1-5)/.venv/bin/activate"'
