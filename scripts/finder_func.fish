#!/usr/bin/env fish

function finder
	set argc $(count $argv)

	if [ $argc -eq 1 ]
		set selected $1
	else
		set selected $(printf "$(find ~/projects ~/.dotfiles -mindepth 1 -maxdepth 1 -type d | grep -v '/\.[^/]*$')\n$HOME/.dotfiles" | \
		fzf  --preview 'ls -AFh --color {} | bat --style=grid' --height=75% --margin=10%,5%,5%,10% --padding=2 --border=double --prompt='➤ ' --pointer='→' --preview-label='⟨ Directory Contents ⟩' --header='Finder' --header-first --color='fg:magenta'
	)
	end

	if [ -z $selected ]
		return 0
	end

	set selected_name $(basename "$selected" | tr . _)
	cd $selected

	return 0
end
