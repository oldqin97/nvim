return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function() end,

    opts = function(_, opts)
      require("plugins.conf.lspConf").lspKes()

      opts = vim.tbl_deep_extend("force", opts, {
        servers = require("plugins.conf.lspConf").servers,
      })

      return opts
    end,
  },
}
