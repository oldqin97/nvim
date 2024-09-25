return {
  "LunarVim/bigfile.nvim",
  opts = {
    filesize = 1,
    pattern = { "*" },
    features = {
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      -- "syntax",
      "matchparen",
      "vimopts",
      -- "filetype",
      {
        name = "mini_indentscope",
        disable = function(buf)
          vim.b[buf].miniindentscope_disable = true
        end,
      },
    },
  },
}
