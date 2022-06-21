vim.o.background = "dark"
-- vim.g.tokyonight_style = "night" -- day / night
-- 半透明
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

require("onedark").setup({
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "NONE",
  variable_style = "NONE",
  highlight_linenumber = true,

  overrides = function(c)
    return {
      Comment = { fg = "#f26522" },
    }
  end,
})

local colorscheme = "onedark"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
