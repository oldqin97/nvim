return {
  -- "mbbill/undotree",
  -- cmd = { "UndotreeToggle" },
  -- keys = {
  --   { "md", "<cmd>UndotreeToggle<cr>", desc = "undoTree" },
  -- },
  -- init = function()
  --   vim.g.undotree_WindowLayout = 2
  --   vim.g.undotree_SetFocusWhenToggle = 1
  --   vim.cmd([[
  --   if has("persistent_undo")
  --      let target_path = expand('~/.config/nvim/.undodir')
  --       if !isdirectory(target_path)
  --           call mkdir(target_path, "p", 0700)
  --       endif
  --
  --       let &undodir=target_path
  --       set undofile
  --   endif
  --  ]])
  -- end,

  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    keys = {
      { "md", "<cmd>Atone toggle<cr>", desc = "undoTree" },
    },
    opts = {
      layout = {
        ---@type "left"|"right"
        direction = "left",
        ---@type "adaptive"|integer|number
        --- adaptive: exact the width of tree graph
        --- if number given is a float less than 1, the width is set to `vim.o.columns * that number`
        width = 0.50,
      },
      diff_cur_node = {
        enabled = true,
        ---@type number float less than 1
        --- The diff window's height is set to a specified percentage of the original (namely tree graph) window's height.
        split_percent = 0.5,
      },
      keymaps = {
        tree = {
          undo_to = "o",
        },
      },
    },
  },
}
