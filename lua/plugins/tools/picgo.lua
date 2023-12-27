return {
  "askfiy/nvim-picgo",
  cmd = { "UploadClipboard" },
  keys = {
    { "<leader>u", "<cmd>UploadClipboard<cr>", desc = "upload image to upstream" },
  },
  config = function()
    require("nvim-picgo").setup()
  end,
}
