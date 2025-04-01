#================================ Internal =============================
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

#================================ External =============================
export ZSH_THEME="p10k" # starship p10k

#-------------------------------- zinit
export ZINIT_HOME="$XDG_DATA_HOME/zinit"

#-------------------------------- gem
[[ $GEM_HOME ]] || export GEM_HOME="$(ruby -e 'puts Gem.user_dir')" # gem安装的主目录
[[ $GEM_PATH ]] || export GEM_PATH="$(ruby -e 'puts Gem.path')" # gem的查找路径列表

#-------------------------------- theme
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/zsh/theme/starship.toml"
export P10K_CONFIG="$XDG_CONFIG_HOME/zsh/theme/p10k.zsh"

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
--layout=reverse
--color="hl:yellow:bold,hl+:yellow:reverse,pointer:032,marker:010,bg+:-1,border:#808080"
--cycle
--ansi
--tabstop=4
--scroll-off=4
--history=/tmp/fzf-history
--preview="
    r={}; r=${~r}; \
    ([[ -f $r ]] && bat --color=always --number $r) || 
    ([[ -d $r ]] && bkt --stale 30s -- eza -1F --icons --color=always $r | less) || 
    (echo $r 2> /dev/null | head -200)
"
--bind="alt-w:toggle-wrap,alt-a:toggle-all,alt-p:toggle-preview"
--bind="ctrl-d:half-page-down"
--bind="ctrl-b:preview-half-page-up,ctrl-f:preview-half-page-down"
--bind="ctrl-y:execute-silent(wl-copy -n {+})"
'

#================================ PATH =============================
export -UT PATH path

path=(
    "$XDG_BIN_HOME"
    "${ZPFX-$ZINIT_HOME/polaris}/bin"
    "$XDG_DATA_HOME/mason/bin"
    "$CARGO_HOME/bin"
    "${=^${(s/:/)GEM_PATH}}/bin"
    "${(@)path}"
)
