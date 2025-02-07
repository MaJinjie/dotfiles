# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ completion ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
zstyle ':completion:*'  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'  list-separator '→'
zstyle ':completion:*'  file-sort access
zstyle ':completion:*'  use-cache true
zstyle ':completion:*'  cache-path "$XDG_CACHE_HOME/.zcompdump"

# zstyle ':completion:*:options'  verbose yes
zstyle ':completion:*:options'  description true
zstyle ':completion:*:options'  auto-description '%d'

zstyle ':completion:*:sudo:*' command-path ${path:#$HOME/*}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ fzf-tab ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' use-fzf-default-opts "yes"
zstyle ':fzf-tab:*' fzf-min-height 10
zstyle ':fzf-tab:*' fzf-pad 4
zstyle ':fzf-tab:*' fzf-flags --preview-window=hidden
zstyle ':fzf-tab:*' print-query ctrl-q
zstyle ':fzf-tab:*' accept-line alt-enter
zstyle ':fzf-tab:*' continuous-trigger '/'


zstyle ':fzf-tab:complete:(nvim|eza|z|cd|ls):*' fzf-flags '--preview-window=nohidden,right:60%:wrap'
zstyle ':fzf-tab:complete:(nvim|eza|z|cd|ls):*' fzf-preview \
    'r=$realpath; \
    ([[ -f $r ]] && bat --style=numbers --color=always $r) \
    || ([[ -d $r ]] && bkt --stale 30s -- eza -1F --icons --color=always $r | less) || (echo $r 2> /dev/null | head -200)'


# zstyle ':fzf-tab:complete:cd:*' fzf-flags --preview-window=nohidden
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # remember to use single quote here!!!
# zstyle ':fzf-tab:complete:(nvim):j'
#   ':fzf-tab:complete' '' '' \
#     + ':(nvim|eza|z):argument-rest' fzf-flags '--preview-window=nohidden,right:60%:wrap' \
#     + ':(nvim|eza|z):argument-rest' fzf-preview \
#                             'r=$realpath; w=$(( COLUMNS * 0.60 )); integer w; \
#                                 ([[ -f $r ]] && bat --style=numbers --terminal-width=$w --color=always $r) \
#                                 || ([[ -d $r ]] && bkt -- eza -F -T --icons --color=always $r | less) || (echo $r

# vim: set foldmethod=marker :
