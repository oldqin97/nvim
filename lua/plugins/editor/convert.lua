-- 单位转换插件（如 px -> rem 等）
return {
  "cjodo/convert.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    { "<leader>cc", "<cmd>ConvertFindCurrent<CR>", "Find convertable unit in current line" },
  },
}
