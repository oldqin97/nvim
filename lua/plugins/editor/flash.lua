return {
  "folke/flash.nvim",
  event = "BufReadPost",
  vscode = true,
  opts = {},
  keys = {
    { "S", mode = { "n", "o", "x" }, false, desc = "Flash Treesitter" },
    { "r", mode = "o", false, desc = "Remote Flash" },
    { "s", mode = { "n", "x", "o" }, false },
    {
      "R",
      mode = { "o", "x" },
      false,
      desc = "Treesitter Search",
    },
  },
}
