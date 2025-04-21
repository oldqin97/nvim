return {
  -- { -- split window
  --   "nvim-zh/colorful-winsep.nvim",
  --   lazy = true,
  --   event = "WinNew",
  --   config = function()
  --     require("colorful-winsep").setup({
  --
  --       no_exec_files = {
  --         "packer",
  --         "TelescopePrompt",
  --         "mason",
  --         "CompetiTest",
  --         "NvimTree",
  --         "snacks_picker_list",
  --         "snacks_picker_list",
  --         "snacks_terminal",
  --         "snacks_terminal",
  --         "Outline",
  --         "AvanteSelectedFiles",
  --         "AvanteInput",
  --         "Avante",
  --         "dapui_console",
  --         "dapui_watches",
  --         "dapui_stacks",
  --         "dapui_breakpoints",
  --         "dapui_scopes",
  --         "OverseerList",
  --         "DiffviewFiles",
  --         "qf",
  --       },
  --     })
  --   end,
  -- },

  {
    "nvim-focus/focus.nvim",
    event = "VeryLazy",
    -- lazy = true,
    version = "*",
    config = function()
      local ignore_filetypes = {
        "snacks_picker_list",
        "snacks_terminal",
        "snacks_terminal",
        "Outline",
        "AvanteSelectedFiles",
        "AvanteInput",
        "Avante",
        "dapui_console",
        "dapui_watches",
        "dapui_stacks",
        "dapui_breakpoints",
        "dapui_scopes",
        "OverseerList",
        "DiffviewFiles",
        "qf",
      }
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
          else
            vim.b.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for FileType",
      })
      require("focus").setup({
        enable = true, -- Enable module
        commands = true, -- Create Focus commands
        autoresize = {
          enable = true, -- Enable or disable auto-resizing of splits
          width = 0, -- Force width for the focused window
          height = 0, -- Force height for the focused window
          minwidth = 0, -- Force minimum width for the unfocused window
          minheight = 0, -- Force minimum height for the unfocused window
          height_quickfix = 10, -- Set the height of quickfix panel
        },
        split = {
          bufnew = false, -- Create blank buffer for new split windows
          tmux = false, -- Create tmux splits instead of neovim splits
        },
        ui = {
          number = false, -- Display line numbers in the focussed window only
          relativenumber = false, -- Display relative line numbers in the focussed window only
          hybridnumber = false, -- Display hybrid line numbers in the focussed window only
          absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

          cursorline = false, -- Display a cursorline in the focussed window only
          cursorcolumn = false, -- Display cursorcolumn in the focussed window only
          colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = "+1", -- Set the comma-saperated list for the colorcolumn
          },
          signcolumn = false, -- Display signcolumn in the focussed window only
          winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
        },
      })
    end,
  },
}
