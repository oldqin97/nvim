return {
  "Pocco81/auto-save.nvim",
  event = "BufReadPost",
  config = function()
    require("auto-save").setup()
  end,
}
