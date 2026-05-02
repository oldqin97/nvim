-- blink.cmp 补全插件配置
return {
  {
    "saghen/blink.cmp",
    event = "VeryLazy",
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
    },
    opts = {
      keymap = require("plugins.conf.blinkConf").keymaps,
      appearance = require("plugins.conf.blinkConf").appearance,
      fuzzy = require("plugins.conf.blinkConf").fuzzy,
      completion = require("plugins.conf.blinkConf").completion,
      sources = require("plugins.conf.blinkConf").sources,
      cmdline = require("plugins.conf.blinkConf").cmdline,
      signature = require("plugins.conf.blinkConf").signature,
    },

    opts_extend = { "sources.default" },
  },
}
