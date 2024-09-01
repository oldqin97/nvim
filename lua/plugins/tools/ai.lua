---@diagnostic disable: missing-fields
return {
  {
    "luozhiya/fittencode.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>ad", "<cmd>Fitten document_code<CR>", desc = "Fitten document code", mode = { "v" } },
      { "<leader>ae", "<cmd>Fitten edit_code<CR>", desc = "Fitten edit code", mode = { "v" } },
      { "<leader>at", "<cmd>Fitten generate_unit_test<CR>", desc = "Fitten generate unit test", mode = { "v" } },
      { "<leader>ao", "<cmd>Fitten optimize_code<CR>", desc = "Fitten optimize code", mode = { "v" } },
      { "<leader>af", "<cmd>Fitten find_bugs<CR>", desc = "Fitten find bugs", mode = { "v" } },
      { "<leader>sa", "<cmd>Fitten show_chat<CR>", desc = "Fitten show chat" },
    },
    config = function()
      require("fittencode").setup({
        -- completion_mode = "source",
        chat = {
          style = "floating",
          floating = {
            border = "rounded",
            size = { width = 0.8, height = 0.8 },
          },
        },
        use_default_keymaps = true,
        keymaps = {
          inline = {
            ["<Right>"] = "accept_all_suggestions",
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
}
