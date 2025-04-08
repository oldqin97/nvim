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
        require("incline").setup({
          render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
            if filename == "" then
              filename = "[No Name]"
            end
            local ft_icon, ft_color = devicons.get_icon_color(filename)

            local function get_git_diff()
              local icons = { removed = " ", changed = " ", added = " " }
              local signs = vim.b[props.buf].gitsigns_status_dict
              local labels = {}
              if signs == nil then
                return labels
              end
              for name, icon in pairs(icons) do
                if tonumber(signs[name]) and signs[name] > 0 then
                  table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
                end
              end
              if #labels > 0 then
                table.insert(labels, { " " })
              end
              return labels
            end

            local function get_diagnostic_label()
              local icons = { error = " ", warn = " ", info = " ", hint = " " }
              local label = {}

              for severity, icon in pairs(icons) do
                local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                if n > 0 then
                  table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
                end
              end
              if #label > 0 then
                table.insert(label, { " " })
              end
              return label
            end

            return {
              { get_diagnostic_label() },
              { get_git_diff() },
              { (ft_icon or " ") .. " ", guifg = ft_color, guibg = "none" },
              {
                ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
                " ",
                { filename, gui = modified and "bold,italic" or "bold" },
                " ",
                guibg = "#55506e",
              },
              -- { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
            }
          end,
        }),
        -- render = function(props)
        --   local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        --   if filename == "" then
        --     filename = "[No Name]"
        --   end
        --   local ft_icon, ft_color = devicons.get_icon_color(filename)
        --   local modified = vim.bo[props.buf].modified
        -- return {
        --   ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
        --   " ",
        --   { filename, gui = modified and "bold,italic" or "bold" },
        --   " ",
        --   guibg = "#44406e",
        -- }
        -- end,
      })
    end,
  },
}
