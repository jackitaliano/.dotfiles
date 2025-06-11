#!/usr/bin/env fish

function add_tmux_path

	set argc (count $argv)
	if test $argc != 1
		return 1
	end


	set tmux_path_fp "$HOME/.tmux_path"

	set path $argv[1]
	export TMUX_PATH="$TMUX_PATH:$path"
	echo "path: $path"

	sed -i '' '1!d' $tmux_path_fp
	sed -i '' "1s|\$|:$path|" $tmux_path_fp
	echo "added to tmux path"
end
