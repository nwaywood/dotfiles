#### COLOUR
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

tm_color_active='#d19a66' # onedark 'yellow'
# tm_color_active=colour198 # nisi magenta
tm_color_inactive=colour241 # grey
tm_color_feature='#61afef' # onedark 'blue'
tm_color_music='#e06c75' # onedark 'red'
# tm_color_music=colour203 # red
# tm_active_border_color=colour198 # nisi magenta
tm_active_border_color='#d19a66' # onedark 'yellow'

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-style fg=$tm_color_active,bg=default,default

# default window title colors
set-window-option -g window-status-style fg=$tm_color_inactive,bg=default
set-window-option -g window-status-format "#I #{?window_zoomed_flag,(,}#W#{?window_zoomed_flag,),}"

# active window title colors
set-window-option -g window-status-current-style fg=$tm_color_active,bg=default
# surround window name in parenthesis when zoomed http://superuser.com/questions/830450/tmux-no-pane-zoom-indication-after-customising-status-bar
set-window-option -g  window-status-current-format "#[bold]#I #{?window_zoomed_flag,(,}#W#{?window_zoomed_flag,),}"

# pane border
set-window-option -g pane-border-style fg=$tm_color_inactive
set-window-option -g pane-active-border-style fg=$tm_active_border_color

# message text
set-option -g message-style bg=default,fg=$tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

tm_spotify="#[fg=$tm_color_music]#(osascript ~/.dotfiles/tmux/spotify.scpt)"

tm_date="#[fg=$tm_color_inactive] %l:%M%p %d %b"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold] #S"

set -g status-left $tm_session_name' '
set -g status-right $tm_spotify' '$tm_date' '$tm_host
