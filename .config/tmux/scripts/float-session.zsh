# echo $0
# echo ${0:A}
# echo ${0:A:h}
CURRENT_DIR=${0:A:h}

# 定义浮动窗口的通用逻辑
tmux_floating() {
  local name=$1  # 获取传入的名称 (shell 或 man)
  
  if tmux list-panes -F '#{m:*-float,#S}' | grep -q 'true'; then
    if tmux list-windows -F '#{==:#W,shell}' | grep -q true; then
      tmux detach
      tmux neww -Sn "$name"
    fi
  else
    if ! tmux list-sessions -F '#{N/s:#{@float_session_name}}' | grep -q "${@float_session_name}"; then
      tmux set -t ":" -F "@float_session_name" "${@float_session_name}-float"
    fi
    tmux run -C "popup -E -d #{pane_current_path} -xC -yC -w#{@float_session_width} -h#{@float_session_height} \"tmux new -As \"${@float_session_name}\" -n $name\""
  fi
}
