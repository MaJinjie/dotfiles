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
setopt COMPLETE_IN_WORD       # 允许在单词中间进行补全，而不是只在末尾
setopt ALWAYS_TO_END          # 补全完成后，光标移动到补全结果的末尾
# setopt MENU_COMPLETE          # 当补全结果有歧义时，从菜单中选择第一个匹配项作为默认补全 (non-fzf-tab)
setopt AUTO_MENU              # 自动启用菜单补全，在有多个候选项时，直接显示菜单 (non-fzf-tab)
setopt LIST_TYPES             # 在补全列表中显示文件类型的指示符
setopt LIST_PACKED            # 补全列表中不要求列宽相等，更紧凑地显示结果
setopt GLOB_COMPLETE          # 允许使用通配符生成补全结果
# setopt GLOB_DOTS              # 补全隐藏文件时，不要求显式输入.
setopt GLOB_STAR_SHORT        # 将**解释为**/*，即递归匹配所有子目录和文件
setopt CASE_PATHS             # 有通配符的路径区分大小写(NO_不区分大小写)，没有通配符的路径区分大小写
setopt NUMERIC_GLOB_SORT      # sort globs numerically

#============================= directory
setopt AUTO_CD                # 命令是目录名称，对目录执行cd
setopt AUTO_PUSHD             # 将旧目录自动推送到堆栈上
setopt PUSHD_IGNORE_DUPS      # 不要将同一个目录推送到堆栈上
setopt CDABLE_VARS            # 不是目录是一个名称，名称的值是目录，cd过去
setopt CD_SILENT PUSHD_SILENT # 不要在cd后或pushd后打印工作目录
setopt CHASE_DOTS             # /foo/bar -> /alt/rod cd /foo/bar/.. -> /alt

#============================= globbing
setopt BARE_GLOB_QUAL         # 模式后面括号不包含(| ( ~),则视为限定符列表
setopt EXTENDED_GLOB          # 启用扩展的 glob 模式，允许使用更多高级匹配符
setopt REMATCH_PCRE           # when using =~ 启用 Perl 兼容正则表达式（PCRE）进行模式匹配
setopt KSH_GLOB               # @ * + ? !
setopt CASE_GLOB              # case insensitive globbing
setopt CASE_MATCH             # when using =~ make expression sensitive to case

#============================= shell
# setopt RC_EXPAND_PARAM          # 决定参数扩展过程中是否进行数组展开
# setopt SH_WORD_SPLIT            # 决定在评估时是否进行单词拆分
# setopt GLOB_SUBST               # 决定在评估时是否将字符串解释为模式
setopt EQUALS                   # =ls <==> command ls 如果一个单词以未加引号的“ = ”开头，则该单词的其余部分将被视为命令的名称
setopt BRACE_CCL                # 不满足规则则作为一个字符类对待

#============================= others
# setopt UNSET                  # 在引用未定义的变量时，不报错
setopt RC_QUOTES              # 允许在单引号内使用两个单引号表示一个单引号字符
setopt INTERACTIVE_COMMENTS   # 在交互式 shell 中允许使用 # 开头的注释
setopt LONG_LIST_JOBS         # 默认以长格式显示后台任务的详细信息
setopt NOTIFY                 # 立即报告后台任务的状态，而不需要等待下一个 shell 提示符
setopt SHORT_LOOPS            # 允许使用简短的循环和条件语句语法
setopt NO_RM_STAR_SILENT      # 删除所有文件时要求确认，而不是直接执行 `rm *' or `rm path/*'

setopt APPEND_CREATE          # 追加重定向文件不存在时不会报告错误
setopt BASH_REMATCH           # =~运算符执行的匹配设置在BASH_REMATCH数组变量中
# setopt KSH_ARRAYS             # 数组从0编号
# setopt CSH_JUNKIE_QUOTES      # 改变单引号和双引号的行为，可能会导致一些脚本异常，慎重

setopt C_BASES                # 0xFF instead of 16#FF
setopt OCTAL_ZEROES           # 077 instead of 8#77
setopt C_PRECEDENCES          # 算术表达式中使用 C 的运算符优先级规则
setopt MULTIOS                # 允许在一个命令中对多个文件进行重定向

setopt CORRECT                # 只纠正命令
# setopt CORRECT_ALL

setopt VI
