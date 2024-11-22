## 1 Zsh-autosuggestions
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
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_MANUAL_REBIND=set
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="[[:space:]]*"
export ZSH_AUTOSUGGEST_HISTORY_IGNORE=("?(#c1,3)" "?(#c73,)")

## 2 Zsh-you-should-use
export YSU_MESSAGE_POSITION=after
export YSU_HARDCORE=1

## 3 Per-directory-history
export HISTORY_BASE="$XDG_DATA_HOME/per_directory_history"
export HISTORY_START_WITH_GLOBAL=false
export PER_DIRECTORY_HISTORY_TOGGLE=^X^G

## 4 Rupa/z
export _Z_DATA=$(create_directory "$XDG_DATA_HOME/rupa_z/z")
export _Z_NO_RESOLVE_SYMLINKS=1
export _NO_PROMPT_COMMAND=1
export _Z_EXCLUDE_DIRS=(
   "$XDG_DATA_HOME"
   "$XDG_CACHE_HOME"
)

## 5 Zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="i"
export HISTORY_SUBSTRING_SEARCH_FUZZY=
export HISTORY_SUBSTRING_SEARCH_PREFIXED=
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=1
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

## 6 Grc
export GRC_NO_CMDS=()
export GRC_OVERRIDE=0

## 7 Lesspipe
export LESS="-R" # colored less
