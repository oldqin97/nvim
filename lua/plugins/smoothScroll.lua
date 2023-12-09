return {
	"karb94/neoscroll.nvim",
	event = "BufReadPost",
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>" },
		})
	end,
}
