set -s  command-alias reload='source ~/.config/tmux/tmux.conf; display "reload tmux config"'
set -sa command-alias zoom='resizep -Z'
set -sa command-alias mark='selectp -m'
set -sa command-alias unmark='selectp -M'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ new ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias nw='neww'
set -sa command-alias ns='new -c #{pane_current_path} -d'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ kill ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias fp='menu -T "choose Direction" \
    "Left" l "selectp -L" \
    "Right" r "selectp -R" \
    "Up" u "selectp -U" \
    "Down" d "selectp -D" \
    "LeftMost" L "selectp -t {left}" \
    "RightMost" R "selectp -t {right}" \
    "Top" U "selectp -t {top}" \
    "Bottom" D "selectp -t {bottom}" \
    "Previous" p "selectp -p" \
    "Next" n "selectp -n" \
    "Last" C-l "selectp -l" \
    "Marked" m "selectp -t {marked}" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ kill ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias kp='menu -T "choose Pane Action" \
    "Kill current pane" k "killp" \
    "Kill specific pane" K "displayp -b \"killp -t%%\"" \
    "Kill all panes except the current one" a "killp -a" \
    "Kill all non-specific panes" A "displayp -b \"killp -a -t%%\"" \
'

set -sa command-alias kw='menu -T "choose Window Action" \
    "Kill current window" k "killw" \
    "Kill specific window" K "command-prompt -1p \"winid:\" \"killw -t%%\"" \
    "Kill all windows except the current one" a "killw -a" \
    "Kill all non-specific windows" A "command-prompt -1p \"winid:\" \"killw -a -t%%\"" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ break ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias bp='menu -T "choose Break Action" \
    "Break pane" b "breakp -a" \
    "Break specific pane" B "displayp -b \"breakp -as%%\"" \
    "Prompt window for break" w "command-prompt -p \"window:\" \"breakp -at%%\"" \
    "Choose window for break" W "choose-tree -Zw \"breakp -t%%\"" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ join ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias jp='menu -T "choose Join Action" \
    "Choose tree for join" j "choose-tree -Zw \"joinp -t%%\"" \
    "Displayp + Choose tree for join" J "displayp -b \"choose-tree -Zw \\\"joinp -s%% -t%%\\\"\"" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ swap ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias sp='menu -T "choose Swap Action" \
    "Swap pane using displayp>" s "displayp -b \"swapp -t%%\"" \
    "Swap pane using >displayp>" S "displayp -b \"displayp \\\"swapp -s%% -t%%\\\"\"" \
    "Swap pane using choose>" c "choose-tree -Zw \"swapp -t%%\"" \
    "Swap pane using >choose>" C "displayp -b \"choose-tree -Zw \\\"swapp -s%% -t%%\\\"\"" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ find ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias fd='menu -T "choose Find Action" \
    "Match window contents" c "find-window -irZC" \
    "Match window name" n "find-window -irZN" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ layout ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias sl='menu -T "choose Layout" \
    "Select even-horizontal layout" | "selectl even-horizontal" \
    "Select even-vertical layout" _ "selectl even-vertical" \
    "Select tiled layout" = "selectl tiled" \
    "Select main-vertical layout" H "selectl main-vertical" \
    "Select main-vertical-mirrored layout" L "selectl main-vertical-mirrored" \
    "Select main-horizontal layout" K "selectl main-horizontal" \
    "Select main-horizontal-mirrored layout" J "selectl main-horizontal-mirrored" \
'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ split ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -sa command-alias ss='menu -T "Choose direction" \
  "Horizontal Left Split" h "splitw -bh" \
  "Horizontal Right Split" l "splitw -h" \
  "Vertical Top Split" k "splitw -bv" \
  "Vertical Buttom Split" j "splitw -v" \
  "Full Horizontal Left Split" H "splitw -bhf" \
  "Full Horizontal Right Split" L "splitw -hf" \
  "Full Vertical Top Split" K "splitw -bvf" \
  "Full Vertical Buttom Split" J "splitw -vf" \
'    

# vim: set filetype=tmux tabstop=4 shiftwidth=4 :
