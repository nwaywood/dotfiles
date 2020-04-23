# This theme is my own concoction, inspired by a mix between pure prompt and spaceship-prompt

# Available theme color names: red, green, yellow, blue, magenta, cyan, white, black
# Useful symbols ➜ ✗ ❮ ❯

local ret_status="%(?:%{$fg_bold[green]%}❯:%{$fg_bold[red]%}❯)"

# %n prints the username (e.g. nick) and %m prints the machine (e.g. nicks-macbook)
# PROMPT=$'$fg_bold[cyan]%n: %{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)
# ${ret_status}%{$reset_color%} '
PROMPT=$'%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info) $(git_remote_status)
${ret_status}%{$reset_color%} '

# RPROMPT info for vi-mode
MODE_INDICATOR="%{$fg[red]%}❮❮❮%{$reset_color%}"

# local git status
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}on %{$reset_color%}%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# remote git status
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[red]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[red]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[red]%}↕%{$reset_color%}"

