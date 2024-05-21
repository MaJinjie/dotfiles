# 1 autoload 
autoload -Uz ${^fpath[1,$fpath[(I)$Zdirs[comp]]]:#$Zdirs[func]/garbage}/*(N.:t) # autoload 1 - $Zdirs[comp]

# 2 add-zsh-hook
autoload -U add-zsh-hook

add-zsh-hook chpwd @chpwd_ls


