-- 快速跳转到变量/函数定义
vim.cmd([[
  let g:any_jump_disable_default_keybindings = 1
]])
return {
  "pechorin/any-jump.vim",
  cmd = { "AnyJump" },
  keys = {
    { "<leader>j", "<cmd>AnyJump<cr>", desc = "anyjump" },
  },
}
