(($+commands[eza])) && {
    autoload -Uz after before

    alias ls="eza -F --color=always --icons --group-directories-first"
    alias lsf="ls --only-files"
    alias lsd="ls --only-dirs"
    alias lsx='ls -- *(N*)' # executable
    alias lsl='ls -d -- *(N@)'
    alias ls.="ls -d -- .*"
    alias lst="ls -T"

    #sort  modified < accessed < changed
    alias lse="ls --sort=extension"
    alias lsc="ls --sort=changed --reverse"
    alias lsa="ls --sort=accessed --reverse"
    alias lsm="ls --sort=modified --reverse"
    #sort 15
    alias lso="ls -- *(N-.DOa[1,15])"
    alias lsn="ls -- *(N-.Doa[1,15])"

    # ll
    alias ll="eza -lHgbF --git --icons --time-style long-iso --octal-permissions --group-directories-first --git-ignore"
    alias llf="ll --only-files"
    alias lld="ll --only-dirs"
    alias llx='ll -- *(*)' # executable
    alias lll='ll -- *(N@)'
    alias ll.="ll -d -- .*"
    alias llt="ll -T"

    #sort
    alias lle="ll --sort=extension"
    alias llc="ll --sort=changed --reverse"
    alias lla="ll --sort=accessed --reverse"
    alias llm="ll --sort=modified --reverse"
    #sort 15
    alias llo="lla -- *(N-.DOa[1,10])"
    alias lln="lla -- *(N-.Doa[1,10])"

    alias lt="ls -T"

}
