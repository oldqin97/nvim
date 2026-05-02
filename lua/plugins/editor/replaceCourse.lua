---@diagnostic disable: deprecated

-- 全局搜索替换插件（使用 grug-far 替代 spectre）
return {
  {
    "MagicDuck/grug-far.nvim",
    opts = {
      headerMaxWidth = 80,
      keymaps = {
        replace = { n = "<leader>r" },
        syncLocations = { n = "<leader>s" },
        historyOpen = { n = "<leader>t" },
        close = { i = "<a-q>" },
        refresh = { n = "<leader>f" },
        openLocation = { n = "<Tab>" },
        gotoLocation = { n = "o" },
      },
    },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sm",
        function()
          local grug = require("grug-far")
          grug.open({
            prefills = {
              search = vim.fn.expand("<cword>"),
              args = "--glob '!node_modules' --glob '!.git' --hidden",
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace all",
      },
      {
        "<leader>sr",
        function()
          require("grug-far").open({
            prefills = { paths = vim.fn.expand("%"), search = vim.fn.expand("<cword>") },
            select_word = true,
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace current",
      },
    },
  },
}
