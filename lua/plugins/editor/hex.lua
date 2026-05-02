-- 十六进制颜色预览和编辑
return {
  "RaafatTurki/hex.nvim",
  cmd = "HexToggle",
  config = function()
    require("hex").setup({})
  end,
}
