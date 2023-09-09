#!/bin/bash
homeDir="~"
configDir="~/.config"

homeFiles=(".zshrc" ".oh-my-zsh" ".tmux" ".p10k.zsh")
configFiles=("nvim" "tmux")

function backupAndLink() {
	if [ -z "$1" ]; then
		echo "Error: No argument for root dir"
		return 1
	fi

	if [ -z "$2" ]; then
		echo "Error: No argument pass for files"
		return 1
	fi

	local root=$1
	local files=$2

	for f in "${files[@]}"; do
		local fp="${root}/${f}"

		# Backup if already exists
		[ -f "${fp}" ] && mv $fp "${fp}.bak"

		# Link
		ln -s "~/.dotfiles/${f}" "${fp}"	
	done
}

backupAndLink $homeDir $homeFiles
backupAndLink $configDir $configFiles
