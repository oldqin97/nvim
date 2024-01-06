vim.cmd([[
  let g:any_jump_disable_default_keybindings = 1
]])
return {
  "pechorin/any-jump.vim",
  -- event = "BufReadPost",
  cmd = { "AnyJump" },
  keys = {
    { "<leader>j", "<cmd>AnyJump<cr>", desc = "anyjump" },
  },
}
