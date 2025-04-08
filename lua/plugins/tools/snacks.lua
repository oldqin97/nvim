---@diagnostic disable: undefined-field
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
    terminal = {
      win = {
        position = "float",
        height = math.floor(vim.o.lines * 0.7),
      },
    },
    input = {
      -- enabled = true,
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
    image = {
      enabled = true,
      doc = {
        enabled = false,
      },
    },
    animate = { enabled = true, duration = { step = 10, duration = 100 } },
    notifier = { enabled = true, timeout = 2000 },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        -- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>ut")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end,
    })
  end,
}
