return {
  "vuki656/package-info.nvim",
  event = "BufEnter package.json",
  config = true,
  keys = {
    { "<leader>pt", "<cmd>lua require('package-info').toggle()<CR>", "toggle package.json display info" },
    { "<leader>pd", "<cmd>lua require('package-info').delete()<CR>", "delete package.json package" },
    { "<leader>pc", "<cmd>lua require('package-info').change_version()<CR>", "change package.json package" },
  },
}
