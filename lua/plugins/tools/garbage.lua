---@diagnostic disable: duplicate-set-field, missing-fields

-- 自动清理不活跃的 LSP 客户端，释放资源
return {
  "zeioth/garbage-day.nvim",
  event = { "BufRead", "InsertEnter" },
  opts = {
    notifications = true,
    aggressive_mode = false,
  },
}
