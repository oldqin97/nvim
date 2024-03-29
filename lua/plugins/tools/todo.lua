return {
  "folke/todo-comments.nvim",
  event = "LazyFile",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>st", false },
    { "<A-t>", "<cmd>TodoTelescope<CR>", { desc = "Todo list" } },
  },
  -- TODO: 1231231
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
  -- config = function()
  --   require("todo-comments").setup({
  --     keywords = {
  --       FIX = {
  --         icon = " ",
  --         color = "#DC2626",
  --         alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
  --       },
  --       TODO = { icon = " ", color = "#2563EB" },
  --       HACK = { icon = " ", color = "#909399" },
  --       WARN = { icon = " ", color = "#FBBF24", alt = { "WARNING" } },
  --       PERF = { icon = "󰘵 ", color = "#7C3AED", alt = { "PERFORMANCE", "OPTIMIZE" } },
  --       NOTE = { icon = "󱝿 ", color = "#10B981", alt = { "INFO" } },
  --       TEST = { icon = "󰤒 ", color = "#FF00FF", alt = { "TESTING", "PASSED", "FAILED" } },
  --     },
  --     highlight = {
  --       keyword = "bg",
  --       after = "",
  --       before = "",
  --     },
  --   })
  -- end,
}
