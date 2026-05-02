-- JSON 转 TypeScript 类型定义
return {
  "Redoxahmii/json-to-types.nvim",
  build = "sh install.sh npm",
  ft = "json",
  keys = {
    { "<leader>cf", "<CMD>ConvertJSONtoLang typescript<CR>", desc = "Convert JSON to TS" },
    { "<leader>cb", "<CMD>ConvertJSONtoLangBuffer typescript<CR>", desc = "Convert JSON to TS Buffer" },
  },
}
