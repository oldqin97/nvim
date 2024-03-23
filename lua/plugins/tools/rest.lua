return {
  {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    keys = {
      { "<F1>", "<cmd>Rest run<cr>", desc = "rest" },
    },
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup({})
    end,
  },
}
