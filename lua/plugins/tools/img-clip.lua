-- 粘贴剪贴板图片并上传
return {
  "HakonHarnes/img-clip.nvim",
  cmd = { "PasteImage" },
  lazy = true,
  opts = {},
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}
