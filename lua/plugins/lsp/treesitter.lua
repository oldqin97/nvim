return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" }, -- 在读取文件或新建文件时加载
    opts = {
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "v",
          node_decremental = "V",
        },
      },
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
        "toml",
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
        "dart",
        "python",
      },
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
}
