-- 翻译插件（划词翻译）
return {
  "JuanZoran/Trans.nvim",
  build = function() require("Trans").install() end,
  keys = {
    { "<leader>w", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = "Translate" },
  },
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    frontend = {
      default = {
        title = vim.fn.has("nvim-0.9") == 1 and {
          { "", "TransTitleRound" },
          { "󰗊 Trans", "TransTitle" },
          { "", "TransTitleRound" },
        } or nil,
        auto_play = false,
        animation = { open = "fold", close = "fold", interval = 1 },
        timeout = 500,
      },
    },
  },
}
