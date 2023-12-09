return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{
			"<A-w>",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root.get() })
			end,
			desc = "Explorer NeoTree (root dir)",
		},
		{
			"<leader>fE",
			false,
		},
		{ "<leader>e", false },
		{ "<leader>E", false },
	},

	opts = {
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show = {
					".DS_Store",
				},
			},
		},
		window = {
			position = "right",
			mappings = {
				["<space>"] = "none",
				["o"] = "open",
				["<esc>"] = "cancel",
				["P"] = { "toggle_preview", config = { use_float = true } },
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
	},
}
