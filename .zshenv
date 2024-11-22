#============================= Utility =============================#
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

#============================= Language =============================#
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$RUSTUP_HOME/cargo"
export GEM_PATH="$(ruby -e 'puts Gem.user_dir')"
export GEM_HOME="$GEM_PATH"
export NODE_PATH="$XDG_DATA_HOME/nodejs"

#============================= System =============================#
export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN:en_US"

export CDPATH=~:~/.config

export DOT_GIT_DIR=~/.dotfiles
export DOT_GIT_WORK_TREE=~

export -UT PATH path
export -UT FPATH fpath

path=(
    ~/.local/bin
    ~/.local/script
    "$XDG_DATA_HOME/zinit/polaris/bin"
    "$CARGO_HOME/bin"
    "$GEM_HOME/bin"
    "${(@)path}"
)

fpath=(
    "$XDG_CONFIG_HOME/zsh/functions"
    "$XDG_CONFIG_HOME/zsh/functions"/**(NF)
    "$XDG_CONFIG_HOME/zsh/completions"
    "${(@)fpath}"
)
