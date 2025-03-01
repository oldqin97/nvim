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
      require("bufferline").setup({
        highlights = {
          numbers_selected = {
            fg = "#89b4fa",
            bg = "#45475a",
          },
          buffer_selected = {
            fg = "#89b4fa",
            bg = "#45475a",
            bold = true,
          },
          duplicate_selected = {
            fg = "#89b4fa",
            bg = "#45475a",
            italic = true,
          },
          close_button_selected = {
            fg = "#f9ecdf",
            bg = "#45475a",
          },
          modified_selected = {
            fg = "#f9ecdf",
            bg = "#45475a",
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
          color_icons = true,
          modified_icon = "",

          left_trunc_marker = " ",
          right_trunc_marker = " ",
          show_close_icon = false,
          close_icon = " ",

          show_buffer_close_icons = true,
          buffer_close_icon = "󰅙",
          -- buffer_close_icon = " ",

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
        },
      })
    end,
  },
}
