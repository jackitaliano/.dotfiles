#!/usr/bin/env fish

function quick_fix
	set argc $(count $argv)

	if [ $argc -eq 1 ]
		set selected_pretty $1
	else
		set selected_pretty $(printf "$(find ~/projects ~/.dotfiles -mindepth 1 -maxdepth 3 \( -name '.*' -o -name 'node_modules' \) -prune -o -type f -print )" | sed "s|^/Users/$USER/|~/|" | \
		fzf  --preview 'bat --color=always --theme=OneHalfDark $(echo {} | sed "s|^~/|/Users/$USER/|")' --height=100% --padding=2 --border=double --prompt='➤ ' --pointer='→' --preview-label='⟨ File Contents ⟩' --header='Quick Fix' --header-first --color='fg:magenta'
	)
	end

	if [ -z $selected_pretty ]
		return 0
	end

	set selected $(echo $selected_pretty | sed "s|^~/|/Users/$USER/|")
	set selected_name $(basename "$selected" | tr . _)
	nvim $selected

	return 0
end
