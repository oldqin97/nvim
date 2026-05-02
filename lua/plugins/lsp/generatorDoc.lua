-- 文档注释生成器（自动生成 JSDoc/docstring）
vim.g.doge_enable_mappings = 1
vim.g.doge_mapping = "<A-d>"
vim.g.doge_comment_jump_modes = { "n", "s", "i" }
return {
  "kkoomen/vim-doge",
  event = "BufReadPost",
}
