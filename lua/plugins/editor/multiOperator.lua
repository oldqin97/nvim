-- 多光标编辑插件
return {
  -- "mg979/vim-visual-multi",
  -- event = "BufReadPost",
  -- init = function()
  --   vim.g.VM_theme = "purplegray"
  --   vim.g.VM_show_warnings = 0
  --   vim.g.VM_default_mappings = 0
  --   vim.g.VM_add_cursor_at_pos_no_mappings = 1
  -- end,

  {
    "yaocccc/visual-multi.nvim",
    event = "BufReadPost",
    config = function()
      require("visual-multi").setup({
        wrap = true,
        case_sensitive = true,
        mappings = {
          find_next = "<C-n>",
          select_all = false,
          select_left = "<C-Left>",
          select_right = "<C-Right>",
          add_cursor_up = "<C-Up>",
          add_cursor_down = "<C-Down>",
          add_cursor = "<C-x>",
          -- 不要映射 <C-w>：它是窗口命令前缀（<C-w>s / <C-w>v 等），
          -- 全局映射会让所有分屏和窗口操作失效。用 <C-n> 选中单词即可。
          add_cursor_word = false,
          skip_region = false,
          remove_region = "q",
          insert_paste = "<C-v>",
          undo = "u",
          redo = "<C-r>",
        },
      })
    end,
  },
}
