# This theme is my own concoction, inspired by a mix between pure prompt and spaceship-prompt

# Available theme color names: red, green, yellow, blue, magenta, cyan, white, black
# Useful symbols ➜ ✗ ❮ ❯

# Prompt codes
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host

local ret_status="%(?:%{$fg_bold[green]%}❯:%{$fg_bold[red]%}❯)"

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
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[red]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[red]%}↕%{$reset_color%}"

