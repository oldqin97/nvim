return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<F1>", "<cmd>lua require('kulala').run()<cr>", desc = "rest" },
    },
    opts = {
      -- default_view = "headers_body",
      default_view = "body",
      display_mode = "float",
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
