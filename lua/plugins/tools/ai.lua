---@diagnostic disable: missing-fields

return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
        clear_suggestion = "<C-j>",
      },
      ignore_filetypes = {
        "bigfile",
        "snacks_input",
        "snacks_notif",
        "AvanteInput",
      },
    },
  },
  -- {
  --   "luozhiya/fittencode.nvim",
  --   -- event = "VeryLazy",
  --   event = { "InsertEnter", "CmdlineEnter" },
  --   keys = {
  --     { "<leader>ad", "<cmd>Fitten document_code<CR>", desc = "Fitten document code", mode = { "v" } },
  --     -- { "<leader>ae", "<cmd>Fitten edit_code<CR>", desc = "Fitten edit code", mode = { "v" } },
  --     { "<leader>tt", "<cmd>Fitten generate_unit_test<CR>", desc = "Fitten generate unit test", mode = { "v" } },
  --     { "<leader>ao", "<cmd>Fitten optimize_code<CR>", desc = "Fitten optimize code", mode = { "v" } },
  --     { "<leader>af", "<cmd>Fitten find_bugs<CR>", desc = "Fitten find bugs", mode = { "v" } },
  --     -- { "<leader>sa", "<cmd>Fitten show_chat<CR>", desc = "Fitten show chat" },
  --   },
  --   config = function()
  --     require("fittencode").setup({
  --       -- completion_mode = "source",
  --       chat = {
  --         style = "floating",
  --         floating = {
  --           border = "rounded",
  --           size = { width = 0.8, height = 0.8 },
  --         },
  --       },
  --       use_default_keymaps = false,
  --       disable_specific_inline_completion = {
  --         -- :lua print(vim.bo.filetype)
  --         suffixes = {
  --           "TelescopePrompt",
  --           "neo-tree-popup",
  --           "AvanteInput",
  --           "snacks_picker_input",
  --           "snacks_input",
  --         },
  --       },
  --
  --       keymaps = {
  --         inline = {
  --           -- ["<A-d>"] = "accept_all_suggestions",
  --           ["<S-Tab>"] = "accept_all_suggestions",
  --           ["<C-Down>"] = "accept_line",
  --           ["<C-Right>"] = "accept_word",
  --           ["<C-Up>"] = "revoke_line",
  --           ["<C-Left>"] = "revoke_word",
  --           ["<A-\\>"] = "triggering_completion",
  --         },
  --         chat = {
  --           ["q"] = "close",
  --           ["[c"] = "goto_previous_conversation",
  --           ["]c"] = "goto_next_conversation",
  --           ["c"] = "copy_conversation",
  --           ["C"] = "copy_all_conversations",
  --           ["d"] = "delete_conversation",
  --           ["D"] = "delete_all_conversations",
  --         },
  --       },
  --     })
  --   end,
  -- },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    -- version = "v0.0.19",
    keys = function(_, keys)
      local opts =
        require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)

      local mappings = {
        {
          opts.mappings.ask,
          function()
            -- AvanteInput
            -- vim.cmd(bo.filetype)
            if vim.bo.filetype == "AvanteInput" then
              vim.cmd("AvanteToggle")
              vim.schedule(function()
                vim.api.nvim_feedkeys("\27", "n", false)
              end)
              -- ai_open = false
            else
              vim.cmd("AvanteToggle")
              -- ai_open = true
            end
          end,
          desc = "avante: toggle",
          mode = { "n", "v", "i" },
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
      windows = {
        position = "left",
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
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
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
  },
}
