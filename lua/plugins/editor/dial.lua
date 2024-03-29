local M = {}

M.dials_by_ft = {}

function M.dial(increment, g)
  local is_visual = vim.fn.mode(true):sub(1, 1) == "v"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = M.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<A-a>", function() return M.dial(true) end,  expr = true, desc = "Increment", mode = { "n", "v" } },
      { "<A-x>", function() return M.dial(false) end, expr = true, desc = "Decrement", mode = { "n", "v" } },
    },
  },
}
