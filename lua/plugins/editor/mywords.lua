return {
  "dwrdx/mywords.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>m", "<cmd>lua require'mywords'.hl_toggle()<cr>", desc = "highlight word" },
    { "<leader>cs>", false },
  },
}
