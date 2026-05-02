-- 趣味插件：细胞自动机动画效果
return {
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton make_it_rain",
    keys = {
      { "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Replace in files (Spectre)" },
    },
  },
}
