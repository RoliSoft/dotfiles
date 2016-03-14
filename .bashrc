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
PS1DIR="\e[33m\w\e[34m"

if [[ ! $PS1TTL =~ (Cygwin|Msys) ]]; then
	PS1TTL="\u@\h"
elif [[ $PS1TTL =~ Cygwin ]]; then
	PS1DIR='$(pwd="\e[33m\w\e[34m";pwd=${pwd/\/cygdrive\/c\/Users\/\u\/Desktop/≈};echo $pwd)'
elif [[ $PS1TTL =~ Msys ]]; then
	PS1TTL="MSYS2"
	PS1DIR='$(pwd="\e[33m\w\e[34m";pwd=${pwd/\/c\/Users\/\u\/Desktop/≈};echo $pwd)'
fi

PS1="\[\e]0;$PS1TTL \w\a\]$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] $PS1DIR \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "
PS2="> "
PS3="> "
PS4="+ "

unset PS1TTL
unset PS1DIR

alias ls="ls --color=auto"
alias grep="grep --color=auto"

#export LANGUAGE=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
