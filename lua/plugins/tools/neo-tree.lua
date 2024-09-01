return {
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
}
