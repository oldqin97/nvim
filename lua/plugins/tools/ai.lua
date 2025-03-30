---@diagnostic disable: missing-fields

return {
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({
  --       keymaps = {
  --         accept_suggestion = "<C-l>", -- handled by nvim-cmp / blink.cmp
  --         clear_suggestion = "<C-j>",
  --       },
  --       ignore_filetypes = {
  --         "bigfile",
  --         "snacks_input",
  --         "snacks_notif",
  --         "AvanteInput",
  --         "snacks_picker_list",
  --         "dapui_watches",
  --       },
  --       color = {
  --         suggestion_color = "#999999",
  --         cterm = 244,
  --       },
  --       log_level = "info",
  --       disable_inline_completion = true,
  --       disable_keymaps = false,
  --       condition = function()
  --         return false
  --       end,
  --     })
  --   end,
  -- },

  {
    "luozhiya/fittencode.nvim",
    -- event = "VeryLazy",
    event = { "InsertEnter", "CmdlineEnter" },
    keys = {
      { "<leader>ad", "<cmd>Fitten document_code<CR>", desc = "Fitten document code", mode = { "v" } },
      -- { "<leader>ae", "<cmd>Fitten edit_code<CR>", desc = "Fitten edit code", mode = { "v" } },
      { "<leader>tt", "<cmd>Fitten generate_unit_test<CR>", desc = "Fitten generate unit test", mode = { "v" } },
      { "<leader>ao", "<cmd>Fitten optimize_code<CR>", desc = "Fitten optimize code", mode = { "v" } },
      { "<leader>af", "<cmd>Fitten find_bugs<CR>", desc = "Fitten find bugs", mode = { "v" } },
      -- { "<leader>sa", "<cmd>Fitten show_chat<CR>", desc = "Fitten show chat" },
    },
    config = function()
      require("fittencode").setup({
        chat = {
          style = "floating",
          floating = {
            border = "rounded",
            size = { width = 0.8, height = 0.8 },
          },
        },
        use_default_keymaps = false,
        disable_specific_inline_completion = {
          -- :lua print(vim.bo.filetype)
          suffixes = {
            "TelescopePrompt",
            "neo-tree-popup",
            "AvanteInput",
            "snacks_picker_input",
            "snacks_input",
            "bigfile",
            "snacks_input",
            "snacks_notif",
            "AvanteInput",
            "snacks_picker_list",
            "dapui_watches",
          },
        },
        keymaps = {
          inline = {
            ["<A-d>"] = "accept_all_suggestions",
            -- ["<Tab>"] = "accept_all_suggestions",
            ["<C-Down>"] = "accept_line",
            ["<C-Right>"] = "accept_word",
            ["<C-Up>"] = "revoke_line",
            ["<C-Left>"] = "revoke_word",
            ["<A-\\>"] = "triggering_completion",
          },
          chat = {
            ["q"] = "close",
            ["[c"] = "goto_previous_conversation",
            ["]c"] = "goto_next_conversation",
            ["c"] = "copy_conversation",
            ["C"] = "copy_all_conversations",
            ["d"] = "delete_conversation",
            ["D"] = "delete_all_conversations",
          },
        },
      })
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    -- version = "v0.0.19",
    dependencies = require("plugins.conf.avanteConf").dependencies,
    keys = require("plugins.conf.avanteConf").keys,
    opts = require("plugins.conf.avanteConf").opts,
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
  },
}
