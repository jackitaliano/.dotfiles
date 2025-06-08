# git clone new project
function gcnp
	set argc (count $argv)

	test $argc -eq 1 \
		&& set url $argv[1] \
		|| set url $(pbpaste)

	set repo_path (string split ':' $url)[2]

	set name $(basename -s .git $repo_path)

	set slash_count (echo $repo_path | grep -o '/' | wc -l)

	# git@github.com:user/repo.git

	if test $slash_count -eq 1
		if test -d "$HOME/projects/$name"
			echo "repo already exists"
			return 1
		end

		git clone "$url" "$HOME/projects/$name"

		return 0
	end

	# git@github.com:user/project/repo.git

	if test $slash_count -eq 2
		set project_name (string split '/' $repo_path)[2]

		if not test -d "$HOME/projects/$project_name"
			echo "created new project."
			mkdir $HOM/projects/$project_name
			add_tmux_path "\$HOME/projects/$project_name"
		end

		if test -d "$HOME/projects/$project_name/$name"
			echo "repo already exists"
			return 1
		end

		git clone "$url" "$HOME/projects/$project_name/$name"

		return 0
	end

	# git@github.com:user/project/subproject/repo.git

	if test $slash_count -eq 3
		set project_name (string split '/' $repo_path)[2]
		set subproject_name (string split '/' $repo_path)[3]

		if not test -d "$HOME/projects/$project_name"
			echo "created new project."
			mkdir $HOM/projects/$project_name
			add_tmux_path "\$HOME/projects/$project_name"
		end

		if not test -d "$HOME/projects/$project_name/$subproject_name"
			echo "created new subproject."
			mkdir $HOM/projects/$project_name/$subproject_name
			add_tmux_path "\$HOME/projects/$project_name/$subproject_name"
		end

		if test -d "$HOME/projects/$project_name/$subproject_name/$name"
			echo "repo already exists"
			return 1
		end

		git clone "$url" "$HOME/projects/$project_name/$subproject_name/$name"

		return 0
	end

	echo "invalid url: $url"
	return 1
end
