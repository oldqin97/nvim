return {
  "jdrupal-dev/css-vars.nvim",
  event = "BufReadPost",
  config = function()
    require("css-vars").setup()
  end,
}
