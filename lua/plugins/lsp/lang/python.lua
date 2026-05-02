-- Python 虚拟环境选择器
return {
  "linux-cultist/venv-selector.nvim",
  branch = "main",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = "python",
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" },
  },
  opts = {
    search = {},
    options = { picker = "snacks" },
  },
}
