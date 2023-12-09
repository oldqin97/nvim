return {
	"rareitems/printer.nvim",
	event = "BufReadPost",
	config = function()
		require("printer").setup({
			keymap = "<leader>pb", -- Plugin doesn't have any keymaps by default
			behavior = "insert_below", -- how operator should behave

			formatters = {
				lua = function(inside, variable)
					return string.format('print("%s: " .. %s)', inside, variable)
				end,
			},
			add_to_inside = function(text)
				return string.format("[%s:%s] %s", vim.fn.expand("%"), vim.fn.line("."), text)
			end,
		})

		-- keymap to always yank the debug print
		-- vim.keymap.set("n", "gp", "<Plug>(printer_yank)")
		-- vim.keymap.set("v", "gp", "<Plug>(printer_yank)")

		-- keymap to always insert below the debug print
		vim.keymap.set("n", "<leader>pb", "<Plug>(printer_below)iw")
		vim.keymap.set("v", "<leader>pb", "<Plug>(printer_below)iw")

		-- You can use use '<Plug>printer_print' to call the pluging inside more advanced keymaps
		-- for example a keymap that always adds a prnt statement based on 'iw'
		vim.keymap.set("n", "gP", "<Plug>(printer_print)iw")
	end,
}
