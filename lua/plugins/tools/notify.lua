return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      render = "minimal",
      stages = "fade_in_slide_out",
      timeout = 100,
      top_down = false,
      max_height = function()
        return math.floor(vim.o.lines * 0.55)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.55)
      end,
    })
  end,
}
