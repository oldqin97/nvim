-- vim-dog
vim.cmd([[
  let g:doge_enable_mappings = 1
  let g:doge_mapping = '<A-d>'
  let g:doge_comment_jump_modes = ['n','s']
]])
return {
  "kkoomen/vim-doge",
  event = "BufReadPost",
}
