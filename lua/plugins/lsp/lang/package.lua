-- package.json 依赖管理：安装、删除、更新、版本切换
return {
  "vuki656/package-info.nvim",
  ft = "json",
  config = true,
  keys = {
    { "<leader>pt", "<cmd>lua require('package-info').toggle()<CR>", "toggle package.json display info" },
    { "<leader>pd", "<cmd>lua require('package-info').delete()<CR>", "delete package.json package" },
    { "<leader>pc", "<cmd>lua require('package-info').change_version()<CR>", "change package.json package" },
    { "<leader>pi", "<cmd>lua require('package-info').install()<CR>", "install package.json package" },
  },
}
