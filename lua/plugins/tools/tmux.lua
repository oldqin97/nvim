-- tmux/nvim 窗口无缝导航
return {
  {
    "mrjones2014/smart-splits.nvim",
    -- v3 是破坏性更新：tmux/终端后端被拆成独立插件，须额外安装
    -- backend-tmux 并在 tmux 侧配置键位；否则在 nvim 边缘无法跳进 tmux pane。
    -- 这里先固定回 v2 最后一个提交，保持原有的无缝跳转。
    commit = "9493405fb8ee683aa6efd50c529f6296ad8f40ad",
  },
}
