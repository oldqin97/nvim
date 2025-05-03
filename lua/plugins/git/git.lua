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
    -- event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    keys = {
      { "<leader>hl", "<cmd>Gitsigns preview_hunk<cr>", desc = "git graph" },
      { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "git graph" },
    },
    -- vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#f0c9cf", bg = "NONE" })
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
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
        delay = 1500,
        ignore_whitespace = false,
      },
    },
  },
}
