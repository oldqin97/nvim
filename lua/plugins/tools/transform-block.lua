return {
  "Wansmer/treesj",
  event = "BufReadPost",
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
  keys = {
    { "<A-m>", "<cmd>TSJToggle<CR>", desc = "Ts toggle" },
  },
}
