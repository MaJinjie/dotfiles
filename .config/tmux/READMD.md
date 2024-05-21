# 1 使用
  - git clone https://github.com/MaJinjie/tmux.git ~/.config/
  - git clone git@github.com:MaJinjie/tmux.git ~/.config/

## 快捷键
  1. M-s new session 
  2. M-w new windows
  3. M-c close self pane 
  4. M-o close other panes
  5. M-q close self window
  6. M-e close other windows 
  7. M-b 分离窗格到一个单独的窗口
  8. prefix + d 会话分离
  9. prefix + r 重新加载配置文件
  10. prefix + |    prefix + _
  11. M-[0...9] 选择第k个窗口
  12. C-[jkhl] 跳转窗格 
  13. C-[up,down,left,right] 调整窗格大小
  14. prefix + v 开启vi模式
  15. M-space 切换布局

## 命令

  1. tmux attanch [-t <session>] 附加到指定的(最近的)会话
  2. tmux kill-servers 杀死tmux后台服务进程

## 配置
  if <shell-command> "run '..'" 可以运行shell命令
  if-shell <shell-command> {
    run-shell -C "run '...'"
  } 同上
  
  set-environment -g 在tmux终端生效，配置文件中不生效
  set-option(set) -g 在tmux配置中生效


# 2 插件说明
  1. tmux-plugins/tmux-resurrect
  2. tmux-plugins/tmux-continuum
  3. catppuccin/tmux
  4. aserowy/tmux.nvim
  5. tmux-plugins/tpm


## 1 catppuccin
一款tmux主题

## 2 tmux-continuum

### 介绍
  1. 持续保存tmux环境。通常是15分钟后台保存一次，不影响使用
  2. 计算机或服务器打开时，会自动启动tmux
  3. 启动tmux时，自动恢复上次的环境（仅在服务器或计算机启动时发生）

### 必要条件
  1. set -g status on 开启状态栏 

### 设置
  1. @continuum-boot 当它为on时，会自动生成${HOME}/.config/systemd/user/tmux.service文件，并启用他。
     之后，启动终端会话，systemd都会自动启动tmux
     启动的流程是 打开终端窗口 -> 执行tmux命令 
  2. @continuum-systemd-start-cmd 设置启动tmux服务器的命令，默认为new-session -d。
  3. set -g @continuum-boot-options 'alacritty,fullscreen'，可以用来设置启动的终端仿真器
  4. set -g @continuum-save-interval '60' 设置保存的间隔
  5. set -g @continuum-save-interval '0'  禁止自动保存
  6. set -g @continuum-restore 'on/off' 打开或禁用自动恢复
  7. 如何要确保不会发生自动还原，请创建一个 ~/tmux_no_auto_restore文件

### 支持 
  1. 该插件会优先于首次启动的tmux服务器来处理多服务器场景。也就是说，在启动第一台tmux服务器下，启动了第二台服务器，插件会优先处理第一台tmux服务器。

### 快捷键
  1. prefix + C-s save 
  2. prefix + C-r restore
## 3 tmux-resurrect

### 介绍
  1. 服务器或计算启动时自动恢复tmux环境

### 设置
  1. 默认不会恢复窗格的shell历史记录，需要额外设置 https://github.com/tmux-plugins/tmux-resurrect/blob/master/docs/restoring_bash_history.md
  2. set -g @resurrect-capture-pane-contents 'on' 可以保存和恢复tmux窗格的内容
  3. 以前的存档默认不会删除，都会被保存在~/.tmux/resurrect/目录中
### 支持
  1. 支持快捷键的重新绑定
  2. 支持一些钩子


## 4 tmux-copycat
  
### 快捷键

  1. prefix + C-f 文件搜索
  2. prefix + / 正则搜索
  3. prefix + C-u url搜索
  4. prefix + C-a address搜索(ip)
  5. prefix + C-d 数字搜索
  6. n/N 下一个/上一个

## 5 tmux-plugins/tpm

### 1 options
  1. set-environment -g TMUX_PLUGIN_MANAGER_PATH '/some/other/path/' 设置插件的安装路径(优先安装在$XDG_CONFIG_HOME/tmux)
  2. tpm自动安装 
      if "test ! -d ~/.tmux/plugins/tpm" \
        "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

## 6 tmux-plugins/tmux-cowboy

### keys
  1. prefix + * 杀死当前窗格正在运行的进程，向进程发送 -9 信号

## 7 tmux-power-zoom 
### options
  @power_zoom_trigger
  @power_zoom_without_prefix

### 快捷键
  1. prefix + Z 将窗格在新的窗口中打开，在原来窗格占位
  2. prefix + z(tmux默认的) 将窗格在旧窗口中打开
# 其他

  1. pstree 进程树
  2. CopyQ 一款剪切版管理器
