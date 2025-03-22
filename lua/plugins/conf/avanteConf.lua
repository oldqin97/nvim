return {
  opts = {
    provider = "openai",
    auto_suggestions_provider = "openai",
    hints = { enabled = false },
    openai = {
      endpoint = "https://api.deepseek.com/v1",
      model = "deepseek-chat",
      timeout = 30000,
      temperature = 0,
      max_tokens = 4096,
      api_key_name = "OPENAI_API_KEY",
    },
    behaviour = {
      enable_token_counting = false,
    },
    windows = {
      position = "left",

      ask = {},
    },
    mappings = {
      ask = "<c-t>",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      focus = "<leader>af",
      toggle = {
        -- default = "<c-t>",
        debug = "<leader>ad",
        hint = "<leader>ah",
        suggestion = "<leader>asqwe",
        repomap = "<leader>aR",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
        remove_file = "d",
        add_file = "@",
        close = { "<Esc>", "q" },
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "Avante" },
      },
      ft = { "Avante" },
    },
  },

  keys = function(_, keys)
    local opts =
      require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)

    local mappings = {
      {
        opts.mappings.ask,
        function()
          if vim.bo.filetype == "AvanteInput" then
            vim.cmd("AvanteToggle")
            vim.schedule(function()
              vim.api.nvim_feedkeys("\27", "n", false)
            end)
          else
            vim.cmd("AvanteToggle")
          end
        end,
        desc = "avante: toggle",
        mode = { "n", "i" },
      },
      {
        "<C-c>",
        "<cmd>AvanteClear<CR>",
        mode = { "n", "v" },
        desc = "clear avante history",
      },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
}
