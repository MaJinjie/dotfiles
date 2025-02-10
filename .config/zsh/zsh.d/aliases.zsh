(($+commands[eza])) && {
    autoload -Uz after before

    alias -g @OM='--sort=modified --reverse' @OA='--sort=accessed --reverse' @OE='--sort=extension'  @OC='--sort=changed --reverse'
    alias -g @O/='--group-directories-first'

    alias ls="eza -F --color=always --icons --sort=oldest"
    alias 'lsf'="ls --only-files"
    alias 'ls/'="ls --only-dirs"
    alias 'ls*'='ls -d *(Nn*)'
    alias 'ls@'='ls -d *(Nn@)'
    alias 'ls.'="ls -d .*(Nn)"

    # ll
    alias ll="eza -lHgbF --git --icons --time-style long-iso --octal-permissions --git-ignore --sort=oldest"
    alias 'llf'="ll --only-files"
    alias 'll/'="ll --only-dirs"
    alias 'll*'='ll -d *(Nn*)' # executable
    alias 'll@'='ll -d *(Nn@)'
    alias 'll.'="ll -d .*(Nn)"
}

(($+commands[tmux])) && {
    alias t=tmux
}

(($+commands[tmuxinator])) && {
    alias tm=tmuxinator
}
