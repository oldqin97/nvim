return {
  "rest-nvim/rest.nvim",
  -- lazy = true,
  ft = "http",
  config = function()
    require("rest-nvim").setup({})
  end,
}
