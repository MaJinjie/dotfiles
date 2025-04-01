() {
    typeset -i last_time

    function _fast_exit_vi_j {
        if [[ ${LBUFFER[-1]} == k ]] && (( $(date +%s%3N) - last_time <= 200 )); then
            zle backward-delete-char  # 删除前一个字符
            zle vi-cmd-mode           # 退出插入模式
        else
            zle self-insert
        fi
        last_time=$(date +%s%3N)
    }
    
    function _fast_exit_vi_k {
        if [[ ${LBUFFER[-1]} == j ]] && (( $(date +%s%3N) - last_time <= 200 )); then
            zle backward-delete-char  # 删除前一个字符
            zle vi-cmd-mode           # 退出插入模式
        else
            zle self-insert
        fi
        last_time=$(date +%s%3N)
    }

    zle -N _fast_exit_vi_j
    zle -N _fast_exit_vi_k
}

bindkey -M viins 'j' _fast_exit_vi_j
bindkey -M viins 'k' _fast_exit_vi_k
# bindkey -M viins '^[l' autosuggest-accept
bindkey -M viins '^Xh' _complete_help

bindkey -M vicmd Y vi-yank-eol
