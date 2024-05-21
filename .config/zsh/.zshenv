## 0 Archlinux
export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN:en_US"

## 1 SYSTEM ENV
export TMP=${TMP:-${TMPDIR:-/tmp}}
export TMPDIR=$TMP

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DESKTOP_DIR="$HOME/.desktop"
export XDG_DOWNLOAD_DIR="$XDG_DATA_HOME/Downloads"
export XDG_TEMPLATES_DIR="$XDG_DATA_HOME/Templates"
export XDG_PUBLICSHARE_DIR="$XDG_DATA_HOME/Public"
export XDG_DOCUMENTS_DIR="$XDG_DATA_HOME/Documents"
export XDG_MUSIC_DIR="$XDG_DATA_HOME/Music"
export XDG_PICTURES_DIR="$XDG_DATA_HOME/Pictures"
export XDG_VIDEOS_DIR="$XDG_DATA_HOME/Videos"

export EDITOR="nvim"

export SIMPLE_BACKUP_SUFFIX=bak
export VERSION_CONTROL=numbered # existing simple

export -UT PATH path
export -UT FPATH fpath

## 2 APP ENV

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$RUSTUP_HOME/cargo"
export GEM_PATH="$(ruby -e 'puts Gem.user_dir')"
export GEM_HOME="$GEM_PATH"
export ZINIT_HOME="$XDG_DATA_HOME/zinit"

## 3 USER ENV

export Xdirs Zdirs Mdirs

typeset -A Xdirs=(
    conf        "$XDG_CONFIG_HOME"              
    data        "$XDG_DATA_HOME"                 
    cache       "$XDG_CACHE_HOME"                
    state       "$XDG_STATE_HOME"          
    desktop     "$XDG_DESKTOP_DIR"             
    download    "$XDG_DOWNLOAD_DIR"  
    template    "$XDG_TEMPLATES_DIR" 
    public      "$XDG_PUBLICSHARE_DIR"  
    document    "$XDG_DOCUMENTS_DIR" 
    music       "$XDG_MUSIC_DIR"         
    picture     "$XDG_PICTURES_DIR"   
    video       "$XDG_VIDEOS_DIR"       

    local       "/usr/local"
    bin         "/usr/local/bin"
)

typeset -A Zdirs=(
    home        "$ZDOTDIR"
    man         "$ZDOTDIR/man"
    comp        "$ZDOTDIR/completions"
    func        "$ZDOTDIR/functions"
    theme       "$ZDOTDIR/themes"
    cache       "$ZDOTDIR/cache"
    data        "$ZDOTDIR/data"
    script      "$ZDOTDIR/scripts"
    pdata       "$XDG_DATA_HOME/zplug"
    pcache      "$XDG_CACHE_HOME/zplug"
    
)

typeset -A Mdirs=(
    proj        "$HOME/projects"
    dot         "$HOME/dotfiles"
    note        "$HOME/notes"
)


## DEFER ENV

path=(
    "$CARGO_HOME/bin"
    "$GEM_HOME/bin"
    "$Zdirs[script]"
    "${(@)path}"
)

fpath=(
    $Zdirs[func]
    $Zdirs[func]/**(NF)
    $Zdirs[comp]
    ""
    "${(@)fpath}"
)

