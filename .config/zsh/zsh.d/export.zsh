#================================ Plugins =============================
#-------------------------------- zsh-autosuggestions
function _zsh_autosuggest_strategy_dir_history {
    [[ ! -r "$_per_directory_history_directory" ]] && return
    setopt EXTENDED_GLOB
    
    local prefix result pattern

    prefix="${1//(#m)[\\*?[\]<>()|^~#]/\\$MATCH}"
    pattern="($prefix*)~($prefix)"

    [[ ${(t)ZSH_AUTOSUGGEST_HISTORY_IGNORE} == array ]] && {
        pattern="${pattern/\)(#e)/|${(j:|:)ZSH_AUTOSUGGEST_HISTORY_IGNORE})}"
    } 
    [[ ${(t)ZSH_AUTOSUGGEST_HISTORY_IGNORE} == scalar ]] && {
        pattern="${pattern/\)(#e)/|${ZSH_AUTOSUGGEST_HISTORY_IGNORE})}"
    } 

    result=${${(f)"$(tail -n 300 $_per_directory_history_directory | cut -d ';' -f2-)"}[(fR)$pattern]}

    [[ -n $result ]] && typeset -g suggestion=$result
}

function _zsh_autosuggest_strategy_glob_history {
    setopt EXTENDED_GLOB
    
    local prefix result pattern

    prefix="${1//(#m)[\\*?[\]<>()|^~#]/\\$MATCH}"
    pattern="($prefix*)~($prefix)"

    [[ ${(t)ZSH_AUTOSUGGEST_HISTORY_IGNORE} == array ]] && {
        pattern="${pattern/\)(#e)/|${(j:|:)ZSH_AUTOSUGGEST_HISTORY_IGNORE})}"
    } 
    [[ ${(t)ZSH_AUTOSUGGEST_HISTORY_IGNORE} == scalar ]] && {
        pattern="${pattern/\)(#e)/|${ZSH_AUTOSUGGEST_HISTORY_IGNORE})}"
    } 
    result=${${(f)"$(tail -n 1000 $HISTFILE | cut -d ';' -f2-)"}[(fR)$pattern]}

    [[ -n $result ]] && typeset -g suggestion=$result
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bold,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(dir_history glob_history completion)
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
   $ZSH_AUTOSUGGEST_CLEAR_WIDGETS
   autopair-insert
)
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(vi-end-of-line end-of-line vi-add-eol)
export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
   $ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS
   forward-char vi-forward-char
)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
export ZSH_AUTOSUGGEST_MANUAL_REBIND=set
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="[[:space:]]*"
export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("?(#c1,3)" "?(#c73,)")

#-------------------------------- zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="i"
export HISTORY_SUBSTRING_SEARCH_FUZZY=
export HISTORY_SUBSTRING_SEARCH_PREFIXED=
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=1
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

#-------------------------------- per-directory-history
export HISTORY_BASE="$XDG_DATA_HOME/per_directory_history"
export HISTORY_START_WITH_GLOBAL=false
export PER_DIRECTORY_HISTORY_TOGGLE=^X^G

#================================ Builtin =============================
() {
    autoload -Uz colors; colors
    local red=$fg_bold[red] blue=$fg[blue] rst=$reset_color
    declare -g TIMEFMT=(
    "$red%J$rst"$'\n'
    "User: $blue%U$rst"$'\t'"System: $blue%S$rst  Total: $blue%*Es$rst"$'\n'
    "CPU:  $blue%P$rst"$'\t'"Mem:    $blue%M MB$rst"
    )
}

