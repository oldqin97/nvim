-- Multi Cursor
return {
  "mg979/vim-visual-multi",
  event = "BufReadPost",
  init = function()
    vim.g.VM_theme = "purplegray"
    vim.g.VM_show_warnings = 0
    vim.g.VM_default_mappings = 0
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
    -- vim.g.VM_maps = {
    --   ["Start Regex Search"] = "<C-q>/",
    --   ["Visual All"] = "\\A",
    --
    --   ["Switch Mode"] = "v",
    --   ["Skip Region"] = "q",
    --   ["Remove Region"] = "Q",
    --   ["Goto Next"] = "}",
    --   ["Goto Prev"] = "{",
    --
    --   ["Duplicate"] = "<C-q>d",
    --
    --   ["Tools Menu"] = "\\t",
    --   ["Case Conversion Menu"] = "C",
    --   ["Align"] = "\\a",
    -- }
    -- vim.g.VM_set_statusline = 0
  end,
}
