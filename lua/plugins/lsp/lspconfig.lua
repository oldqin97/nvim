-- LSP 服务器配置入口：加载各语言服务器配置
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        servers = require("plugins.conf.lspConf").servers,
      })
      return opts
    end,
  },
}
