# af-magic.zsh-theme
# This is a modified version, by RoliSoft.
# Original theme:
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then
	NCOLOR="red";
	NUSER="%{$fg_bold[$NCOLOR]%}%m";
else
	NCOLOR="green";
	NUSER="%{$fg_bold[$NCOLOR]%}%n@%m";
fi
#local return_code="%(?..%{$fg[red]%}:(%{$reset_color%})"

# primary prompt
PROMPT='${NUSER}%{$reset_color%}%\ \
$FG[075]%~ \
%(?..%{$fg[red]%}:( %{$reset_color%})\
$FG[214]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
#eval my_gray='$FG[237]'
#eval my_orange='$FG[214]'

# right prompt
#if type "virtualenv_prompt_info" > /dev/null
#then
#	RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
#else
#	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
#fi

# git settings
#ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
