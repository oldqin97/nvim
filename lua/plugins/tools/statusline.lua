---@diagnostic disable: undefined-field, deprecated

return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    lazy = false,
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
        lualine_c = {
          "searchcount",
          -- "lsp_status",
        },
        lualine_x = {

          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Statement") }
            end,
          },

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
}
