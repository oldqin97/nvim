-- Flash 快速跳转插件：禁用默认 s/r/R 键以避免与自定义映射冲突
return {
  "folke/flash.nvim",
  event = "BufReadPost",
  keys = {
    { "r", mode = "o", false, desc = "Remote Flash" },
    { "s", mode = { "n", "x", "o" }, false },
    { "R", mode = { "o", "x" }, false },
  },
}
