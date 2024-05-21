autoload -Uz zstyle+
autoload -Uz compdef

## 1 Zinit
ZINIT+=(
  col-pname   $'\e[1;4m\e[38;5;004m'               col-uname   $'\e[1;4m\e[38;5;013m' col-keyword $'\e[14m'
  col-note    $'\e[38;5;007m'                      col-error   $'\e[1m\e[38;5;001m'   col-p       $'\e[38;5;81m'
  col-info    $'\e[38;5;82m'                       col-info2   $'\e[38;5;011m'        col-profile $'\e[38;5;007m'
  col-uninst  $'\e[38;5;010m'                      col-info3   $'\e[1m\e[38;5;011m'   col-slight  $'\e[38;5;230m'
  col-failure $'\e[38;5;001m'                      col-happy   $'\e[1m\e[38;5;82m'    col-annex   $'\e[38;5;002m'
  col-id-as   $'\e[4;38;5;011m'                    col-version $'\e[3;38;5;87m'
  col-pre     $'\e[38;5;135m'                      col-msg     $'\e[0m'               col-msg2    $'\e[38;5;009m'
  col-obj     $'\e[38;5;012m'                      col-obj2    $'\e[38;5;010m'        col-file    $'\e[3;38;5;117m'
  col-dir     $'\e[3;38;5;002m'                    col-func    $'\e[38;5;219m'
  col-url     $'\e[38;5;75m'                       col-meta    $'\e[38;5;57m'         col-meta2   $'\e[38;5;147m'
  col-data    $'\e[38;5;010m'                      col-data2   $'\e[38;5;010m'        col-hi      $'\e[1m\e[38;5;010m'
  col-var     $'\e[38;5;81m'                       col-glob    $'\e[38;5;011m'        col-ehi     $'\e[1m\e[38;5;210m'
  col-cmd     $'\e[38;5;002m'                      col-ice     $'\e[38;5;39m'         col-nl      $'\n'
  col-txt     $'\e[38;5;010m'                      col-num     $'\e[3;38;5;155m'      col-term    $'\e[38;5;185m'
  col-warn    $'\e[38;5;009m'                      col-apo     $'\e[1;38;5;220m'      col-ok      $'\e[38;5;220m'
  col-faint   $'\e[38;5;238m'                      col-opt     $'\e[38;5;219m'        col-lhi     $'\e[38;5;81m'
  col-tab     $' \t '                              col-msg3    $'\e[38;5;238m'        col-b-lhi   $'\e[1m\e[38;5;75m'
  col-bar     $'\e[38;5;82m'                       col-th-bar  $'\e[38;5;82m'
  col-rst     $'\e[0m'                             col-b       $'\e[1m'               col-nb      $'\e[22m'
  col-u       $'\e[4m'                             col-it      $'\e[3m'               col-st      $'\e[9m'
  col-nu      $'\e[24m'                            col-nit     $'\e[23m'              col-nst     $'\e[29m'
  col-bspc    $'\b'                                col-b-warn  $'\e[1;38;5;009m'      col-u-warn  $'\e[4;38;5;009m'
  col-mdsh    $'\e[1;38;5;220m'"${${${(M)LANG:#*UTF-8*}:+–}:--}"$'\e[0m'
  col-mmdsh   $'\e[1;38;5;220m'"${${${(M)LANG:#*UTF-8*}:+――}:--}"$'\e[0m'
  col-↔       ${${${(M)LANG:#*UTF-8*}:+$'\e[38;5;82m↔\e[0m'}:-$'\e[38;5;82m«-»\e[0m'}
  col-…       "${${${(M)LANG:#*UTF-8*}:+…}:-...}"  col-ndsh    "${${${(M)LANG:#*UTF-8*}:+–}:-}"
  col--…      "${${${(M)LANG:#*UTF-8*}:+⋯⋯}:-···}" col-lr      "${${${(M)LANG:#*UTF-8*}:+↔}:-"«-»"}"
)

function _my-cache-policy() { [[ ! -f "$1" && -n "$1"(Nm+14) ]]; }

function _force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

zstyle ':completion:complete:*' cache-policy _my-cache-policy
zstyle ':completion:*' use-compctl false
zstyle '*' single-ignored show # don't insert single value

zstyle+ ':completion:*'   list-separator '→' \
      + ''                completer _force_rehash _oldlist _extensions _complete _match _prefix _ignored _approximate _correct \
      + ''                file-sort access \
      + ''                use-cache true \
      + ''                cache-path $Zdirs[cache]/zcompcache \
      + ''                accept-exact '*(N)' \
      + ''                squeeze-slashes true \
      + ''                ignore-parents parent pwd \
      + ''                matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-,]=* r:|=*' 'l:|=* r:|=*' 'r:|?=** m:{a-z\-}={A-Z\_}' \
      + ''                muttrc "$XDG_CONFIG_HOME/mutt/muttrc" \
      + ''                rehash true \
      + ''                verbose true \
      + ''                extra-verbose true \
      + ':(^FIXTHIS):*'   group-name '' \
      + ':matches'        group true \
      + ':approximate:*'  max-errors 1 numeric \
      + ':match:*'        original only \
      + ':values'         verbose yes \
      + ':options'        verbose yes \
      + ':options'        description true \
      + ':options'        auto-description '%d' \
      + ':descriptions'   format '[%d]' \
      + ':warnings'       format '%F{1}-- no matches found --%f' \
      + ':corrections'    format '%F{5}!- %d (errors: %e) -!%f' \
      + ':expansions'     format '%F{22}>> %d for %B%o%b <<%f' \
      + ':default'        list-prompt '%S%M matches%s' \
      + ':default'        select-prompt '%F{2}%S-- %p -- [%m]%s%f' \
      + ':manuals.(^1*)'  insert-sections   true \
      + ':manuals'        separate-sections true \
      + ':jobs'           numbers true \
      + ':sudo:*'         command-path /usr/{local/{sbin,bin},(s|)bin}(N-/) \
                                       /sbin \
                                       /bin \
                                       $CARGO_HOME/bin(N-/) \
                                       $ZINIT[BIN_DIR](N-/) \
      + ':sudo::'         environ PATH="$PATH"


zstyle+ ':completion:*' '' '' \
      + ':complete:*'                   gain-privileges 1 \
      + ':*:(-command-|export):*'       fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-} \
      + '*:processes'                   command "ps -u $USER -o pid,user,comm -w -w" \
      + ':expand:*'         tag-order   all-expansions \
      + ':*:-subscript-:*'  tag-order   indexes parameters \
      + ':*:-subscript-:*'  group-order indexes parameters \
      + ':*:-command-:*:*'  group-order path-directories functions commands builtins \
      + ':complete:-command-::commands'  ignored-patterns '*\~' \
      + ':functions'                     ignored-patterns '(pre(cmd|exec))' \
      + ':-tilde-:*'        tag-order   '! users'
      # + ':-tilde-:*'      group-order named-directories directory-stack path-directories \

# For sudo kill, show all processes except childs of kthreadd (ie, kernel
zstyle -e ':completion:*:*:kill:*:processes' \
  command '[[ $BUFFER == sudo* ]] \
             && reply=( "ps --forest -p 2 --ppid 2 --deselect -o pid,user,cmd" ) \
             || reply=( "ps x --forest -o pid,cmd" )'
# zstyle ':completion:*:processes-names' command 'ps axho command'

# Ignore all completions starting with '_' in command position
zstyle+ ':completion:*' '' '' \
      + ':(^approximate*):*:functions' ignored-patterns '_*'
      # + ':*:-command-:*:*'      tag-order 'functions:-non-comp *' functions \
      # + ':*:functions-non-comp' ignored-patterns '_*' \

## Complete options for cd with '-'
zstyle ':completion:*:(cd|chdir|pushd):*' complete-options true
## Add directory-stack to the default offered tags
zstyle ':completion:*:cd:*'               tag-order "local-directories directory-stack" path-directories
# only if prefix is ../
zstyle -e ':completion:*'  special-dirs '[[ $PREFIX = (../)#(.|..) ]] && reply=(..)'
# zstyle ':completion::approximate*:*' prefix-needed false

# pattern:tag:description
#  - Description adds them to another group
zstyle+ ':completion:*' '' '' \
      + ':feh:*'                   file-patterns    '*.{png,jpg,svg}:images:images *(-/):directories:dirs'                               \
      + ':(n|)sxiv:*'              file-patterns    '*.{png,gif,jpg}:images:images *(-/):directories:dirs'                               \
      + ':*:perl:*'                file-patterns    '*.(#i)pl:perl(-.) *(-/):directories *((^-/)|(^(#i)pl)):globbed-files' '*:all-files' \
      + ':*:python:*'              file-patterns    '*.(#i)py:python(-.) *(-/):directories' '*:all-files'                                \
      + ':*:ruby:*'                file-patterns    '*.(#i)rb:ruby(-.) *(-/):directories'  '*:all-files'                                 \
      + ':(rm|rip):*'              file-patterns    '*:all-files'                                                                        \
      + ':jq:*'                    file-patterns    '*.{json,jsonc}:json:json *(-/):directories:dirs'                                    \
      + ':xcompress:*'             file-patterns    '*.{7z,bz2,gz,rar,tar,tbz,tgz,zip,xz,lzma}:compressed:compressed *:all-files:'       \
      + ':*:-redirect-,2(>|)>,*:*' file-patterns    '*.(log|txt)' '%p:all_files'                                                         \
      + ':*:z(re|)compile:*'       ignored-patterns '(*~|*.zwc(|.old))'                                                                         \
      + ':*:nvim:*files'           ignored-patterns '*.(avi|mkv|pyc|zwc|mp4|webm|png)'                                                   \
      + ':git-checkout:*' sort false                                                  \
      + ''                sort true                                                     \
      + ':(mv|cd|rm|rip|diff(|sitter)|delta|(git-|)dsf|difft|git-(add|rm)|bat|nvim):*'   sort false \
      + ':(mv|rm|rip|kill|git-(add|rm)|bat|nvim):*' ignore-line other \
      + ':((w|cw|s|img|)diff|diff(sitter|t)|delta|(git-|)dsf):*' ignore-line other \
      + ':(z(re|)compile|comm):*' ignore-line other \
      + ':((n|)sxiv|mpv|mpd|beets|cargo|rustc|python|perl|ruby|lua):*' ignore-line other \

zstyle+ ':completion:complete:*' '' '' \
      + ':(nvim|cd|z):*' file-sort access

zstyle ':completion:*:(eza|nvim|z):*' list-colors ${(s.:.)LS_COLORS} \

## 3 Fzf tab
#=======================================================================
#zstyle ':fzf-tab:*' fzf-command fzf -- Specify the fuzzy search program, another -> ftb-tmux-popup
#zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-a:toggle-all --  append custom keybindings to fzf
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' -- set preview
# fzf-flags Any extra flags for the fzf-command.
# fzf-pad  How many lines does fzf's prompt occupied. You may need to set this to 4 if you have set --border for fzf.
# fzf-min-height Minimal height of fzf's prompt. You may want to increase it if you use fzf-preview.
# accept-line It specifies the key to accept and run a suggestion in one keystroke.
# zstyle ':fzf-tab:*' continuous-trigger '/'
# zstyle ':fzf-tab:*' print-query alt-enter
# zstyle ':fzf-tab:*' switch-group F1 F2
#
#{_FTB_INIT_} initialize some special variables:
#   $word This is the real string to be insert into your commandline.
#   $realpath 
#   $words Any array of your current input.
#=======================================================================
typeset -ga FZF_TAB_GROUP_COLORS=(
    $'\e[38;5;12m'  $'\e[38;5;52m' $'\e[38;5;53m' $'\e[38;5;17m'
    $'\e[38;5;19m'  $'\e[38;5;13m' $'\e[38;5;16m' $'\e[38;5;48m'
    $'\e[38;5;14m'  $'\e[38;5;47m' $'\e[38;5;45m' $'\e[38;5;21m'
    $'\e[38;5;1m'   $'\e[38;5;3m'  $'\e[38;5;4m'  $'\e[38;5;54m'
    $'\e[38;5;5m'   $'\e[38;5;6m'  $'\e[38;5;18m' $'\e[38;5;49m'
    $'\e[38;5;2m'   $'\e[38;5;21m' $'\e[38;5;22m' $'\e[38;5;12m'
    $'\e[38;5;129m' $'\e[38;5;26m' $'\e[38;5;50m' $'\e[38;5;67m'
  )
zstyle+ ':fzf-tab:*'    print-query ctrl-c \
      + ''              continuous-trigger '/' \
      + ''              accept-line space \
      + ''              prefix '' \
      + ''              query-string prefix input first \
      + ''              group-colors $FZF_TAB_GROUP_COLORS \
      + ''              default-color $'\e[38;5;53m' \
      + ''              switch-group 'alt-,' 'alt-.' \
      + ''              show-group full \
      + ''              single-group header color \
      + ''              fzf-min-height 20 \
      + ''              fzf-pad 4 \
      + ''              fzf-flags "--exact" \
      + ''              fzf-bindings \
                            'alt-e:execute-silent({_FTB_INIT_}$EDITOR "$realpath" < /dev/tty > /dev/tty)' \
                            'alt-b:execute-silent({_FTB_INIT_}[[ -f "$realpath" ]] && bat --paging=always -f "$realpath" < /dev/tty > /dev/tty)' \
                            'ctrl-h:jump,jump-cancel:abort' \
                            'ctrl-y:execute({_FTB_INIT_}wl-copy "$word")'

zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# == ':fzf-tab:complete:(nvim):argument-rest'
zstyle+ \
  ':fzf-tab:complete' '' '' \
    + ':(nvim|eza|z):argument-rest' fzf-flags '--preview-window=nohidden,right:60%:wrap' \
    + ':(nvim|eza|z):argument-rest' fzf-preview \
                            'r=$realpath; w=$(( COLUMNS * 0.60 )); integer w; \
                                ([[ -f $r ]] && bat --style=numbers --terminal-width=$w --color=always $r) \
                                || ([[ -d $r ]] && bkt -- eza -F -T --icons --color=always $r | less) || (echo $r 2> /dev/null | head -200)' \
    + ':systemctl-*:*'  fzf-preview \
                            'local user; \
                               [[ $words == *--user* || $words == ^se ]] && user="--user"; \
                               SYSTEMD_COLORS=1 systemctl $user status $word' \
    + ':systemctl-*:*'  fzf-flags '--preview-window=nohidden,right:65%:nowrap' \
    + ':figlet:option-f-1'       fzf-preview 'figlet -f $word Hello world' \
    + ':figlet:option-f-1'       fzf-flags '--preview-window=nohidden,right:65%:nowrap' \
    + ':run-help:*'              fzf-preview 'autoload +X -Uz run-help; eval "() { $functions[run-help] } $word"' \
    + ':run-help:*'              fzf-flags '--preview-window=nohidden,right:65%:nowrap' \
    + ':man:*'                   fzf-preview 'man $word | bat --color=always -l man' \
    + ':man:(^options)'          fzf-flags '--preview-window=nohidden,right:65%:wrap' \
    + ':ssh:*'                   fzf-preview 'dig $desc' \
    + ':ssh:*'                   fzf-flags '--preview-window=nohidden,right:65%:nowrap' \
    + ':jq:argument-rest'           fzf-preview 'jq --color-output . "$desc"' \
    + ':jq:argument-rest'           fzf-flags '--preview-window=nohidden,right:65%:nowrap' \
    + ':kill:*'                  popup-pad 0 3 \
    + ':(kill|ps):argument-rest' fzf-flags '--preview-window=down:3:wrap' \
    + ':(kill|ps):argument-rest' fzf-preview '[[ $group == *ID ]] && ps --pid=$word -o cmd --no-headers -w -w' \
    + ':cdr:*'                   fzf-preview 'eza -TL 3 --color=always ${~desc}' \
    + ':(eza|cd):*'              popup-pad 30 0 \
    + ':((cd|cdr|cd_):*|eza:argument-*)' fzf-flags '--preview-window=nohidden,right:45%:nowrap' \
    + ':eza:argument-*' \
          fzf-preview 'r=$(readlink -f $realpath); \
                      ([[ -d $r ]] && bkt -- eza -TL 4 --color=always -- $r) \
                        || ([[ -f $r ]] && stdbuf -oL grc --colour=on stat $r)' \
    + ':(cd|cd_):*' \
          fzf-preview 'zmodload -Fa zsh/parameter p:nameddirs; \
                       nameddirs=( '"${(kv)nameddirs}"' ); local named=${(e)~${${(@s: → :)desc}[2]}}; \
                       ([[ -d $named ]] && bkt -- eza -TL 4 --icons --color=always -- "$named") \
                         || ([[ -d $realpath ]] && bkt -- eza -TL 4 --color=always -- "${realpath:A}")' \
    + ':((cp|rm|rip|mv|bat):argument-rest|diff:argument-(1|2)|diffsitter:)' \
          fzf-preview 'r=$(readlink -f $realpath); w=$(( COLUMNS * 0.60 )); integer w; \
                      ([[ -f $r ]] && bat --plain --color=always --terminal-width=$w -- $r) \
                        || ([[ -d $r ]] && bkt -- ls --color=always -- $r)' \
    + ':((cp|rm|rip|mv|bat):argument-rest|diff:argument-(1|2)|diffsitter:)' \
          fzf-flags '--preview-window=nohidden,right:65%:wrap' \
    + ':(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}' \
    + ':tldr:argument-1'         fzf-preview 'tldr --color always $word' \
    + ':diff:*'                   popup-min-size 80 12 \
    + ':git-(add|diff|restore):*' popup-min-size 80 12 \
    + ':git-(add|diff|restore):*' fzf-preview 'git diff $word | delta' \
    + ':git-(add|diff|restore|show|checkout):*' fzf-flags '--preview-window=nohidden,right:65%:nowrap' \
    + ':git-log:*'               fzf-preview 'git log --color=always $word' \
    + ':git-help:*'              fzf-preview 'git help $word | bat -plman --color=always' \
    + ':git-show:*'              fzf-preview 'case "$group" in \
                                               ("commit tag") git show --color=always $word ;;
                                               (*) git show --color=always $word | delta    ;;
                                              esac' \
    + ':git-checkout:*'          fzf-preview  'case "$group" in
                                                ("modified file") git diff $word | delta ;;
                                                ("recent commit object name") git show --color=always $word | delta ;;
                                                (*) git log --color=always -p --stat --ignore-all-space $word ;;
                                               esac'

  zstyle ':fzf-tab:user-expand:*' fzf-preview 'less ${(Q)word}'
