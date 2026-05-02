-- Docker 管理界面（lazydocker TUI）
return {
  "crnvl96/lazydocker.nvim",
  cmd = { "LazyDocker" },
  opts = {},
  keys = {
    { "<leader>dk", "<Cmd>lua require('lazydocker').toggle({ engine = 'docker' })<CR>", desc = "lazy docker" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
