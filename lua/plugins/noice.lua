return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		smart_move = {
			enabled = true,
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "vim-doge" },
		},
		lsp = {
			progress = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
						{ find = "No information available" },
						{ find = "AutoSave: saved at %d+:%d+:%d+" },
						{ find = "Failed to attach to volar for current buffer. Already attached to html" },
						{ find = "Failed to attach to html for current buffer. Already attached to volar" },
						{ find = "Exited Visual-Multi." },
					},
				},
				opts = { stop = true },
			},
		},

		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = false,
		},
	},
}
