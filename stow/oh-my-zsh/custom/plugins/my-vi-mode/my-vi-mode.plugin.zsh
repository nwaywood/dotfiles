# Updates editor information when the keymap changes.
function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi-accept-line() {
  VI_KEYMAP=main
  zle accept-line
}

zle -N vi-accept-line


bindkey -v

# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' vi-accept-line
bindkey -M vicmd '^M' vi-accept-line

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# NOTE: Function to be called from a theme to insert a prompt symbol based on the vi mode
# It is expected that the theme will set the NORMAL_MODE and INSERT_MODE variables
function vim_mode_prompt_info() {
  local vi_mode="${${VI_KEYMAP/vicmd/$NORMAL_MODE}/(main|viins)/$INSERT_MODE}" 

  # When a new terminal instance is launched, it doesn't seem to be in any vi_mode
  # therefore set the INSERT_MODE prompt as the default
  if [[ "${vi_mode}" == "" ]]; then
    echo "$INSERT_MODE"
  else
    echo "${vi_mode}"
  fi
}

# if INSERT_MODE wasn't setup by theme, define default
if [[ "$INSERT_MODE" == "" ]]; then
  INSERT_MODE="%{$fg_bold[green]%}>%{$reset_color%})"
fi

# if NORMAL_MODE wasn't setup by theme, define default
if [[ "$NORMAL_MODE" == "" ]]; then
  INSERT_MODE="%{$fg_bold[green]%}<%{$reset_color%})"
fi
