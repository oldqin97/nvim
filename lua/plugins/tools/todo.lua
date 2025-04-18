---@diagnostic disable: undefined-field
return {
  "folke/todo-comments.nvim",
  event = "LazyFile",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>st", false },
    {
      "<A-t>",
      function()
        Snacks.picker.todo_comments()
      end,
      { desc = "Todo list" },
    },
  },
  opts = {
    keywords = {
      FIX = {
        icon = " ",
        color = "#DC2626",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = " ", color = "#2563EB" },
      HACK = { icon = " ", color = "#909399" },
      WARN = { icon = " ", color = "#FBBF24", alt = { "WARNING" } },
      PERF = { icon = "󰘵 ", color = "#7C3AED", alt = { "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󱝿 ", color = "#10B981", alt = { "INFO" } },
      TEST = { icon = "󰤒 ", color = "#FF00FF", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
      keyword = "bg",
      after = "",
      before = "",
    },
  },
}
