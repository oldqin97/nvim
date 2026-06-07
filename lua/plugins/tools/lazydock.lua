-- Docker 管理界面（lazydocker TUI）
return {
  "crnvl96/lazydocker.nvim",
  -- cmd = { "LazyDocker" },
  lazy = true,
  opts = {},
  keys = {
    {
      "<leader>dk",
      function()
        require("lazydocker").toggle({ engine = "docker" })
      end,
      desc = "toggle lazy docker",
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
