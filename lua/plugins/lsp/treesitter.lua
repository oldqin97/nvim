-- Treesitter 语法高亮引擎配置
-- local languages = require("plugins.utils.treesitter_languages")
return {
  {
    -- event = { "BufRead", "BufNewFile" },
    event = { "BufReadPost", "BufNewFile" },
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "MeanderingProgrammer/treesitter-modules.nvim",
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
    opts = {
      autotag = { enable = true },
      ensure_installed = {
        "bash",
        "regex",
        "vim",
        "lua",
        "html",
        "markdown",
        "markdown_inline",
        "css",
        "typescript",
        "tsx",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "graphql",
        "prisma",
        "rust",
        "go",
        "c",
        "cpp",
        "clojure",
        "dart",
        "dockerfile",
        "scss",
        "swift",
        "toml",
        "vue",
        "zig",
        "svelte",
        "solidity",
        "http",
        "python",
      },

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
  -- {
  --   "MeanderingProgrammer/treesitter-modules.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   opts = function()
  --     require("treesitter-modules").setup({
  --       incremental_selection = {
  --         enable = true,
  --         disable = false,
  --         keymaps = {
  --           node_incremental = "v",
  --           node_decremental = "V",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
