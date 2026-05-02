-- 保存光标位置：切换 buffer 时记住每个文件的光标位置
return {
  "gbprod/stay-in-place.nvim",
  event = "BufReadPost",
  opts = {},
}
