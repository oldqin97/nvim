return {
  -- stops inactive LSP clients
  "zeioth/garbage-day.nvim",
  event = { "BufRead", "InsertEnter" },
  opts = {
    notifications = true,
    aggressive_mode = false,
  },
}
