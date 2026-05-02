-- Buffer 标签栏：显示和管理打开的 buffer
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", false },
      { "<leader>bP", false },
      { "<leader>br", false },
      { "<leader>bl", false },
      { "<S-h>", false },
      { "<S-l>", false },
      { "[b", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]b", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
      { "<A-9>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<A-0>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },

    config = function()
      local bg = "#665c54"

      require("bufferline").setup({
        highlights = {
          buffer_selected = { fg = "#ebdbb2", bg = bg, bold = true, italic = false },
          numbers_selected = { fg = "#fe8019", bg = bg },
          duplicate_selected = { fg = "#8ec07c", bg = bg, italic = false },
          close_button_selected = { fg = "#fb4934", bg = bg },
          modified_selected = { fg = "#fabd2f", bg = bg },
        },

        options = {
          mode = "buffers",
          sort_by = "insert_after_current",
          always_show_bufferline = true,
          view = "multiwindow",
          themable = true,
          separator_style = { "", "" },
          show_buffer_icons = true,
          color_icons = true,
          modified_icon = "",
          show_close_icon = false,
          show_buffer_close_icons = true,
          buffer_close_icon = "󰅙",
          tab_size = 10,
          show_tab_indicators = false,
          enforce_regular_tabs = false,
          max_name_length = 25,
          left_trunc_marker = " ",
          right_trunc_marker = " ",
          indicator = { icon = "", style = "none" },
          numbers = function(opts)
            return string.format(" %s.", opts.ordinal)
          end,
        },
      })
    end,
  },
}
