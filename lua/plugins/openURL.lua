return {
  "sontungexpt/url-open",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  keys = {
    { "<leader>o", "<cmd>URLOpenUnderCursor<cr>", desc = "Open url" },
  },
  config = function()
    local status_ok, url_open = pcall(require, "url-open")
    if not status_ok then
      return
    end
    url_open.setup({
      highlight_url = {
        all_urls = {
          enabled = false,
          fg = "#21d5ff",
          -- fg = "text",
          bg = "#ffffff",
          underline = false,
        },
        cursor_move = {
          enabled = true,
          fg = "#199eff",
          -- fg = "text",
          bg = "#ffffff",
          -- bg = nil,
          underline = false,
        },
      },
    })
  end,
}
