-- local status, gitlens = pcall(require, "blamer")
-- if not status then
--   vim.notify("没有找到 gitlens")
--   return
-- end
--
-- gitlens.setup()

vim.cmd([[
  let g:blamer_delay = 300
  let g:blamer_prefix = '                 -> '
  let g:blamer_show_in_insert_modes = 0
  let g:blamer_show_in_visual_modes = 0
]])
