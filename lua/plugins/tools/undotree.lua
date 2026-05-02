-- 撤销树可视化（可视化查看和跳转编辑历史）
return {
  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    keys = {
      { "md", "<cmd>Atone toggle<cr>", desc = "undoTree" },
    },
    opts = {
      layout = {
        direction = "left",
        width = 0.50,
      },
      diff_cur_node = {
        enabled = true,
        split_percent = 0.5,
      },
      keymaps = {
        tree = {
          undo_to = "o",
        },
      },
    },
  },
}
