return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
          tailwind = true,
          sass = { enable = false, parsers = { "css" } },
          virtualtext = "■",
          always_update = true,
        },
      })
    end,
  },

  {
    "mei28/blink-bang-word-light.nvim",
    event = "VeryLazy",
    config = function()
      require("blink-bang-word-light").setup({
        max_word_length = 100, -- if cursorword length > max_word_length then not highlight
        min_word_length = 2, -- if cursorword length < min_word_length then not highlight
        excluded = {
          filetypes = {
            "TelescopePrompt",
          },
          buftypes = {
            -- "nofile",
            -- "terminal",
          },
          patterns = { -- the pattern to match with the file path
            -- "%.png$",
            -- "%.jpg$",
            -- "%.jpeg$",
            -- "%.pdf$",
            -- "%.zip$",
            -- "%.tar$",
            -- "%.tar%.gz$",
            -- "%.tar%.xz$",
            -- "%.tar%.bz2$",
            -- "%.rar$",
            -- "%.7z$",
            -- "%.mp3$",
            -- "%.mp4$",
          },
        },
        highlight = {
          underline = false,
          guifg = "#EED8DA", -- Foreground color
          guibg = "#B5585F", -- Background color
        },
        enabled = true,
      })
    end,
  },
}
