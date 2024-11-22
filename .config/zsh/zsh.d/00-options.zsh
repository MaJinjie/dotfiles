# link: https://zsh.sourceforge.io/Doc/Release/Options-Index.html

#============================= Options =============================#

#============================= history
setopt APPEND_HISTORY
setopt HIST_BEEP
setopt HIST_FIND_NO_DUPS      # 在行编辑历史中不搜索重复项，即使重复项不连续
setopt HIST_IGNORE_ALL_DUPS   # 新命令与旧命令重复，则删除旧命令
# setopt HIST_IGNORE_DUPS       # 命令行和前一个重复，则不写入历史记录
setopt HIST_IGNORE_SPACE      # 命令行第一个字符是空格，就把它从历史记录中删除
                              # 我们可以利用这个特性，执行一些命令却不加入历史记录
setopt HIST_LEX_WORDS         # 能够正确处理包含空格的引号字符串，但可能会很慢
setopt HIST_NO_STORE          # 从历史记录中删除history(fc -l)命令
setopt HIST_REDUCE_BLANKS     # 删除命令行中多于的空格
setopt HIST_VERIFY            # 历史拓展不直接执行，而是先写入行缓冲区
setopt INC_APPEND_HISTORY     # 以增量方式写入，而不是等shell退出
setopt HIST_FCNTL_LOCK        # use fcntl to lock hist file
setopt HIST_SUBST_PATTERN     # allow :s/:& to use patterns instead of strings

#============================= completion
setopt COMPLETE_ALIASES       # 不去扩展别名
setopt complete_in_word       # allow completions in middle of word
setopt always_to_end          # cursor moves to end of word if completion is executed
setopt menu_complete          # insert first match from menu if ambiguous (non-fzf-tab)
setopt auto_menu              # automatically use menu completion (non-fzf-tab)
setopt list_types             # show type of file with indicator at end
setopt list_packed            # completions don't have to be equally spaced
setopt glob_complete          # generate glob matches as completions
setopt glob_dots              # do not require leading '.' for dotfiles
setopt glob_star_short        # ** == **/*
setopt no_case_paths          # nocaseglob + casepaths treats only path components containing glob chars as insensitive
setopt numeric_glob_sort      # sort globs numerically

#============================= emulation
# setopt APPEND_CREATE          # 追加重定向文件不存在时不会报告错误
# setopt BASH_REMATCH           # =~运算符执行的匹配设置在BASH_REMATCH数组变量中
# setopt KSH_ARRAYS             # 数组从0编号
# setopt CSH_JUNKIE_QUOTES      # 更改双引号和单引号匹配规则

#============================= directory
setopt AUTO_CD                # 命令是目录名称，对目录执行cd
setopt AUTO_PUSHD             # 将旧目录自动推送到堆栈上
setopt PUSHD_IGNORE_DUPS      # 不要将同一个目录推送到堆栈上
setopt CDABLE_VARS            # 不是目录是一个名称，名称的值是目录，cd过去
setopt CD_SILENT PUSHD_SILENT # 不要在cd后或pushd后打印工作目录
setopt CHASE_DOTS             # /foo/bar -> /alt/rod cd /foo/bar/.. -> /alt

#============================= globbing | matching
setopt BARE_GLOB_QUAL         # 模式后面括号不包含(| ( ~),则视为限定符列表
setopt extended_glob          # extension of glob patterns
setopt REMATCH_PCRE           # when using =~ use PCRE regex
setopt KSH_GLOB               # @ * + ? !
setopt case_glob              # case insensitive globbing
# setopt case_match # when using =~ make expression sensitive to case

#============================= others
setopt unset                  # don't error out when unset parameters are used
setopt rc_quotes              # allow '' inside '' to indicate a single '
setopt interactive_comments   # allow comments in history
setopt long_list_jobs         # list jobs in long format by default
setopt notify                 # report status of jobs immediately
setopt short_loops            # allow short forms of for, repeat, select, if, function
setopt no_rm_star_silent      # query the user before executing `rm *' or `rm path/*'
setopt monitor                # enable job control
setopt no_bg_nice             # don't run background jobs in lower priority by default

setopt c_bases                # 0xFF instead of 16#FF
setopt c_precedences          # use precendence of operators found in C
setopt octal_zeroes           # 077 instead of 8#77
setopt multios                # perform multiple implicit tees and cats with redirection

setopt correct                # try to correct mistakes
setopt correct_all
setopt EMACS
# setopt VI
