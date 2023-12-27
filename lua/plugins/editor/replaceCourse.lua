return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Replace in files (Spectre)",
    },
    {
      "<leader>r",
      function()
        require("spectre.actions").run_replace()
      end,
      desc = "replace all",
    },
  },
}
