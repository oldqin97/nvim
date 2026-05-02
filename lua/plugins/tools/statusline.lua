---@diagnostic disable: undefined-field, deprecated

-- 状态栏配置（lualine）
return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    lazy = false,
    opts = {
      options = {
        globalstatus = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = "" },
        disabled_filetypes = {
          "dashboard", "lspinfo", "mason", "startuptime",
          "checkhealth", "help", "toggleterm", "alpha",
          "lazy", "packer", "NvimTree", "sagaoutline", "TelescopePrompt",
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { "searchcount" },
        lualine_x = {
          -- noice 命令状态
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- DAP 调试状态
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          },
          -- Git 差异状态
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
              end
            end,
          },
        },
        lualine_y = { { "location", padding = { left = 0, right = 1 } } },
        lualine_z = { "filesize" },
      },
    },
  },
}
