return {
  "HakonHarnes/img-clip.nvim",
  event = "BufReadPost",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}
