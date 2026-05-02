---@diagnostic disable: undefined-field

-- Snacks.nvim 核心插件配置（picker, scope, indent, dashboard, bigfile, terminal 等）
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = require("plugins.conf.snacksConf").keys,
  opts = {
    picker = require("plugins.conf.snacksConf").picker,
    scope = require("plugins.conf.snacksConf").scope,
    indent = require("plugins.conf.snacksConf").indent,
    dashboard = require("plugins.conf.snacksConf").dashboard,
    bigfile = require("plugins.conf.snacksConf").bigfile,
    -- 浮动终端
    terminal = {
      win = {
        position = "float",
        height = math.floor(vim.o.lines * 0.7),
      },
    },
    -- 输入框按键映射
    input = {
      keys = {
        n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
        i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
        i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
        i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
        i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
        i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
        i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
        q = "cancel",
      },
    },
    scroll = { enabled = false },
    image = { enabled = true, doc = { enabled = false } },
    animate = { enabled = true, duration = { step = 10, duration = 100 } },
    notifier = { enabled = true, timeout = 2000 },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  -- 初始化：注册调试工具、toggle 开关快捷键
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- 注册全局调试函数
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd -- 覆盖 vim.print 使用 snacks 的 inspect

        -- 各种 Toggle 开关映射
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>ut")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end,
    })
  end,
}
