return {
  {
    -- git graph
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    keys = {
      { "<F3>", "<cmd>Flog<cr>", desc = "git graph" },
    },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      -- signs = {
      --   add = { text = "" },
      --   change = { text = "" },
      --   delete = { text = "󰱢" },
      --   topdelete = { text = "‾" },
      --   changedelete = { text = "󱁤" },
      --   untracked = { text = "" },
      -- },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
    },
  },
}
