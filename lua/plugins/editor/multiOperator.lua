-- 多光标编辑插件
return {
  "mg979/vim-visual-multi",
  event = "BufReadPost",
  init = function()
    vim.g.VM_theme = "purplegray"
    vim.g.VM_show_warnings = 0
    vim.g.VM_default_mappings = 0
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
}
