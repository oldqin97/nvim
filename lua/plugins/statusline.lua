local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons
return {
	"nvim-lualine/lualine.nvim",
	optional = true,
	event = "VeryLazy",
	opts = {
		options = {
			theme = "onedark",
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = " ", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {
				{
					function()
						return require("noice").api.status.mode.get()
					end,
					cond = function()
						return package.loaded["noice"] and require("noice").api.status.mode.has()
					end,
					color = Util.ui.fg("Constant"),
				},
				{
					function()
						return "  " .. require("dap").status()
					end,
					cond = function()
						return package.loaded["dap"] and require("dap").status() ~= ""
					end,
					color = Util.ui.fg("Debug"),
				},
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = Util.ui.fg("Special"),
				},
				{
					"diff",
					symbols = {
						added = icons.git.added,
						modified = icons.git.modified,
						removed = icons.git.removed,
					},
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			},
			lualine_y = {
				{ "location", padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				"filesize",
			},
		},
	},
}
