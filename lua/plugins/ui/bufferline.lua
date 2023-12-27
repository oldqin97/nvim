return {
  "akinsho/bufferline.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>bp", false },
    { "<leader>bP", false },
    { "<leader>br", false },
    { "<leader>bl", false },
    { "<S-h>",      false },
    { "<S-l>",      false },
    { "[b",         false },
    { "]b",         false },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    { "<A-9>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev buffer" },
    { "<A-0>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Next buffer" },
  },
  opts = {
    options = {
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("lazyvim.config").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  config = function()
    require("bufferline").setup({
      highlights = {
        numbers_selected = {
          fg = "#f9ecdf",
          bg = "#126bae",
        },
        buffer_selected = {
          fg = "#f9ecdf",
          bg = "#126bae",
          bold = true,
          italic = true,
        },
        duplicate_selected = {
          fg = "#f9ecdf",
          bg = "#126bae",
          italic = true,
        },
        close_button_selected = {
          fg = "#f9ecdf",
          bg = "#825855",
        },
        modified_selected = {
          fg = "#f9ecdf",
          bg = "#825855",
        },
      },

      options = {
        mode = "buffers",
        -- separator_style = { "|", "|" },
        separator_style = { "", "" },
        always_show_bufferline = true,
        view = "multiwindow",
        themable = true,
        show_buffer_icons = true,
        color_icons = false,
        modified_icon = " ●",
        left_trunc_marker = " ",
        right_trunc_marker = " ",
        show_close_icon = true,
        close_icon = " ",

        show_buffer_close_icons = true,
        -- buffer_close_icon = "󰅙",
        buffer_close_icon = " ",

        tab_size = 10,

        show_tab_indicators = false,
        enforce_regular_tabs = false,
        max_name_length = 25,
        indicator = {
          icon = "",
          style = "none",
        },

        numbers = function(opts)
          return string.format(" %s.", opts.ordinal)
        end,

        diagnostics = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,

        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    -- Buffers belong to tabs
    -- local cache = {}
    -- local last_tab = 0
    --
    -- local utils = {}
    --
    -- utils.is_valid = function(buf_num)
    --   if not buf_num or buf_num < 1 then
    --     return false
    --   end
    --   local exists = vim.api.nvim_buf_is_valid(buf_num)
    --   return vim.bo[buf_num].buflisted and exists
    -- end
    --
    -- utils.get_valid_buffers = function()
    --   local buf_nums = vim.api.nvim_list_bufs()
    --   local ids = {}
    --   for _, buf in ipairs(buf_nums) do
    --     if utils.is_valid(buf) then
    --       ids[#ids + 1] = buf
    --     end
    --   end
    --   return ids
    -- end
    -- local autocmd = vim.api.nvim_create_autocmd
    --
    -- autocmd("TabEnter", {
    --   callback = function()
    --     local tab = vim.api.nvim_get_current_tabpage()
    --     local buf_nums = cache[tab]
    --     if buf_nums then
    --       for _, k in pairs(buf_nums) do
    --         vim.api.nvim_buf_set_option(k, "buflisted", true)
    --       end
    --     end
    --   end,
    -- })
    -- autocmd("TabLeave", {
    --   callback = function()
    --     local tab = vim.api.nvim_get_current_tabpage()
    --     local buf_nums = utils.get_valid_buffers()
    --     cache[tab] = buf_nums
    --     for _, k in pairs(buf_nums) do
    --       vim.api.nvim_buf_set_option(k, "buflisted", false)
    --     end
    --     last_tab = tab
    --   end,
    -- })
    -- autocmd("TabClosed", {
    --   callback = function()
    --     cache[last_tab] = nil
    --   end,
    -- })
    -- autocmd("TabNewEntered", {
    --   callback = function()
    --     vim.api.nvim_buf_set_option(0, "buflisted", true)
    --   end,
    -- })
  end,
}
