-- Treesitter 语法高亮引擎配置
local languages = require("plugins.utils.treesitter_languages")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    opts = {
      autotag = { enable = true },
      ensure_installed = languages,
      auto_install = true,
      ignore_install = {},
      sync_install = false,
      highlight = {
        enable = true,
        disable = { "css" },
      },
      autopairs = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      indent = {
        enable = true,
        disable = { "dart" },
      },
    },
  },
  -- Treesitter 增量选择模块
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module 'treesitter-modules'
    opts = function()
      require("treesitter-modules").setup({
        incremental_selection = {
          enable = true,
          disable = false,
          keymaps = {
            node_incremental = "v",
            node_decremental = "V",
          },
        },
      })
    end,
  },
}
