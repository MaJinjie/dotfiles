set -s buffer-limit         100
set -s focus-events         on
set -s set-clipboard        on
set -s escape-time          10
set -s exit-empty           on
set -s default-terminal    "tmux-256color"
set -s terminal-overrides  "alacritty:RGB"     # 颜色覆盖，可以解决tmux和alacritty终端颜色亮度不匹配的问题

set -g base-index 1
set -g pane-base-index 1

set -g prefix 'M-;'
set -g display-panes-time 2000
set -g display-time 2000
set -g history-limit 1000
set -g mode-keys vi
set -g status-keys emacs
set -g mouse on
set -g renumber-windows on
set -g set-titles on
set -g history-file $TMUX_DATA_HOME/history

set -g visual-activity off
set -g visual-bell off
set -g visual-silence on



set -g @float_session_width "80%"
set -g @float_session_height "80%"

# set -t 指定会话
# set -g 全部会话
# set -s 服务器
# set -w 窗口
# set -p 窗格

# #{var} 提取变量
# #{?condition,if_true,if_false}：tmux 内置条件表达式，判断是否满足条件
# #{operator:opt1,opt2} operator: == != < > <= >= || &&
# #{m[/ri]:pattern,string} 匹配string是否符合pattern (r: 启用正则表达式 i: 忽略大小写)
# #{e|operator:arg1,arg2} 支持整数或浮点数计算 operator: + - * / m(%) == != < <= > >= 
# #{a:digit} 将数字参数替换为等效的字符
# #{=[-]length:variable} 可以限制字符串长度(+ - 前后)
# #{=/length/prefix,suffix:variable} #{pwidth:variable} 可以限制字符串长度、添加前后缀或进行填充
# #{n:...} 扩展为变量的长度
# #{w:...} 扩展为变量的显示宽度
# #{C[|r]:...}在窗格内容中搜索给定的格式，如果找不到，则返回行号或零。

# #{t:time_var} 将时间变量转换为字符串 
#   t/p 转换为较短的格式
#   t/f/format | #{t/f/%%H#:%%M:window_activity}
# #{b:file} 获取文件名
# #{d:file} 获取目录名
# #{E:...} 扩展两次
# #{T:...} 同上，但也扩展strftime的指定符
# #{[SWPL]:...} 循环遍历每一个会话、窗口、窗格或客户端并为每一个插入一次格式
#   如果给出两个，第二个用于当前窗口或活动窗格 
#   #{W:#{E:window-status-format} ,#{E:window-status-current-format} }
# N: 检查窗口（没有任何后缀或带有 w 后缀）或会话（带有 s 后缀）的名称是否存在，例如 N/w:foo 如果名为 foo 的窗口存在，则替换为 1。
# 形式为 s/foo/bar/: 的前缀将替换所有出现的 foo 为 bar。
#   第一个参数可以是扩展正则表达式，最后一个参数可以是 i，表示忽略大小写，例如 s/a(.)/\1x/i: 会将 abABab 变为 bxBxbx。
#   也可以使用不同的分隔符字符，以避免模式中出现的斜杠冲突。例如，s|foo/|bar/|: 会将所有出现的 foo/ 替换为 bar/
# #{q:...} 转义 sh(1) 特殊字符 #{q/h:...} 同时转义哈希字符#
# #(command) 插入shell 命令的最后一行输出
# #{l:...} 按字面意思解释

# flag:
#   window_zoomed_flag

# -t 
# <session-name> | <session-id>
# <session-name>:<window-index> | :<window-index>
# <session-name>:<window-index>.<pane-index> | .<pane-index>

# #: 
#   ## -> #
#   #, -> ,
#   #} -> #}
#   #{session_name} -> #S

# vim: set filetype=tmux tabstop=4 shiftwidth=4 :
