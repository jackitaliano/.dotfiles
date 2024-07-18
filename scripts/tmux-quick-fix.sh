#!/usr/bin/env bash

if [ $# -eq 1 ]; then
	selected_pretty=$1
else
	selected_pretty=$(printf "$(find ~/projects ~/.dotfiles -mindepth 1 -maxdepth 3 \( -name '.*' -o -name 'node_modules' \) -prune -o -type f -print )" | sed "s|^/Users/$USER/|~/|" | \
		fzf  --preview 'bat --color=always --theme=OneHalfDark $(echo {} | sed "s|^~/|/Users/$USER/|")' --height=100% --padding=2 --border=double --prompt='➤ ' --pointer='→' --preview-label='⟨ File Contents ⟩' --header='Quick Fix' --header-first --color='fg:magenta'
)
fi

if [ -z $selected_pretty ]; then
	exit 0
fi

selected=$(echo $selected_pretty | sed "s|^~/|/Users/$USER/|")
selected_name=$(basename "$selected" | tr . _)
nvim $selected
