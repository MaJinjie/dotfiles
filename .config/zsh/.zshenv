#================================ Builtin =============================
export TERMINAL="alacritty"
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="nvim"

export SAVEHIST=$((5 * 10 ** 3))
export HISTSIZE=$((1.2 * SAVEHIST))
export HISTFILE="$XDG_DATA_HOME/history"
export HIST_STAMPS="yyyy-mm-dd"
export HISTORY_IGNORE="(?(#c,5)|history)"

# export CORRECT_IGNORE=""

export CDPATH="$XDG_CONFIG_HOME"

export SIMPLE_BACKUP_SUFFIX=bak
export VERSION_CONTROL=numbered # existing simple
[[ $LS_COLORS ]] || export LS_COLORS="$(vivid generate kimbie)"

#================================ Program =============================
#-------------------------------- zinit
export ZINIT_HOME="$XDG_DATA_HOME/zinit"

#-------------------------------- gem
[[ $GEM_HOME ]] || export GEM_HOME="$(ruby -e 'puts Gem.user_dir')" # gem安装的主目录
[[ $GEM_PATH ]] || export GEM_PATH="$(ruby -e 'puts Gem.path')" # gem的查找路径列表

#-------------------------------- rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$RUSTUP_HOME/cargo"

#-------------------------------- ripgrep
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/ripgreprc

#-------------------------------- nap
export NAP_CONFIG=$XDG_CONFIG_HOME/nap/config.yaml

#-------------------------------- rip
export GRAVEYARD=$XDG_DATA_HOME/rip

#-------------------------------- fzf
export FZF_TMUX_OPTS='-p 70%,80%'
export FZF_DEFAULT_COMMAND='fd -tf --color=always'
export FZF_DEFAULT_OPTS='
--prompt="> "
--pointer=">"
--marker="▍"
--scrollbar="█"
--info=inline
--height=~60%
--min-height=15
--layout=reverse
--color="hl:yellow:bold,hl+:yellow:reverse,pointer:032,marker:010,bg+:-1,border:#808080"
--cycle
--ansi
--tabstop=4
--scroll-off=3
--ignore-case
--history=/tmp/fzf-history
--preview="
    r={}; r=${~r}; \
    ([[ -f $r ]] && bat --color=always $r) || 
    ([[ -d $r ]] && bkt --stale 30s -- eza -1F --icons --color=always $r | less) || 
    (echo $r 2> /dev/null | head -200)
"
--bind="tab:toggle-down,btab:toggle+up,ctrl-o:toggle-all"

--bind="ctrl-h:jump"
--bind="ctrl-l:clear-selection+first"
--bind="ctrl-k:up,ctrl-j:down"
--bind="ctrl-d:half-page-down"
--bind="ctrl-p:previous-history,ctrl-n:next-history"

--bind="ctrl-/:toggle-preview"
--bind="ctrl-b:preview-page-up,ctrl-f:preview-page-down"

--bind="ctrl-y:execute-silent(wl-copy -n {+})"
--bind="enter:accept"
'

#================================ PATH =============================
export -UT PATH path

path=(
    "${ZPFX-$ZINIT_HOME/polaris}/bin"
    "$CARGO_HOME/bin"
    "${=^${(s/:/)GEM_PATH}}/bin"
    "${path[@]}"
)
