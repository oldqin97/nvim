return {
  {
    "Goose97/timber.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("timber").setup({
        keymaps = {
          insert_log_below = "<leader>pb",
        },
        default_keymaps_enabled = false,
        log_templates = {
          default = {
            vue = [[console.log("%log_target", %log_target)]],
            javascript = [[console.log("%log_target", %log_target);]],
            typescript = [[console.log("%log_target", %log_target);]],
            jsx = [[console.log("%log_target", %log_target);]],
            tsx = [[console.log("%log_target", %log_target);]],
            lua = [[print("%log_target", %log_target)]],
            ruby = [[puts("%log_target #{%log_target}")]],
            elixir = [[IO.inspect(%log_target, label: "%log_target")]],
            go = [[log.Printf("%log_target: %v\n", %log_target)]],
            rust = [[println!("%log_target: {:#?}", %log_target);]],
            python = [[print(f"{%log_target=}")]],
            c = [[printf("%log_target: %s\n", %log_target);]],
            cpp = [[std::cout << "%log_target: " << %log_target << std::endl;]],
            java = [[System.out.println("%log_target: " + %log_target);]],
            c_sharp = [[Console.WriteLine($"%log_target: {%log_target}");]],
            odin = [[fmt.printfln("%log_target: %v", %log_target)]],
            swift = [[print("%log_target:", %log_target)]],
            kotlin = [[println("%log_target: ${%log_target}")]],
          },
          plain = {
            vue = [[console.log("%insert_cursor")]],
            javascript = [[console.log("%insert_cursor")]],
            typescript = [[console.log("%insert_cursor")]],
            jsx = [[console.log("%insert_cursor")]],
            tsx = [[console.log("%insert_cursor")]],
            lua = [[print("%insert_cursor")]],
            ruby = [[puts("%insert_cursor")]],
            elixir = [[IO.puts(%insert_cursor)]],
            go = [[log.Printf("%insert_cursor")]],
            rust = [[println!("%insert_cursor");]],
            python = [[print(f"%insert_cursor")]],
            c = [[printf("%insert_cursor \n");]],
            cpp = [[std::cout << "%insert_cursor" << std::endl;]],
            java = [[System.out.println("%insert_cursor");]],
            c_sharp = [[Console.WriteLine("%insert_cursor");]],
            odin = [[fmt.println("%insert_cursor")]],
            swift = [[print("%insert_cursor")]],
            kotlin = [[println("%insert_cursor")]],
          },
        },
      })
    end,
  },
}

-- return {
--   -- print
--   "rareitems/printer.nvim",
--   event = "BufReadPost",
--   config = function()
--     require("printer").setup({
--       keymap = "<leader>pb", -- Plugin doesn't have any keymaps by default
--       behavior = "insert_below", -- how operator should behave
--
--       formatters = {
--         lua = function(inside, variable)
--           return string.format('print("%s: " .. %s)', inside, variable)
--         end,
--       },
--       add_to_inside = function(text)
--         return string.format("[%s:%s] %s", vim.fn.expand("%"), vim.fn.line("."), text)
--       end,
--     })
--
--     vim.keymap.set("n", "<leader>pb", "<Plug>(printer_below)iw")
--     vim.keymap.set("v", "<leader>pb", "<Plug>(printer_below)iw")
--   end,
-- }

-- return {
--   "andrewferrier/debugprint.nvim",
--   opts = {
--
--     keymaps = {
--       normal = {
--         plain_below = "<leader>pb",
--         plain_above = "g?P",
--         variable_below = "g?v",
--         variable_above = "g?V",
--         variable_below_alwaysprompt = "",
--         variable_above_alwaysprompt = "",
--         textobj_below = "g?o",
--         textobj_above = "g?O",
--         toggle_comment_debug_prints = "",
--         delete_debug_prints = "",
--       },
--       insert = {
--         plain = "<C-G>p",
--         variable = "<C-G>v",
--       },
--       visual = {
--         variable_below = "g?v",
--         variable_above = "g?V",
--       },
--     },
--     commands = {
--       toggle_comment_debug_prints = "ToggleCommentDebugPrints",
--       delete_debug_prints = "DeleteDebugPrints",
--       reset_debug_prints_counter = "ResetDebugPrintsCounter",
--     },
--     -- … Other options
--   },
-- }
