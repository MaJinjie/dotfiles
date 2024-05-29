# [[ 为已有程序定义的 aliases ]]
typeset -A my_aliases
(($+commands[fzf])) && {
    (($+commands[fd])) && {
        (($+commands[fzf-fd])) && my_aliases+=( ff "fzf-fd --alias --split --popup --args '-E [$Const[punct]]*' -H -d6" ) 
    }
    (($+commands[rg])) && {
        (($+commands[fzf-rg])) && my_aliases+=( ss "FZF_TMUX_OPTS='-p100%,100%' fzf-rg --alias --split --popup --args \"--threads=2\" --warm -d6" )
    }
    (($+commands[nvim])) && {
        (($+commands[fzf-of])) && my_aliases+=( fo "fzf-of --popup" )
        (($+commands[fzf-man])) && my_aliases+=( fm "fzf-man --popup" )
    }
    (($+commands[rualdi])) && my_aliases+=( ck "radf" )
    
}

(($+commands[rustc])) && {
    (($+commands[bacon])) && my_aliases+=(
        rb "bacon"
    )
}

(($+commands[nvim])) && my_aliases+=(
    vi "nvim"
)

(($+commands[dotbare])) && my_aliases+=(
    .git "$(realpath $commands[dotbare])"
)

(($+commands[eza])) && {
    autoload -Uz after before
    my_aliases+=(
        ls "eza -F --color=always --icons --group-directories-first"
        lsf "ls --only-files"
        lsd "ls --only-dirs"
        lsx 'ls -- *(N*)' # executable
        lsl 'ls -d -- *(N@)'
        ls. "ls -d -- .*"
        lst "ls -T"
        
        lt "ls -T -L"

        #sort  modified < accessed < changed
        lse "ls --sort=extension"
        lsc "ls --sort=changed --reverse"
        lsa "ls --sort=accessed --reverse"
        lsm "ls --sort=modified --reverse"
        #sort 15
        lso "ls -- *(N-.DOa[1,15])"
        lsn "ls -- *(N-.Doa[1,15])"

        # ll
        ll "eza -lHgbF --git --icons --time-style long-iso --octal-permissions --group-directories-first --git-ignore"
        llf "ll --only-files"
        lld "ll --only-dirs"
        llx 'll -- *(*)' # executable
        lll 'll -- *(N@)'
        ll. "ll -d -- .*"
        
        #sort
        lle "ll --sort=extension"
        llc "ll --sort=changed --reverse"
        lla "ll --sort=accessed --reverse"
        llm "ll --sort=modified --reverse"
        #sort 15
        llo "lla -- *(N-.DOa[1,10])"
        lln "lla -- *(N-.Doa[1,10])"
    )
}

(($#my_aliases)) && for k v in "${(@kv)my_aliases}"; do 
    aliases[$k]=$v
done
