# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ plugins ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ {{{
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ tmux-thumbs ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -g @thumbs-key F
set -g @thumbs-alphabet colemak
set -g @thumbs-unique enabled
set -g @thumbs-contrast 1
set -g @thumbs-command '[[ "{}" ]] && { tmux setb -- {};tmux display-message "Copied {}";echo -n {} |wl-copy; }'

run "$TMUX_CONFIG_HOME/tpm load fcsonline/tmux-thumbs"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ tmux-easymotion ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -g @easymotion-key 'J'

run "$TMUX_CONFIG_HOME/tpm load ddzero2c/tmux-easymotion"

# }}}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ programs ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ {{{

# }}}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ scripts ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ {{{
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ float-session ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
bind -T prefix -N "Attach floating shell" f \
  if -F '#{m:*-float,#S}' { if -F '#{==:#W,shell}' detach 'neww -Sn shell' } {
    if -F '#{N/s:#{@float_session_name}}' '' { set -t ":" -F '@float_session_name' '#S-float' }
    run -C 'popup -E -d #{pane_current_path} -xC -yC -w#{@float_session_width} -h#{@float_session_height} "tmux new -As \"#{@float_session_name}\" -n shell"'
  }

bind -T prefix -N "Attach floating man" m \
  if -F '#{m:*-float,#S}' { if -F '#{==:#W,shell}' detach 'neww -Sn man' } {
    if -F '#{N/s:#{@float_session_name}}' '' { set -t ":" -F '@float_session_name' '#S-float' }
    run -C 'popup -E -xC -yC -w#{@float_session_width} -h#{@float_session_height} "tmux new -As \"#{@float_session_name}\" -n man"'
  }

# }}}

# vim: set filetype=tmux tabstop=4 shiftwidth=4 foldmethod=marker :
