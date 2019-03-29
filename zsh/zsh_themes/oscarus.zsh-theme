# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[grey]%} \uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ! "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[orange]%} ● "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} √ "

get_start() {
	echo -n "%{$fg[grey]%},-%{$reset_color%}"
}

get_pwd() {
	echo -n "%{$fg_bold[grey]%}[%{$fg_bold[green]%}${PWD/#$HOME/~}%{$fg_bold[grey]%}]%{$reset_color%}"
}

get_git() {
	echo -n "$(git_prompt_info)%{$reset_color%}"
}

get_host() {
	echo -n "%{$fg_bold[grey]%} %n@%{$fg_bold[grey]%}%m%{$reset_color%}"
}

get_time() {
	echo -n "%{$fg_bold[green]%} ⌚ %*%{$reset_color%}"
}

get_end() {
	echo "%{$fg[grey]%}\`-%{$fg_bold[green]%}-> %{$reset_color%}"
}

get_length() {
}

get_space() {

	local termwidth
	(( termwidth = ${COLUMNS} - get_length ))

	local spacing=""
	for i in {1..$termwidth}; do
	    spacing="${spacing}-"
	done
	echo -n "%{$fg[grey]%}$spacing"
}

build_prompt() {
	get_start
	get_pwd
	get_git
	# get_space
	get_host
	echo ''
	get_end
	plain_start=$(get_start | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
	plain_git=$(get_git | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
	plain_pwd=$(get_pwd | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
	plain_host=$(get_host | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
	end=$(get_end | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
	# echo ${#plain_start}
	# echo ${#plain_git}
	# echo ${#get_pwd}
	# echo ${#get_host}
	# echo ${#get_end}
	# echo ${#get_length}
}

PROMPT='$(build_prompt)'
RPROMPT='$(get_time)'

