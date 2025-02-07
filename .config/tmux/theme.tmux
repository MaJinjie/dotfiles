# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ colors ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
dark0="#282828"
dark1="#3c3836"
dark2="#504945"
dark3="#665c54"
dark4="#7c6f64"
light0="#fbf1c7"
light1="#ebdbb2"
light2="#d5c4a1"
light3="#bdae93"
light4="#a89984"
# bright_red="#fb4934"
# bright_green="#b8bb26"
# bright_yellow="#fabd2f"
# bright_blue="#83a598"
# bright_purple="#d3869b"
# bright_aqua="#8ec07c"
# bright_orange="#fe8019"
# bright_gray="#928374"
# light_red="#cc241d",
# light_green="#98971a",
# light_yellow="#d79921",
# light_blue="#458588",
# light_purple="#b16286",
# light_aqua="#689d6a",
# light_orange="#d65d0e",
red="#cc241d",
green="#98971a",
yellow="#d79921",
blue="#458588",
purple="#b16286",
aqua="#689d6a",
orange="#d65d0e",

black=$dark0
white=$light0
bg=$dark0

left1=''
left2=''
right1=''
right2=''

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ border ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -g pane-border-status top

# color used by the display-panes command to show indicators for inactive panes
# set -g display-panes-active-colour "$red"
# set -g display-panes-colour        "$purple"

set -g pane-border-indicators colour
# set pane border line type
set -g pane-border-lines heavy
# set pane border style
set -g pane-border-style \
    '#{?pane_in_mode,fg=#{yellow},\
    #{?pane_synchronized,fg=#{red},\
    #{?pane_marked,fg=#{purple},\
    fg=#{gray}}}}'  
# set pane border format string
set -g pane-border-format \
"#[align=right] #{pane_current_command}  #{s|^$HOME|~:pane_start_path}\
 #S:#I.#P "
# set active pane border style
set -g pane-active-border-style \
    '#{?pane_in_mode,fg=#{yellow},\
    #{?pane_synchronized,fg=#{red},\
    fg=#{aqua}}},bold'  

set -g popup-border-lines rounded
set -g popup-border-style 'fg=#{gray}'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ status bar ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -g status on

set -g status-justify left
set -g status-interval 10
set -g status-position bottom

set -g status-bg $bg

# left
set -g status-left " #S #[reverse]$left1"     
set -g status-left-style "fg=$black,bg=$light4,bold"
set -g status-left-length   15 #Set the maximum length of the left component of the status line. 

# center
set -g window-status-format "#[fg=$bg,bg=#{?synchronize-panes,red,default}]$left1#[fg=default]\
 #I $left2 #W#{?window_zoomed_flag,  :#P,}#{?window_marked_flag, 󰸕,}\
 #[fg=$bg,reverse]$left1"
set -gF window-status-current-format "#{window-status-format}"

set -g window-status-style "fg=$light4,bg=$dark2"
set -g window-status-current-style "fg=$black,bg=$yellow,bold"
set -g window-status-last-style "fg=$light0,bold"
set -g window-status-activity-style "bg=$blue"
set -g window-status-bell-style     "bg=$aqua"
set -g window-status-separator ''

# right
set -g status-right ""
set -g status-right-style "fg=$black,bg=$light4,bold"
set -g status-right-length 50 #Set the maximum length of the right component of the status line. 

# command
set -g message-style         "fg=$white,bold,italics"                 # set stl msg style. used for msgs & command prompt
set -gF message-command-style "#{message-style}"           # appearance of status message cmds

# vim: set filetype=tmux tabstop=4 shiftwidth=4 :
