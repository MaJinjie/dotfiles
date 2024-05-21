## 1 HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS   # replace duplicate commands in history file
setopt HIST_IGNORE_DUPS       # do not enter command lines into the history list if they are duplicates
setopt HIST_IGNORE_SPACE      # don't add if starts with space
setopt HIST_REDUCE_BLANKS     # remove superfluous blanks from each command
setopt HIST_EXPIRE_DUPS_FIRST # if the internal history needs to be trimmed, trim oldest
setopt HIST_FCNTL_LOCK        # use fcntl to lock hist file
setopt HIST_SUBST_PATTERN     # allow :s/:& to use patterns instead of strings
setopt EXTENDED_HISTORY       # add beginning time, and duration to history
setopt APPEND_HISTORY         # all zsh sessions append to history, not replace
setopt SHARE_HISTORY          # imports commands and appends, can't be used with inc_append_history
setopt NO_HIST_NO_FUNCTIONS   # don't remove function defs from history
setopt INC_APPEND_HISTORY     # append to history file immediately, not when shell exits

## 2 DIRECTORY
setopt AUTO_CD           # if command name is a dir, cd to it
setopt AUTO_PUSHD        # cd pushes old dir onto dirstack
setopt PUSHD_IGNORE_DUPS # don't push dupes onto dirstack
setopt PUSHD_MINUS       # inverse meaning of '-' and '+'
setopt PUSHD_SILENT      # don't print dirstack after 'pushd' / 'popd'
setopt CD_SILENT         # don't print dirstack after 'cd'
setopt CDABLE_VARS       # if item isn't a dir, try to expand as if it started with '~'

## 3 MATCHING
setopt extended_glob # extension of glob patterns
setopt rematch_pcre  # when using =~ use PCRE regex
setopt KSH_GLOB      # @ * + ? !
setopt case_glob     # case insensitive globbing
setopt case_match    # when using =~ make expression sensitive to case

## 4 COMPLETION
setopt complete_in_word # allow completions in middle of word
setopt always_to_end    # cursor moves to end of word if completion is executed
setopt menu_complete    # insert first match from menu if ambiguous (non-fzf-tab)
setopt auto_menu        # automatically use menu completion (non-fzf-tab)
setopt list_types       # show type of file with indicator at end
setopt list_packed      # completions don't have to be equally spaced
setopt glob_complete    # generate glob matches as completions
setopt glob_dots        # do not require leading '.' for dotfiles
# setopt glob_star_short   # ** == **/*      *** == ***/*
setopt no_case_paths     # nocaseglob + casepaths treats only path components containing glob chars as insensitive
setopt numeric_glob_sort # sort globs numerically

## 5 OTHERS
setopt unset                # don't error out when unset parameters are used
setopt rc_quotes            # allow '' inside '' to indicate a single '
setopt interactive_comments # allow comments in history
setopt long_list_jobs       # list jobs in long format by default
setopt notify               # report status of jobs immediately
setopt short_loops          # allow short forms of for, repeat, select, if, function
setopt no_rm_star_silent    # query the user before executing `rm *' or `rm path/*'
setopt monitor              # enable job control
setopt no_bg_nice           # don't run background jobs in lower priority by default

setopt c_bases       # 0xFF instead of 16#FF
setopt c_precedences # use precendence of operators found in C
setopt octal_zeroes  # 077 instead of 8#77
setopt multios       # perform multiple implicit tees and cats with redirection

setopt correct # try to correct mistakes
setopt correct_all
setopt VI
