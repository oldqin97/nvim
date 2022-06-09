local status, gitlens = pcall(require, "blamer")
if not status then
  vim.notify("没有找到 gitlens")
  return
end

gitlens.setup()
