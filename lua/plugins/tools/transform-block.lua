-- 代码块格式切换（例如对象字面量 / 数组 单行 ⇄ 多行）
return {
  "Wansmer/treesj",
  event = "BufReadPost",
  config = function()
    require("treesj").setup({ use_default_keymaps = false })
  end,
  keys = {
    { "<A-m>", "<cmd>TSJToggle<CR>", desc = "Ts toggle" },
  },
}
