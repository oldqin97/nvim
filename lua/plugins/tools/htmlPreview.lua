return {
  "ray-x/web-tools.nvim",
  event = "BufReadPost",
  keys = {
    {
      "<leader>hp",
      ft = "html",
      "<cmd>BrowserPreview -f --port 9229<CR>",
      desc = "BrowserPreview",
    },
    {
      "<leader>hs",
      ft = "html",
      "<cmd>BrowserStop<CR>",
      desc = "BrowserStop",
    },
  },
  config = function()
    require("web-tools").setup({
      keymaps = {
        rename = nil, -- by default use same setup of lspconfig
        repeat_rename = ".", -- . to repeat
      },
      hurl = {
        show_headers = false, -- do not show http headers
        floating = false,
        formatters = {
          json = { "jq" },
          html = { "prettier", "--parser", "html" },
        },
      },
    })
  end,
}
