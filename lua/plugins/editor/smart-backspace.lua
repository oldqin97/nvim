-- 智能退格：根据缩进上下文智能删除空格
return {
  "qwavies/smart-backspace.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
}
