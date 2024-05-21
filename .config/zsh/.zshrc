if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] {
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
}

## Zinit
declare -A ZINIT=(
    HOME_DIR        "$ZINIT_HOME" 
    BIN_DIR         "$ZINIT_HOME/bin" 
    PLUGINS_DIR     "$ZINIT_HOME/plugins"
    COMPLETIONS_DIR "$ZINIT_HOME/completions"
    SNIPPETS_DIR    "$ZINIT_HOME/snippets"
    ZCOMPDUMP_PATH  "$ZDOTDIR/cache/zcompdump-$HOST-$ZSH_VERSION"
    LIST_COMMAND    "tree -C"
    COMPINIT_OPTS   -C
    NO_ALIASES 1
)
local -a sourcef files=( $Zdirs[home]/zsh.d/*(N.:t) ); files=( ${(on)files} )
function zt() { zinit depth'3' ${1/#[0-9][a-c]/wait"${1}"} lucid "${@:2}"; }
function extractf () {
    local digit=$1
    sourcef=()
    for file in $files; do 
        if [[ $file =~ ^([[:digit:]]{2})-.*\\.zsh ]]; then
            ((${match[1]#0} <= digit)) || break
            sourcef+=$file
        else 
            print "${(%):-%F%B{1}source file-name error!%f%b}"
        fi
    done
    (($#sourcef)) && files=( ${files:|sourcef} )
}

{
  if [[ ! -d $ZINIT[BIN_DIR]/.git ]]; then
      print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
      ((! $+commands[git])) && command paru -S --noconfirm git
      command mkdir -p "$ZINIT_HOME" && command chmod g-rwX "$ZINIT_HOME"
      command git clone https://github.com/zdharma-continuum/zinit "$ZINIT[BIN_DIR]" && \
          print -P "%F{33} %F{34}Installation successful.%f%b" || \
          print -P "%F{160} The clone has failed.%f%b"
  fi
} always {
  builtin source "$ZINIT[BIN_DIR]/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
}

## Annex Theme
zt light-mode for \
    NICHOLAS85/{z-a-linkbin,z-a-linkman,z-a-eval} \
    zdharma-continuum/zinit-annex-{'readurl','bin-gem-node','patch-dl','rust'} \
        romkatv/powerlevel10k \
    atload"[[ -f ${Zdirs[theme]}/p10k.zsh ]] && source ${Zdirs[theme]}/p10k.zsh" \
        zdharma-continuum/null

# =======================================================================
extractf 20 && zt light-mode null id-as'zshd' nocd for multisrc="$Zdirs[home]/zsh.d/${(@)^sourcef}" zdharma-continuum/null
# =======================================================================
## First Load
# =======================================================================
extractf 40 && zt 0a light-mode null id-as'zshd' nocd for multisrc="$Zdirs[home]/zsh.d/${(@)^sourcef}" zdharma-continuum/null
# =======================================================================

zt 0a light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
        MichaelAquilina/zsh-you-should-use \
    atload' bindkey -M viins "^P" history-substring-search-up
            bindkey -M vicmd "^P" history-substring-search-up
            bindkey -M viins "^N" history-substring-search-down 
            bindkey -M vicmd "^N" history-substring-search-down ' \
        zsh-users/zsh-history-substring-search \
        jimhester/per-directory-history \
    atinit'_Z_CMD=zz' \
    lman \
        rupa/z \
    blockf compile'lib/*f*~*.zwc' \
        Aloxaf/fzf-tab \
    blockf compile'sources/*.zsh' \
        hlissner/zsh-autopair \
    atload" zstyle :zle:evil-registers:'[A-Za-z%#]' editor $EDITOR
            zstyle :zle:evil-registers:'\*' put  - wl-paste -p
            zstyle :zle:evil-registers:'+'  put  - wl-paste
            zstyle :zle:evil-registers:'\*' yank - wl-copy -p
            zstyle :zle:evil-registers:'+'  yank - wl-copy
            zstyle :zle:evil-registers:'' put  - wl-paste
            zstyle :zle:evil-registers:'' yank - wl-copy
            zstyle :zle:evil-registers ctrl-r true" \
        zsh-vi-more/evil-registers \
    lbin'(grc|grcat)' \
        MaJinjie/grc \
    atload'export FORGIT_NO_ALIASES=true' \
        wfxr/forgit \
    lbin"bin/git-*" \
    src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX" \
        tj/git-extras

# =======================================================================
extractf 60 && zt 0a light-mode null id-as'zshd' nocd for multisrc="$Zdirs[home]/zsh.d/${(@)^sourcef}" zdharma-continuum/null
# =======================================================================
## Second Load
zt 0b light-mode for \
    atinit'export _RAD_NO_ECHO=1; ' \
    eval'rualdi init zsh' \
    from'gh-r' lbin \
        Jarsop/rualdi \
    from'gh-r' lbin \
        @sharkdp/vivid \
    from'gh-r' lbin \
        eza-community/eza \
    from'gh-r' lbin \
        junegunn/fzf \
    from'gh-r' lbin lman \
        @sharkdp/fd \
    from'gh-r' lbin'**/rg' lman \
        BurntSushi/ripgrep \
    mv'**/bat.zsh -> _bat' \
    from'gh-r' lbin lman \
        @sharkdp/bat \
    from'gh-r' ver'v0.15.0' lbin \
        @sharkdp/lscolors \
    from'gh-r' lbin \
        dimo414/bkt \
    atclone"**/bob complete zsh > _bob" atpull'%atclone' \
    from'gh-r' lbin \
        MordechaiHadad/bob \
    from'gh-r' lbin lman \
        @sharkdp/hyperfine \
    from'gh-r' lbin \
        dandavison/delta \
    from'gh-r' lbin \
        maaslalani/nap \
    from'gh-r' lbin \
        itchyny/mmv \
    from'gh-r' lbin \
        ms-jpq/sad \
    from'gh-r' lbin lman \
        chmln/sd \
    from'gh-r' lbin lman \
        jgm/pandoc \
    atclone'cargo build --release' atpull'%atclone' \
    mv'completion*/rip.zsh -> _rip' \
    lbin'target/release/rip' \
        lmburns/rip \
    atclone'cargo build --release' atpull'%atclone' \
    lbin'target/release/loop' \
        miserlou/loop \
    lbin from'gh-r' \
        abhinav/tmux-fastcopy \
    pick'/dev/null' \
    lbin'lesspipe.sh' lman \
        wofr06/lesspipe \
    make"YANKCMD='wl-copy -n' PREFIX=$ZPFX install" \
    lbin lman \
        mptre/yank \
    atclone'cargo build --release' atpull'%atclone' \
    lbin'target/release/lax' \
        Property404/lax \
    lbin'xurls* -> xurls' from'gh-r' \
        @mvdan/xurls \
    lbin'restic* -> restic' from'gh-r' \
        restic/restic \
    lbin \
        mrowa44/emojify
        
    # from'gh-r' lbin \
    #     umlx5h/zsh-manpage-completion-generator
    
zt 0b light-mode pick'/dev/null' for \
    lbin'ugit' \
        Bhupesh-V/ugit \
    lbin'!' \
        kazhala/dotbare


# =======================================================================
extractf 70 && zt 0b light-mode null id-as'zshd' nocd for multisrc="$Zdirs[home]/zsh.d/${(@)^sourcef}" zdharma-continuum/null
# =======================================================================
## Third Load
zt 0c light-mode for \
        Freed-Wu/fzf-tab-source \
    pick'/dev/null' mv'./*.zsh-completion -> _revolver' \
    lbin \
        molovo/revolver \
    atclone'./build.zsh' atpull'%atclone' \
    mv'./*.zsh-completion -> _zunit' \
    pick'/dev/null' has'revolver' \
    lbin \
        zunit-zsh/zunit \
    atclone'./autogen.sh' atpull'%atclone' \
    pick'/dev/null' \
    lbin \
        rocky/zshdb \
    make'PREFIX=$ZPFX' \
    lbin'(zsd|zsd-detect|zsd-to-adoc|zsd-transform)' \
        zdharma-continuum/zshelldoc \
    trigger-load'!zhooks' \
        agkozak/zhooks \
    trigger-load'!zman'\
        mattmc3/zman

zt 0c as'completions' for \
    https://github.com/eza-community/eza/blob/main/completions/zsh/_eza \
    https://github.com/Jarsop/rualdi/blob/master/completions/{_rualdi,_rualdi_funcs}
    
zt 0c as'null' lbin for \
    https://github.com/junegunn/fzf/blob/master/bin/fzf-tmux

zt 0c id-as'github' pick'/dev/null' for \
    lman restic/restic 

# =======================================================================
extractf 90 && zt 0c light-mode null id-as'zshd' nocd for multisrc="$Zdirs[home]/zsh.d/${(@)^sourcef}" zdharma-continuum/null
# =======================================================================
## Private
# =======================================================================
extractf 99 && zt light-mode null id-as'zshd' nocd for multisrc="$Zdirs[home]/zsh.d/${(@)^sourcef}" zdharma-continuum/null
# =======================================================================
