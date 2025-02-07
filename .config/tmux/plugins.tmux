# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ tmux-thumbs ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -g @thumbs-key F
set -g @thumbs-alphabet colemak
set -g @thumbs-unique enabled
set -g @thumbs-contrast 1
set -g @thumbs-command '[[ "{}" ]] && { tmux setb -- {};tmux display-message "Copied {}";echo -n {} |wl-copy; }'

run "$TMUX_CONFIG_HOME/tpm load fcsonline/tmux-thumbs"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ tmux-easy-motion ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -g @easymotion-key 'J'
run "$TMUX_CONFIG_HOME/tpm load ddzero2c/tmux-easymotion"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ tmux-floax ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
run "$TMUX_CONFIG_HOME/tpm load omerxx/tmux-floax"

# vim: set filetype=tmux tabstop=4 shiftwidth=4 :
