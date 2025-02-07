autoload -Uz "$ZDOTDIR/autoload/"**(N^/:t)

# 自动设置zle
() {
    local file
    for file in "$ZDOTDIR/autoload/zle/"*(N^/:t); do
        zle -N $file
    done
}
