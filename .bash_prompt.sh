color_good="\001\e[38;2;77;255;112m\002"
color_good_bg="\001\e[48;2;77;255;112m\002"

color_ahead="\001\e[38;2;255;231;77m\002"
color_ahead_bg="\001\e[48;2;255;231;77m\002"

color_behind="\001\e[38;2;128;0;0m\002"
color_behind_bg="\001\e[48;2;128;0;0m\002"


bold="\001\e[1m\002"

getGitBranch(){
	if ! git branch --show-current &> /dev/null; then
		printf "\uE0B0"
		return
	fi
	
	
	if git status -sb | grep "behind" &> /dev/null;then
		printf "${bold}${color_behind_bg}\uE0B0\001\e[30m\002 $(git branch --show-current 2> /dev/null) \001\e[0m\002${color_behind}\uE0B0"
		return
	fi
	
	if git status -sb | grep "ahead" &> /dev/null;then
		printf "${bold}${color_ahead_bg}\uE0B0\001\e[30m\002 $(git branch --show-current 2> /dev/null) \001\e[0m\002${color_ahead}\uE0B0"
		return
	fi	
	
	printf "${bold}${color_good_bg}\uE0B0\001\e[30m\002 $(git branch --show-current 2> /dev/null) \001\e[0m\002${color_good}\uE0B0"
	
}

getCwd(){
	curdir=$(basename $(pwd))
	if [[ $curdir == $USER ]]; then
		printf "\001\e[38;2;255;255;255m\002\001\e[48;2;96;108;56m\002 ~/ \001\e[0m\002\001\e[38;2;96;108;56m\002\uE0B0"
		return
	fi
	printf "\001\e[38;2;255;255;255m\002\001\e[48;2;96;108;56m\002 $(basename $(realpath "$PWD/..") )/$curdir \001\e[0m\002\001\e[38;2;96;108;56m\002\uE0B0"
}

getJobs(){
	if [[ $1 -gt 0 ]];then
		color=255
	fi
	if [[ $1 -eq 0 ]]; then
		printf " $color_good\u221A No job "
		return
	fi
	printf "\001\e[1;38;2;$((color));120;120m\002 \u26A0 $1 Job(s) "
}

# First section (jobs)
PS1=$'\[\e[48;2;40;54;24m\]$(getJobs \j)\[\e[38;2;40;54;24m\]\[\e[48;2;245;133;73m\]\uE0B0 \[\e[0m\]\[\e[1;48;2;245;133;73m\]\[\e[30m\]'
# Second section (git user and branch)
PS1+=$'\[\e[48;2;245;133;73m\]$(git config --global user.name) \[\e[0m\]\[\e[1;38;2;245;133;73m\]$(getGitBranch)\n'
# Third section (working directory)
PS1+=$'\[\e[1m\]$(getCwd)\[\e[0m\] \$ '

export PS1
