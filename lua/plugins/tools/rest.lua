return {
  -- {
  --   "vhyrro/luarocks.nvim",
  --   opts = {
  --     rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
  --   },
  -- },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   keys = {
  --     { "<F1>", "<cmd>Rest run<cr>", desc = "rest" },
  --   },
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup({})
  --   end,
  -- },

  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<F1>", "<cmd>lua require('kulala').run()<cr>", desc = "rest" },
    },
    opts = {
      default_view = "headers_body",
    },
    -- config = function()
    --   require("kulala").setup({
    --     formatters = {
    --       json = { "jq", "." },
    --       xml = { "xmllint", "--format", "-" },
    --       html = { "xmllint", "--format", "--html", "-" },
    --     },
    --   })
    -- end,
  },
}
