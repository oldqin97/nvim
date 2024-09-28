return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<A-w>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root.get() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        false,
      },
      { "<leader>e", false },
      { "<leader>E", false },
    },

    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".DS_Store",
          },
        },
      },

      popup_border_style = "rounded",
      window = {
        position = "right",
        mappings = {
          ["<space>"] = "none",
          ["<Tab>"] = "open",
          -- ["<cr>"] = "none",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["oc"] = "none",
          ["od"] = "none",
          ["og"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
          ["o"] = "open",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },

  -- {
  --   "mikavilpas/yazi.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     -- 👇 in this section, choose your own keymappings!
  --     {
  --       "<A-w>-",
  --       "<cmd>Yazi<cr>",
  --       desc = "Open yazi at the current file",
  --     },
  --     {
  --       -- Open in the current working directory
  --       "<leader>cw",
  --       "<cmd>Yazi cwd<cr>",
  --       desc = "Open the file manager in nvim's working directory",
  --     },
  --     {
  --       -- NOTE: this requires a version of yazi that includes
  --       -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
  --       "<c-up>",
  --       "<cmd>Yazi toggle<cr>",
  --       desc = "Resume the last yazi session",
  --     },
  --   },
  --   ---@type YaziConfig
  --   opts = {
  --     -- if you want to open yazi instead of netrw, see below for more info
  --     open_for_directories = false,
  --     keymaps = {
  --       show_help = "<f1>",
  --     },
  --   },
  -- },
}
