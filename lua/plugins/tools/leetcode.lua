-- LeetCode 刷题插件（支持中文题目翻译）
return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "javascript",
      cn = {
        enabled = true,
        translator = true,
        translate_problems = true,
      },
    },
  },
}
