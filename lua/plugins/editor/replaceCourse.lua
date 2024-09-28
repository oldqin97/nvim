---@diagnostic disable: deprecated
return {
  -- "nvim-pack/nvim-spectre",
  -- cmd = "Spectre",
  -- opts = { open_cmd = "noswapfile vnew" },
  -- keys = {
  --   -- {
  --   --   "<leader>sr",
  --   --   "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
  --   --   desc = "Replace in files ()",
  --   --   mode = { "n" },
  --   -- },
  --   -- {
  --   --   "<leader>sr",
  --   --   "<esc><cmd>lua require('spectre').open_visual()<CR>",
  --   --   desc = "Replace in files (visual mode)",
  --   --   mode = { "v" },
  --   -- },
  --   {
  --     "<leader>r",
  --     function()
  --       require("spectre.actions").run_replace()
  --     end,
  --     desc = "replace all",
  --   },
  -- },

  {
    "MagicDuck/grug-far.nvim",
    opts = {
      headerMaxWidth = 80,
      keymaps = {
        replace = { n = "<leader>r" },
        syncLocations = { n = "<leader>s" },
        historyOpen = { n = "<leader>t" },
        close = { n = "<leader>c" },
        refresh = { n = "<leader>f" },
        openLocation = { n = "<Tab>" },
        gotoLocation = { n = "o" },
      },
    },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sm",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.grug_far({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
              search = vim.fn.expand("<cword>"),
            },
            select_word = true,
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace all",
      },
      {
        "<leader>sr",
        function()
          require("grug-far").open({
            prefills = { paths = vim.fn.expand("%"), search = vim.fn.expand("<cword>") },
            select_word = true,
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace current",
      },
    },
  },
}
