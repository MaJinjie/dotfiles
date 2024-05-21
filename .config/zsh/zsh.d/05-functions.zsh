# [[ 可能用到的 functions ]]
function create_directory() {
    [[ -d ${1:h} ]] || mkdir -p ${1:h} 2> /dev/null
    print $1
}

export function startup_fzf() {
    if [[ $1 == --popup ]] && (($+commands[fzf-tmux])); then
        fzf-tmux $FZF_TMUX_OPTS "${@:2}"
    else
        fzf "$@"
    fi
}

function print_msg () {
    local tag context tcolor ccolor

    tag=$1 context=${@:2}
    case $tag in 
        info)   tcolor=blue ccolor=magenta ;;
        warn)   tcolor=yellow ccolor=magenta ;;
        error)  tcolor=red ccolor=magenta ;;
        help)   tcolor=green ccolor=magenta ;;
        *)      print -- "$@"; exit 0 ;;
    esac
    context="%B%S%F{$tcolor}$tag%b%s%f : %U%F{$ccolor}$context%f%u"

    print -- "${(%):-$context}"    
}
