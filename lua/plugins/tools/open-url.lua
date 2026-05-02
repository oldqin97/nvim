-- URL 打开插件：光标移到 URL 上时快速在浏览器中打开
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
        all_urls = { enabled = false, underline = false },
        cursor_move = { enabled = false, underline = false },
      },
    })
  end,
}
