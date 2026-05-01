local languages = require("plugins.utils.treesitter_languages")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" }, -- 在读取文件或新建文件时加载
    opts = {
      autotag = {
        enable = true,
      },
      -- incremental_selection = {
      --   enable = false,
      --   keymaps = {
      --     node_incremental = "v",
      --     node_decremental = "V",
      --   },
      -- },
      ensure_installed = languages,
      auto_install = true,
      ignore_install = { "" },
      sync_install = false,

      highlight = {
        enable = true,
        disable = { "css" },
      },
      autopairs = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      indent = {
        enable = true,
        disable = {
          "dart",
        },
      },
    },
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module 'treesitter-modules'
    -- opts = {},
    opts = function()
      require("treesitter-modules").setup({
        incremental_selection = {
          enable = true,
          disable = false,
          keymaps = {
            node_incremental = "v",
            node_decremental = "V",
            -- init_selection = "gnn",
            -- scope_incremental = "grc",
          },
        },
      })
    end,
  },
}
