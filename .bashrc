# /etc/bash.bashrc
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend

if type -P dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
		eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval $(dircolors -b /etc/DIR_COLORS)
	fi
fi

PS1TTL=$(uname -o)
PS1DIR="\w"

if [[ ! ${PS1TTL} =~ (Cygwin|Msys) ]]; then
	PS1TTL="\u@\h"
elif [[ ${PS1TTL} =~ Cygwin ]]; then
	PS1DIR='$(pwd="\w";pwd=${pwd/\/cygdrive\/c\/Users\/\u\/Desktop/≈};echo $pwd)'
elif [[ ${PS1TTL} =~ Msys ]]; then
	PS1TTL="MSYS2"
	PS1DIR='$(pwd="\w";pwd=${pwd/\/c\/Users\/\u\/Desktop/≈};echo $pwd)'
fi

if [[ ${EUID} == 0 ]]; then
	PS1USR="\[\e[91m\]\h"
else
	PS1USR="\[\e[92m\]\u@\h"
fi

__set_exit_code () {
	EXIT_CODE="$?"
}

PROMPT_COMMAND=__set_exit_code
PS1="\[\e]0;$PS1TTL \w\a\]$PS1USR \[\e[38;5;075m\]$PS1DIR \[\$(if [[ \${EXIT_CODE} == 0 ]]; then echo '\e[93m'; else echo '\e[91m'; fi)\]\\$\[\e[39m\] "
PS2="> "
PS3="> "
PS4="+ "

unset PS1USR
unset PS1TTL
unset PS1DIR

alias ls="ls --color=auto"
alias grep="grep --color=auto"

man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	command man "$@"
}

#export LANGUAGE=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

export DISPLAY=:0.0
