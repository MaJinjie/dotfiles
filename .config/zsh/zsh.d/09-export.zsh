#================================User=============================
export Const
export HISTORY_EXACT_IGNORE=(
    
)
export HISTORY_PREFIX_IGNORE=(

)

typeset -A Const=(
    punct '\@\!\#\%\&\*\+\=\?\|\~'
)


#================================Builtin=============================
## 1 History
export SAVEHIST=$((2 * 10 ** 3)) # 10_000_000
export HISTSIZE=$((1.2 * SAVEHIST))
export HISTFILE="$XDG_DATA_HOME/history"
export HIST_STAMPS="yyyy-mm-dd"
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1 # all search results returned will be unique NOTE: for what

## 2 Colors
export LS_COLORS=$(vivid -d $Zdirs[theme]/filetypes.yml generate $Zdirs[theme]/kimbie.yml)
export {ZLS_COLORS,TREE_COLORS}=$LS_COLORS

## Others

export SIMPLE_BACKUP_SUFFIX=bak
export VERSION_CONTROL=numbered # existing simple

export LESSOPEN="$HOME/.lessfilter.sh %s"
export MANPAGER="nvim -c 'Man!'"

export TERMINAL="alacritty"
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="nvim"


() {
    autoload -Uz colors; colors
    local red=$fg_bold[red] blue=$fg[blue] rst=$reset_color
    declare -g TIMEFMT=(
    "$red%J$rst"$'\n'
    "User: $blue%U$rst"$'\t'"System: $blue%S$rst  Total: $blue%*Es$rst"$'\n'
    "CPU:  $blue%P$rst"$'\t'"Mem:    $blue%M MB$rst"
    )
}
#================================Program=============================
## 1 Rualdi
export _RAD_ALIASES_DIR=$XDG_CONFIG_HOME/rualdi 
export _RAD_NO_ECHO=1

## 2 Fzf 
export FZF_DEFAULT_COMMAND='fd --color=always --follow -tf'
export FZF_TMUX_OPTS='-p 70%,80%'
export FZF_DEFAULT_OPTS="\
--marker='▍'
--scrollbar='█'
--cycle
--filepath-word # 使移动行为遵循路径分隔符
--ignore-case
--color='hl:yellow:bold,hl+:yellow:reverse,pointer:032,marker:010,bg+:-1,border:#808080'
--reverse
--info=inline
--ansi
--multi
--height=~80%
--min-height=15
--tabstop=4
--scroll-off=3
--history=$(create_directory $XDG_DATA_HOME/fzf/history)
--jump-labels='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
--preview-window :hidden
--bind='home:beginning-of-line'
--bind='end:end-of-line'
--bind='tab:toggle+down'
--bind='btab:toggle+up'
--bind='esc:abort'
--bind='ctrl-u:unix-line-discard'
--bind='ctrl-w:backward-kill-word'
--bind='ctrl-y:execute-silent(wl-copy -n {+})'
--bind='ctrl-/:change-preview-window(up,60%,border-down|right,60%,border-left)'
--bind='ctrl-q:abort'
--bind='ctrl-h:jump'
--bind='ctrl-l:clear-selection'
--bind='ctrl-j:down'
--bind='ctrl-k:up'
--bind='ctrl-p:prev-history'
--bind='ctrl-n:next-history'
--bind='ctrl-b:beginning-of-line'
--bind='ctrl-e:end-of-line'
--bind='ctrl-s:toggle-all'
--bind='ctrl-v:toggle-preview'
--bind='alt-j:preview-down'
--bind='alt-k:preview-up'
--bind='alt-w:toggle-preview-wrap'
--bind='alt-b:preview-page-up'
--bind='alt-f:preview-page-down'
--bind='enter:accept'
"

## 3 Bkt
export BKT_TTL=1m                    
export BKT_CACHE_DIR=.bkt

## 4 Dotbare
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
export DOTBARE_BACKUP="$XDG_DATA_HOME/dotbare"
# export DOTBARE_KEY
# export DOTBARE_FZF_DEFAULT_OPTS
# export DOTBARE_PREVIEW=
# export DOTBARE_DIFF_PAGER

## 5 Restic
export RESTIC_REPOSITORY=$XDG_DATA_HOME/restic/backup

## 6 Forgit
export FORGIT_COPY_CMD="wl-copy"

## Paths
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/ripgreprc
export NAP_CONFIG=$XDG_CONFIG_HOME/nap/config.yaml
export GRAVEYARD=$XDG_DATA_HOME/rip

