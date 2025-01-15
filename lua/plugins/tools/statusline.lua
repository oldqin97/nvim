---@diagnostic disable: undefined-field, deprecated

local Util = require("lazyvim.util")

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}
return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    lazy = true,
    event = "BufWinEnter", -- 在打开文件缓冲区时加载 lualine
    dependencies = {
      "pnx/lualine-lsp-status",
    },
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
          "lsp-status",

          -- lualine: There are some issues with your config. Run :LualineNotices for details
          -- "filename",
          -- Lsp server name .
          -- {
          --   function()
          --     local msg = "No Active Lsp"
          --     local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          --     local clients = vim.lsp.get_active_clients()
          --     if next(clients) == nil then
          --       return msg
          --     end
          --     for _, client in ipairs(clients) do
          --       local filetypes = client.config.filetypes
          --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          --         return client.name
          --       end
          --     end
          --     return msg
          --   end,
          --   icon = " LSP:",
          --   color = { fg = colors.fg, gui = "bold" },
          -- },
        },
        lualine_x = {
          -- {
          --   function()
          --     return require("noice").api.status.mode.get()
          --   end,
          --   cond = function()
          --     return package.loaded["noice"] and require("noice").api.status.mode.has()
          --   end,
          --   color = Util.ui.fg("Constant"),
          -- },

          {
            function()
              return require("lazydo").get_lualine_stats()
            end,
            cond = function()
              return require("lazydo")._initialized
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
          --   require("lazy.status").updates,
          --   cond = require("lazy.status").has_updates,
          --   color = Util.ui.fg("Special"),
          -- },
          {
            "o:encoding",
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.green, gui = "bold" },
          },
          -- {
          --   "fileformat",
          --   fmt = string.upper,
          --   icons_enabled = false,
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
