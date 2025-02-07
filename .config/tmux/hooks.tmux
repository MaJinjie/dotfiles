# 浮动会话设置选项
set-hook -g session-created { if -F '#{m:*-float,#S}' { 
        set -t: status off 
        set -t: pane-border-status off
        set -t: detach-on-destroy on
    } }

# tmux 允许命令在触发特定事件时运行，这些事件被称为钩子（hooks）。
# 钩子以数组选项的形式存储，数组的成员按顺序执行。
# 当钩子触发时，它们会依次运行。与其他选项类似，钩子可以是全局的，也可以属于特定的会话、窗口或窗格。
# 可以使用 set-hook 或 set-option 命令配置钩子，并通过 show-hooks 或 show-options -H 查看钩子。
# show-hooks [-gpw]    [-t target-pane]
# set-hook   [-agpRuw] [-t target-pane] hook-name command
#   -a  → append to hook
#   -g  → add hook to global list
#   -p  → set pane hooks
#   -R  → run hook immediately
#   -t  → specify target session
#   -u  → unset a hook
#   -w  → set window hooks
# client-active           when a client becomes the latest active client of its session.
# client-attached         when a client is attached.
# client-detached         when a client is detached.
# client-focus-in         when focus enters a client
# client-focus-out        when focus exits a client
# client-resized          when a client is resized.
# client-session-changed  when a client's attached session is changed.
# pane-died               when the program running in a pane exits, but remain-on-exit is on so the pane has not closed.
# pane-exited             when the program running in a pane exits.
# pane-focus-in           when the focus enters a pane, if the focus-events option is on.
# pane-focus-out          when the focus exits a pane, if the focus-events option is on.
# pane-set-clipboard      when the terminal clipboard is set using the xterm1 escape sequence.
# session-created         when a new session created.
# session-closed          when a session closed.
# session-renamed         when a session renamed.
# window-layout-changed  when a window layout is changed.
# window-linked           when a window is linked into a session.
# window-renamed          when a window is renamed.
# window-resized          when a window is resized.  This may be after the client-resized hook is run.
# window-unlinked         when a window is unlinked from a session.
# command-error           when a command fails.

# vim: set filetype=tmux tabstop=4 shiftwidth=4 :
