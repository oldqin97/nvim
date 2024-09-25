return {
  -- "junegunn/vim-easy-align",
  -- event = "BufReadPost",
  -- init = function()
  --   vim.cmd([[
  --  " Start interactive EasyAlign in visual mode (e.g. vipga)
  --  xmap ga <Plug>(EasyAlign)
  --  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  --  nmap ga <Plug>(EasyAlign)
  --   ]])
  -- end,
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = true,
    init = function()
      -- Create your mappings here
      require("mini.align").setup({})

      -- -- 可视模式下按 '=' 对齐
      -- vim.api.nvim_set_keymap(
      --   "v",
      --   "<Leader>a=",
      --   ":lua require('mini.align').align_to_char('=')<CR>",
      --   { noremap = true }
      -- )
      -- -- 可视模式下按 ':' 对齐
      -- vim.api.nvim_set_keymap(
      --   "v",
      --   "<Leader>a:",
      --   ":lua require('mini.align').align_to_string(':')<CR>",
      --   { noremap = true }
      -- )
    end,
  },
}
