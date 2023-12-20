-- vim.cmd([[
--     let g:VM_show_warnings = 0
-- ]])
return { -- Multi Cursor
  "mg979/vim-visual-multi",
  event = "BufReadPost",
  init = function()
    -- vim.g.VM_leader = "\\"
    vim.g.VM_theme = "purplegray"

    vim.g.VM_show_warnings = 0
    vim.g.VM_maps = {

      -- ["Find Under"] = "<M-b>",
      -- ["Find Subword Under"] = "<C-b>", -- firstly select some text, then <M-b>

      -- ["Select Cursor Down"] = "<M-C-j>", -- switch upper and lower window with <C-w>jk
      -- ["Select Cursor Up"] = "<M-C-k>",

      ["Start Regex Search"] = "<C-q>/",
      ["Visual All"] = "\\A", --  1. selected some text in visual mode 2. press <C-q>j to select all

      -- buffer mappings
      ["Switch Mode"] = "v",
      ["Skip Region"] = "q",
      ["Remove Region"] = "Q",
      ["Goto Next"] = "}",
      ["Goto Prev"] = "{",

      ["Duplicate"] = "<C-q>d",

      ["Tools Menu"] = "\\t",
      ["Case Conversion Menu"] = "C",
      ["Align"] = "\\a",
    }

    -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
    vim.g.VM_set_statusline = 0 -- already set via lualine component
  end,
}
