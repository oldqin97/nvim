-- Markdown 增强：列表符号自动补全 + 实时预览 + 所见即所得

-- 根据窗口宽度自动开关 render-markdown：窗口不够宽（内容需要横向滚动）时关闭渲染，够宽时开启
local render_md_timer = nil
vim.api.nvim_create_autocmd({ "WinResized", "VimResized", "BufWinEnter" }, {
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      return
    end
    if render_md_timer then
      pcall(render_md_timer.close, render_md_timer)
      render_md_timer = nil
    end
    render_md_timer = vim.defer_fn(function()
      local ok, api = pcall(require, "render-markdown.api")
      if not ok then
        return
      end
      local buf = vim.api.nvim_get_current_buf()
      local max_len = 0
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      for _, line in ipairs(lines) do
        local len = vim.fn.strdisplaywidth(line)
        if len > max_len then
          max_len = len
        end
      end
      local win_width = vim.api.nvim_win_get_width(0)
      if max_len > win_width then
        api.buf_disable()
      else
        api.buf_enable()
      end
    end, 300)
  end,
})

return {
  -- Markdown 列表符号自动续行
  {
    "dkarter/bullets.vim",
    ft = { "markdown", "text" },
  },
  -- Markdown 所见即所得渲染
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      file_types = { "markdown" },
      render_modes = { "n", "c", "v" },
      anti_conceal = { enabled = false },
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        sign = true,
        width = "block",
        right_pad = 1,
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = " 󰄱 " },
        checked = { icon = " 󰱒 " },
      },
      link = {
        enabled = true,
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
      pipe_table = {
        enabled = true,
      },
    },
  },
  -- Markdown 实时预览
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.cmd([[do FileType]])
      vim.cmd([[let g:mkdp_auto_close = 0]])
    end,
    keys = {
      { "<leader>mp", ft = "markdown", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
      { "<leader>ms", ft = "markdown", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Preview" },
    },
  },
}
