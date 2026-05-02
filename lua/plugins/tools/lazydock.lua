-- Docker 管理界面（lazydocker TUI）
return {
  "crnvl96/lazydocker.nvim",
  cmd = { "LazyDocker" },
  opts = {},
  keys = {
    { "<leader>dk", "<cmd>LazyDocker<cr>", desc = "lazy docker" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
