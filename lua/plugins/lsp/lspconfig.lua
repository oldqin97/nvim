return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function() end,

    opts = function(_, opts)
      require("plugins.conf.lspConf").lspKes()
      -- vim.deprecate("volar", "vue_ls", "3.0.1", "lspconfig", false)
      opts = vim.tbl_deep_extend("force", opts, {
        servers = require("plugins.conf.lspConf").servers,
      })

      return opts
    end,
  },
  -- { "mason-org/mason.nvim", version = "^1.0.0" },
  -- { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
