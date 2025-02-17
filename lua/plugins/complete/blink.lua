return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- "hrsh7th/cmp-emoji",
      "moyiz/blink-emoji.nvim",
      "saghen/blink.compat",
      "hrsh7th/cmp-calc",
      "jdrupal-dev/css-vars.nvim",
      "bydlw98/blink-cmp-env",
      {
        "uga-rosa/cmp-dictionary",
        config = function()
          require("cmp_dictionary").setup({
            paths = { "/usr/share/dict/words" },
            exact_length = 5,
          })
        end,
      },
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
