return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
        transparent_bg = false, -- Set the background of the diagnostic to transparent
      })
      vim.diagnostic.config({ virtual_text = false, signs = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
  -- {
  --   "RaafatTurki/corn.nvim",
  --   event = "BufReadPost",
  --   config = function()
  --     -- vim.diagnostic.config({ virtual_text = false })
  --     require("corn").setup({
  --       auto_cmds = true,
  --       -- sort_method = "severity",
  --       sort_method = "line_number",
  --
  --       scope = "line",
  --
  --       -- sets the style of the border, must be one of `single`, `double`, `rounded`, `solid`, `shadow` or `none`
  --       border_style = "none",
  --
  --       -- sets which vim modes corn isn't allowed to render in, should contain strings like 'n', 'i', 'v', 'V' .. etc
  --       blacklisted_modes = {},
  --
  --       -- highlights to use for each diagnostic severity level
  --       highlights = {
  --         error = "DiagnosticFloatingError",
  --         warn = "DiagnosticFloatingWarn",
  --         info = "DiagnosticFloatingInfo",
  --         hint = "DiagnosticFloatingHint",
  --       },
  --
  --       -- icons to use for each diagnostic severity level
  --       icons = {
  --         error = "",
  --         warn = "",
  --         hint = "󰌵",
  --         info = "",
  --       },
  --
  --       -- a preprocessor function that takes a raw Corn.Item and returns it after modification, could be used for truncation or other purposes
  --       item_preprocess_func = function(item)
  --         -- the default truncation logic is here ...
  --         return item
  --       end,
  --
  --       -- a hook that executes each time corn is toggled. the current state is provided via `is_hidden`
  --       -- on_toggle = function(is_hidden)
  --       --   vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
  --       -- end,
  --     })
  --   end,
  -- },
}
