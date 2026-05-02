-- 单词高亮插件：高亮当前光标下的所有相同单词
return {
  "dwrdx/mywords.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>m", "<cmd>lua require'mywords'.hl_toggle()<cr>", desc = "highlight word" },
    { "<leader>cs>", false },
  },
}
