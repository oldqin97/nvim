return {
  "mbbill/undotree",
  cmd = { "UndotreeToggle" },
  keys = {
    { "<leader>ud", "<cmd>UndotreeToggle<cr>", desc = "undoTree" },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.cmd([[
    if has("persistent_undo")
       let target_path = expand('~/.config/nvim/.undodir')
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif

        let &undodir=target_path
        set undofile
    endif
   ]])
  end,
}
