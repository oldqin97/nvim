-- HTML 文件浏览器实时预览
return {
  "ray-x/web-tools.nvim",
  cmd = { "BrowserPreview" },
  keys = {
    { "<leader>hp", ft = "html", "<cmd>BrowserPreview -f --port 9229<CR>", desc = "BrowserPreview" },
    { "<leader>hs", ft = "html", "<cmd>BrowserStop<CR>", desc = "BrowserStop" },
  },
  config = function()
    require("web-tools").setup({
      keymaps = {
        rename = nil,
        repeat_rename = ".",
      },
      hurl = {
        show_headers = false,
        floating = false,
        formatters = {
          json = { "jq" },
          html = { "prettier", "--parser", "html" },
        },
      },
    })
  end,
}
