local augroup = vim.api.nvim_create_augroup("highlight_cmds", { clear = true })
local vim = vim
local api = vim.api
api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      - "r" -- But do continue when pressing enter.
  end,
})
vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]])

api.nvim_create_autocmd("BufReadPost", {
  command = "HlSearchLensDisable",
})

-- 进入Insert模式切换为绝对行号
api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = false
  end,
})

-- 退出Insert模式切换为相对行号
api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "lua",
    "javascript",
    "typescript",
    "vue",
    "html",
    "css",
    "javascriptreact",
    "typescriptreact",
    "rust",
    "python",
    "json",
    "markdown",
  },
  callback = function()
    vim.b.autoformat = false
  end,
})
