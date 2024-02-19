function man() {
	# Get colors in manual pages
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		#echo "cwd: $cwd"
		#echo "tmp: $tmp"
		"cd" -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function c() {
	# Use `fzf` to `cd` into a directory
	#DIR=$(fd --hidden --no-ignore --type=directory | fzf)
	DIR=$(fd --type=directory --exclude='node_modules' --exclude='vendor' . ~/Documents/workspace/ | fzf)
	if [ $? -eq 0 ]; then
		cd "$DIR"
	fi
}
