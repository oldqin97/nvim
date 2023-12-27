return {
  -- stops inactive LSP clients
  "zeioth/garbage-day.nvim",
  event = "VeryLazy",
  opts = {
    notifications = true,
    aggressive_mode = false,
  },
}
