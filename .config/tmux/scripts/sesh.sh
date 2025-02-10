#!/usr/bin/bash

function list() {
    local session

    session=$(sesh list "$@" --icons | fzf --tmux center,100%,70% --min-height=40 \
        --no-sort --ansi \
        --border-label ' sesh ' --prompt '⚡all> ' \
        --header 'a-all t-tmux g-configs x-zoxide d-kill f-find' \
        --bind 'tab:down,btab:up' \
        --bind 'alt-a:change-prompt(⚡all> )+reload(sesh list --icons)' \
        --bind 'alt-t:change-prompt(🪟tmux> )+reload(sesh list -t --icons)' \
        --bind 'alt-c:change-prompt(⚙️ config> )+reload(sesh list -c --icons)' \
        --bind 'alt-z:change-prompt(ℤ zoxide> )+reload(sesh list -z --icons)' \
        --bind 'alt-f:change-prompt( find> )+reload(fd -H -d 2 -td)' \
        --bind 'alt-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
        --preview-window 'right:55%' \
        --preview 'sesh preview {}') && echo "$session"
}

function help() {
    echo "Usage: $0 {list} [OPTION]..."
}

function main() {
    if [[ $1 != @(list) ]]; then
        help
        exit 0
    fi

    $1 "${@:2}"
}

main "$@"

# vim: set filetype=sh :
