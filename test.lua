local default_servers = { a = { q = 1 }, servers = {
  javascript = { a = 1 },
} }
local custom_servers = { servers = {
  clangd = { w = "c" },
  lua_ls = { new_setting = true },
} }
local merged_servers = vim.tbl_deep_extend("force", default_servers, custom_servers)

print(vim.inspect(merged_servers))
