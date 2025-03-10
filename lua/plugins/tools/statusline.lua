---@diagnostic disable: undefined-field, deprecated

return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    lazy = true,
    event = "BufWinEnter", -- 在打开文件缓冲区时加载 lualine
    opts = {
      options = {
        -- theme = "onedark",
        globalstatus = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = "" },
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "toggleterm",
          "alpha",
          "lazy",
          "packer",
          "NvimTree",
          "sagaoutline",
          "TelescopePrompt",
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = {},
        lualine_x = {
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            -- color = Util.ui.fg("Debug"),
          },
          -- {
          --   "o:encoding",
          --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
          --   cond = conditions.hide_in_width,
          --   color = { fg = colors.green, gui = "bold" },
          -- },

          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          "filesize",
        },
      },
    },
  },

  {
    "b0o/incline.nvim",
    event = "BufReadPost",
    init = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        hide = {
          cursorline = true,
          focused_win = false,
          only_win = false,
        },
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#44406e",
          }
        end,
      })
    end,
  },
}
