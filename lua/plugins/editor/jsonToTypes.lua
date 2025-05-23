return {
  "Redoxahmii/json-to-types.nvim",
  build = "sh install.sh npm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
  ft = "json",
  keys = {
    {
      "<leader>cf",
      "<CMD>ConvertJSONtoLang typescript<CR>",
      desc = "Convert JSON to TS",
    },
    {
      "<leader>cb",
      "<CMD>ConvertJSONtoLangBuffer typescript<CR>",
      desc = "Convert JSON to TS Buffer",
    },
  },
}
