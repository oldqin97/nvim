return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen" },
  keys = {
    { "<leader>go", "<cmd>DiffviewOpen<CR>", desc = "open diffview window" },
    { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "close diffview window" },
  },
}
