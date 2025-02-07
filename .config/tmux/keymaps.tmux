# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ root ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
bind -T root -N 'Split window horizontally' 'M-|' splitw -h
bind -T root -N 'Split window vertically' 'M-_' splitw -v
bind -T root -N 'Select the prev window' 'M-[' selectw -p
bind -T root -N 'Select the next window' 'M-]' selectw -n
bind -T root -N 'Select the last window' 'M-\' selectw -l
bind -T root -N 'Switch the prev session' 'M-{' switchc -p
bind -T root -N 'Switch the next session' 'M-}' switchc -n
bind -T root -N 'Switch the last session' 'M-.' switchc -l
bind -T root -N "Prompt for a tmux command" 'M-:' command-prompt
bind -T root -N "Select marked pane" "M-'" if -F '#{pane_marked_set}' { if -F '#{pane_marked}' { run -C "switchc -t '#{?@last_full_pane,#{@last_full_pane},:.!}'" } { set -gF @last_full_pane '#S:#I.#P'; switchc -t '{marked}' } } { selectp -m }
bind -T root -N "Select buffer" 'M-"' choose-buffer
bind -T root -N "Enter copy-mode" 'M-Space' copy-mode
bind -T root -N "Zoom the active pane" 'M-+' resizep -Z

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ prefix ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
bind -T prefix -N "Select number pane" ';' displayp -b 'selectp -t%%'
bind -T prefix -N "Choose window" W choose-tree -Zw
bind -T prefix -N "Choose session" S choose-tree -Zs
bind -T prefix -N "Rename window" R command-prompt -p "rename-window:" "renamew '%%'"
bind -T prefix -N "Choose buffer" '"' choose-buffer 'run "tmux saveb -b%% -|wl-copy"'
bind -T prefix -N "Create new window or Attach to exists window" "'" command-prompt -p "focus-window:" 'neww -Sn "%%"'
bind -T prefix -N "Kill current pane" x killp
bind -T prefix -N "Kill current window" X unlinkw -k
bind -T prefix -N "Kill current session" M-x kill-session
bind -T prefix -N "Detach the current client" d detach-client
bind -T prefix -N "Choose and detach a client from a list" D choose-client -Z

bind -T prefix -N "Attach floating shell" f \
  if -F '#{m:*-float,#S}' { if -F '#{==:#W,shell}' detach 'neww -Sn shell' } {
    if -F '#{N/s:#{@float_session_name}}' '' { set -t ":" -F '@float_session_name' '#S-float' }
    run -C 'popup -E -d #{pane_current_path} -xC -yC -w#{@float_session_width} -h#{@float_session_height} "tmux new -As \"#{@float_session_name}\" -n shell"'
  }

bind -T prefix -N "Attach floating shell" m \
  if -F '#{m:*-float,#S}' { detach } {
    if -F '#{N/s:#{@float_session_name}}' '' { set -t ":" -F '@float_session_name' '#S-float' }
    run -C 'popup -E -xC -yC -w#{@float_session_width} -h#{@float_session_height} "tmux new -As \"#{@float_session_name}\" -n man"'
  }

# better pane move
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
is_fzf="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?fzf$'"
bind -T root -N "Navigate to left pane"    'C-h'  if "$is_vim || $is_fzf" 'send C-h'  'selectp -ZL'
bind -T root -N "Navigate to bottom pane"  'C-j'  if "$is_vim || $is_fzf" 'send C-j'  'selectp -ZD'
bind -T root -N "Navigate to top pane"     'C-k'  if "$is_vim || $is_fzf" 'send C-k'  'selectp -ZU'
bind -T root -N "Navigate to right pane"   'C-l'  if "$is_vim || $is_fzf" 'send C-l'  'selectp -ZR'
bind -T root -N "Navigate to last pane"    'C-\'  if "$is_vim || $is_fzf" 'send C-\\' 'selectp -Zl'

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ copy-mode ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# better pane move
bind -T copy-mode-vi  -N "Navigate to left pane"          'C-h'   selectp -ZL
bind -T copy-mode-vi  -N "Navigate to bottom pane"        'C-j'   selectp -ZD
bind -T copy-mode-vi  -N "Navigate to top pane"           'C-k'   selectp -ZU
bind -T copy-mode-vi  -N "Navigate to right pane"         'C-l'   selectp -ZR
bind -T copy-mode-vi  -N "Navigate to last pane"          'C-\'   selectp -Zl

bind -T copy-mode-vi  -N "Select word"                    .       send -X select-word
bind -T copy-mode-vi  -N "Start visual selection"         v       send -X begin-selection
bind -T copy-mode-vi  -N "Start visual line"              V       send -X select-line
bind -T copy-mode-vi  -N "Start visual block"             C-v     { send -X rectangle-toggle; send -X begin-selection }
bind -T copy-mode-vi  -N "Copy selection and cancel"      y       send -X copy-selection-and-cancel 'tmux-copy-mode'
bind -T copy-mode-vi  -N "Copy to EOL"                    Y       send -X copy-end-of-line-and-cancel 'tmux-copy-mode'
bind -T copy-mode-vi  -N "Copy selection"                 i       send -X copy-selection 'tmux-copy-mode'
bind -T copy-mode-vi  -N "Copy selection no clear"        I       send -X copy-end-of-line 'tmux-copy-mode'
bind -T copy-mode-vi  -N "Append to selection"            a       send -X append-selection 
bind -T copy-mode-vi  -N "Append to selection and cancel" A       send -X append-selection-and-cancel
bind -T copy-mode-vi  -N "Set mark"                       m       send -X set-mark
bind -T copy-mode-vi  -N "Goto mark"                      "'"     send -X jump-to-mark
bind -T copy-mode-vi  -N "Forward search"                 /       command-prompt -p "forward:" -i 'send -X search-forward-incremental "%%"'
bind -T copy-mode-vi  -N "Backward search"                ?       command-prompt -p "backward:" -i 'send -X search-backward-incremental "%%"'
bind -T copy-mode-vi  -N "Prev prompt"                    P       send -X previous-prompt -o
bind -T copy-mode-vi  -N "Next prompt"                    p       send -X next-prompt -o

# vim: set filetype=tmux tabstop=4 shiftwidth=4 :
