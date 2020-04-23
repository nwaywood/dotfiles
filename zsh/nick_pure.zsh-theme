# this theme is a combination of the robbyrussel theme and the frisk theme

# local ret_status="%(?:%{$fg_bold[magenta]%}➜ :%{$fg_bold[red]%}➜ )"
local ret_status="%(?:%{$fg_bold[magenta]%}❯:%{$fg_bold[red]%}❯)"

# %n prints the username (e.g. nick) and %m prints the machine (e.g. nicks-macbook)
# PROMPT=$'$fg_bold[cyan]%n: %{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)
# ${ret_status}%{$reset_color%} '
PROMPT=$'%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)
${ret_status}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}on %{$reset_color%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

