-- Lua
local status_ok, nvim_gps = pcall(require, "nvim-gps")
if not status_ok then
  vim.notify("nvim-gps not found!")
  return
end

-- Customized config
nvim_gps.setup({

  disable_icons = false, -- Setting it to true will disable all icons

  icons = {
    ["class-name"] = " ", -- Classes and class-like objects
    ["function-name"] = " ", -- Functions
    ["method-name"] = " ", -- Methods (functions inside class-like objects)
    ["container-name"] = "⛶ ", -- Containers (example: lua tables)
    ["tag-name"] = "炙", -- Tags (example: html tags)
    ["array-name"] = " ",
    ["object-name"] = " ",
  },

  -- Add custom configuration per language or
  -- Disable the plugin for a language
  -- Any language not disabled here is enabled by default
  languages = {
    -- Some languages have custom icons
    -- ["javascript"] = {
    --   ["class-name"] = " ", -- Classes and class-like objects
    --   ["function-name"] = " ", -- Functions
    --   ["method-name"] = " ", -- Methods (functions inside class-like objects)
    --   ["object-name"] = " ",
    --   ["array-name"] = " ",
    -- },
    -- ["html"] = {
    --   ["tag-name"] = "炙", -- Tags (example: html tags)
    -- },
    ["json"] = {
      icons = {
        ["array-name"] = " ",
        ["object-name"] = " ",
        ["null-name"] = "[] ",
        ["boolean-name"] = "ﰰﰴ ",
        ["number-name"] = "# ",
        ["string-name"] = " ",
      },
    },

    -- Disable for particular languages
    -- ["bash"] = false, -- disables nvim-gps for bash
    -- ["go"] = false,   -- disables nvim-gps for golang

    -- Override default setting for particular languages
    -- ["ruby"] = {
    --	separator = '|', -- Overrides default separator with '|'
    --	icons = {
    --		-- Default icons not specified in the lang config
    --		-- will fallback to the default value
    --		-- "container-name" will fallback to default because it's not set
    --		["function-name"] = '',    -- to ensure empty values, set an empty string
    --		["tag-name"] = ''
    --		["class-name"] = '::',
    --		["method-name"] = '#',
    --	}
    --}
  },

  separator = " > ",

  -- limit for amount of context shown
  -- 0 means no limit
  depth = 0,

  -- indicator used when context hits depth limit
  depth_limit_indicator = "..",
})
