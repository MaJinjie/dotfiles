# eval'[!][command]' 第一次评估并缓存到文件中，之后直接执行文件。!无论推出代码如何，都存储命令输出。
#   三种情况会重新生成命令输出：更新、缓存文件删除和zinit recache
#
# rustup
# cargo"[name-of-the-binary-or-path <-] [[!][c|N|E|O]:]{crate-name} [-> {shim-script-name}]'
#
# sbin'[{g|n|c|N|E|O}:]{path-to-binary}[ -> {name-of-the-script}];' 
# fbin'[{g|n|c|N|E|O}:]{path-to-binary}[ -> {name-of-the-function}]; …' 
# gem'{gem-name};' gem"[{path-to-binary} <-] !{gem-name} [-> {name-of-the-function}]; …"
# node'{node-module}; …' node'[{path-to-binary} <-] !{node-module} [-> {name-of-the-function}];
# pip'{pip-package}` pip'[{path-to-binary} <-] !{pip-package} [-> {name-of-the-function}]'
# fmod'[{g|n|c|N|E|O}:]{function-name}' fmod'[{g|n|c|N|E|O}:]{function-name} -> {wrapping-function-name}'
# fsrc'[{g|n|c|N|E|O}:]{path-to-script}[ -> {name-of-the-function}];'
# ferc'[{g|n|c|N|E|O}:]{path-to-script}[ -> {name-of-the-function}]; …'
# flags:
#   g: set $GEM_HOME to {plugin-dir}
#   n: set $NODE_PATH to {plugin-dir}/node_modules
#   p: set $VIRTUALENV to {plugin-dir}/venv
#   c: cd to the plugin's directory before running the program and then cd back after it has been run
#   N: append &>/dev/null to the call of the binary
#   E: append 2>/dev/null to the call of the binary
#   O: append >/dev/null to the call of the binary

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] {
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
}

declare -A ZINIT=(
    HOME_DIR        "$ZINIT_HOME" 
    BIN_DIR         "$ZINIT_HOME/zinit" 
    PLUGINS_DIR     "$ZINIT_HOME/plugins"
    COMPLETIONS_DIR "$ZINIT_HOME/completions"
    SNIPPETS_DIR    "$ZINIT_HOME/snippets"
    ZCOMPDUMP_PATH  "$XDG_CACHE_HOME/.zcompdump"
    LIST_COMMAND    "tree -C"
    COMPINIT_OPTS   -C
    MUTE_WARNINGS   0
    NO_ALIASES      1
)

{
  if [[ ! -d $ZINIT[BIN_DIR]/.git ]]; then
      print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
      command mkdir -p "$ZINIT[HOME_DIR]" && command chmod g-rwX "$ZINIT[HOME_DIR]"
      command git clone https://github.com/zdharma-continuum/zinit "$ZINIT[BIN_DIR]" && \
          print -P "%F{33} %F{34}Installation successful.%f%b" || \
          print -P "%F{160} The clone has failed.%f%b"
  fi
} always {
  builtin source "$ZINIT[BIN_DIR]/zinit.zsh"
}

local pattern_man='**/man*/*.([1-9].gz|[1-9])(Nnon.f:a+r,a-x:)'

function zplugin { zinit light-mode id-as depth'1' nocompletions ${=1/#(\!|)[0-9][0-9a-d]/wait${1} lucid} "${@:2}"; }
function zmanpage { 
    function convert_to_man { 
        local f b e
        for f in **/man*/[^.]##.[1-9].[^.]##(Nnon.f:a+r,a-x:); do 
        b=${f:r} e=${f:e} 
        if [[ -f $b ]]; then
            continue
        fi 
        case $e in
            gz) ;;
            adoc) asciidoctor -b manpage $f ;;
            *) pandoc $f -tman -so$b ;;
        esac
        done
    }
    zinit light-mode depth'1' as'null' lman"${~pattern_man}" atclone'convert_to_man' atpull'%atclone' ${=1/#[0-9][0-9a-d]/wait${1} lucid} "${@:2}" 
}
function zcompletion { zinit ice as'completion' pick'/dev/null' id-as"${1}"; zinit snippet ${2}; }

zplugin for \
    NICHOLAS85/{z-a-eval,z-a-linkbin,z-a-linkman} \
    zdharma-continuum/zinit-annex-{bin-gem-node,man,rust,readurl,patch-dl,submods,test}

zplugin reset-prompt id-as'theme-p10k' if'[[ $ZSH_THEME == p10k ]]' src"$P10K_CONFIG" for romkatv/powerlevel10k
zplugin reset-prompt id-as'theme-starship' has'starship' if'[[ $ZSH_THEME == starship ]]' eval'starship init zsh' for zdharma-continuum/null

zplugin 00 as'null' id-as'zsh.d' nocd for multisrc"$ZDOTDIR/zsh.d/{options,aliases,keymaps,autoload}.zsh" zdharma-continuum/null

##===========================================section zero
zplugin 0a for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
        larkery/zsh-histdb \
    blockf \
    atload"[[ ! -f build-fzf-tab-module ]] && build-fzf-tab-module && touch build-fzf-tab-module" \
        Aloxaf/fzf-tab

zplugin 0a as'null' id-as'zsh.d' nocd for src"$ZDOTDIR/zsh.d/completions.zsh" zdharma-continuum/null

zplugin 0b for \
    atload' bindkey "^P" history-substring-search-up; bindkey "^N" history-substring-search-down
            export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1' \
        zsh-users/zsh-history-substring-search \
    atinit" export HISTORY_BASE=$XDG_DATA_HOME/per_directory_history HISTORY_START_WITH_GLOBAL=false" \
    atload" bindkey -M viins '^G' per-directory-history-toggle-history" \
        jimhester/per-directory-history \
        zdharma-continuum/history-search-multi-word \
    atload" bindkey -M vicmd s zce
            zstyle ':zce:*' bg 'fg=8,bold'
            zstyle ':zce:*' search-case smartcase" \
        hchbaw/zce.zsh \
    atload"zstyle :zle:evil-registers:'[A-Za-z%#]' editor $EDITOR
            zstyle :zle:evil-registers:'\*' put  - wl-paste -p
            zstyle :zle:evil-registers:'+'  put  - wl-paste
            zstyle :zle:evil-registers:'\*' yank - wl-copy -p
            zstyle :zle:evil-registers:'+'  yank - wl-copy
            zstyle :zle:evil-registers:'' put  - wl-paste
            zstyle :zle:evil-registers:'' yank - wl-copy
            zstyle :zle:evil-registers ctrl-r true" \
        zsh-vi-more/evil-registers

zplugin 0c as'null' id-as'zsh.d' nocd for src"$ZDOTDIR/zsh.d/export.zsh" zdharma-continuum/null

##===========================================section one

##===========================================section two
zplugin 2a from'gh-r' lbin! lman"${~pattern_man}" completions pick'/dev/null' for \
    atinit"export _ZO_ECHO=1 _ZO_EXCLUDE_DIRS='$HOME'" \
    eval"zoxide init --cmd cd zsh" \
        @ajeetdsouza/zoxide \
    eval'direnv hook zsh' \
        @direnv/direnv \
    atinit"export BKT_TTL=1m" \
        @dimo414/bkt \
        @sharkdp/vivid \
        @sharkdp/fd \
    mv'**/bat.zsh -> _bat' \
        @sharkdp/bat \
        @sharkdp/lscolors \
        @sharkdp/hyperfine \
        @eza-community/eza \
        @junegunn/fzf \
    lbin'!rg' \
        @BurntSushi/ripgrep \
        @dandavison/delta \
        @maaslalani/nap \
        @bootandy/dust \
    mv'jq* -> jq' \
        @jqlang/jq \
        @jgm/pandoc \
    mv'chezmoi* -> chezmoi' \
        @twpayne/chezmoi

zplugin 2b as'null' for \
    atclone'cargo build --release --all-features' atpull'%atclone' \
    lbin'!target/release/tokei' \
        @XAMPPRocky/tokei

zplugin 2c as'null' id-as'gem' \
    gem'asciidoctor;tmuxinator;' \
    sbin'g:asciidoctor;g:tmuxinator;' \
    for zdharma-continuum/null

zplugin 2d as'null' id-as'zsh.d' nocd for src"$ZDOTDIR/zsh.d/aliases.zsh" zdharma-continuum/null
    
##===========================================section three
zmanpage 3a for \
        @eza-community/eza \
        @bootandy/dust \
        @direnv/direnv \
        @junegunn/fzf \
        @dalance/procs
    
zcompletion _eza https://github.com/eza-community/eza/blob/main/completions/zsh/_eza
zcompletion _dust https://github.com/bootandy/dust/blob/master/completions/_dust
zcompletion _tmuxinator https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh

unset -f zplugin zmanpage zcompletion
