return {
  "mbbill/undotree",
  cmd = { "UndotreeToggle" },
  keys = {
    { "<leader>ud", "<cmd>UndotreeToggle<cr>", desc = "undoTree" },
  },
  config = function()
    vim.cmd([[
    let g:undotree_WindowLayout = 2
    let g:undotree_SetFocusWhenToggle = 1
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
