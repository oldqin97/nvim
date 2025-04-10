return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "moyiz/blink-emoji.nvim",
      "saghen/blink.compat",
      "hrsh7th/cmp-calc",
      "jdrupal-dev/css-vars.nvim",
      "Saecki/crates.nvim",
      {
        "Kaiser-Yang/blink-cmp-dictionary",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
      "mikavilpas/blink-ripgrep.nvim",
      -- "bydlw98/blink-cmp-env",
      -- {
      --   "Jezda1337/nvim-html-css",
      --   dependencies = { "saghen/blink.cmp", "nvim-treesitter/nvim-treesitter" },
      --   opts = {
      --     enable_on = {
      --       "html",
      --       "htmldjango",
      --       "tsx",
      --       "jsx",
      --       "erb",
      --       "svelte",
      --       "vue",
      --       "blade",
      --       "php",
      --       "templ",
      --       "astro",
      --     },
      --     handlers = {
      --       definition = {
      --         bind = "gd",
      --       },
      --       hover = {
      --         bind = "gh",
      --         wrap = true,
      --         border = "none",
      --         position = "cursor",
      --       },
      --     },
      --     documentation = {
      --       auto_show = true,
      --     },
      --     style_sheets = {
      --       -- "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
      --       -- "https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.3/css/bulma.min.css",
      --       -- "./*.css", -- `./` refers to the current working directory.
      --       -- "./src/index.css", -- `./` refers to the current working directory.
      --       -- "./src/components.css", -- `./` refers to the current working directory.
      --     },
      --   },
      -- },
    },
    opts = {
      keymap = require("plugins.conf.blinkConf").keymaps,
      appearance = require("plugins.conf.blinkConf").appearance,
      completion = require("plugins.conf.blinkConf").completion,
      sources = require("plugins.conf.blinkConf").sources,
      cmdline = require("plugins.conf.blinkConf").cmdline,
    },

    opts_extend = { "sources.default" },
  },
}
