#!/usr/bin/env fish

function finder
	set argc $(count $argv)
	
	if [ $argc -eq 1 ]
		set dir $argv[1]
		set selected_pretty $(find $dir -mindepth 1 -maxdepth 10 \( -name '.*' -o -name 'node_modules' \) -prune -o -type d -print | sed "s|^/Users/$USER/|~/|" | \
		fzf  --preview 'ls -AFh --color $(echo {} | sed "s|^~/|/Users/$USER/|") | bat --color=always --theme=OneHalfDark' --height=100% --padding=2 --border=double --prompt='➤ ' --pointer='→' --preview-label='⟨ Directory Contents ⟩' --header='Finder - ⟨ Work Dir ⟩' --header-first --color='fg:magenta'
		)
	else
		set selected_pretty $(printf "$(find ~/projects ~/.dotfiles -mindepth 1 -maxdepth 3 \( -name '.*' -o -name 'node_modules' \) -prune -o -type d -print )\n$HOME/.dotfiles" | sed "s|^/Users/$USER/|~/|" | \
		fzf  --preview 'ls -AFh --color $(echo {} | sed "s|^~/|/Users/$USER/|") | bat --color=always --theme=OneHalfDark' --height=100% --padding=2 --border=double --prompt='➤ ' --pointer='→' --preview-label='⟨ Directory Contents ⟩' --header='Finder - ⟨ All ⟩' --header-first --color='fg:magenta'
	)
	end

	if [ -z $selected_pretty ]
		return 0
	end

	set selected $(echo $selected_pretty | sed "s|^~/|/Users/$USER/|")
	set selected_name $(basename "$selected" | tr . _)
	cd $selected

	return 0
end
