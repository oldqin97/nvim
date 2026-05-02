-- 包围符号操作（添加/修改/删除括号、引号等包围符号）
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end,
}
