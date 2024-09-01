return {
  "crnvl96/lazydocker.nvim",
  -- event = "VeryLazy",
  cmd = { "LazyDocker" },
  opts = {}, -- automatically calls `require("lazydocker").setup()`
  keys = {
    { "<leader>dk", "<cmd>LazyDocker<cr>", desc = "lazy docker" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
