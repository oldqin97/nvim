-- PicGo 图床：上传剪贴板图片到图床
return {
  "askfiy/nvim-picgo",
  cmd = { "UploadClipboard" },
  keys = {
    { "<leader>u", "<cmd>UploadClipboard<cr>", desc = "upload image to upstream" },
  },
  config = function()
    require("nvim-picgo").setup({
      temporary_storage = false,
    })
  end,
}
