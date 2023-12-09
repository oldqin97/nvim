return {
	"rbong/vim-flog",
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	keys = {
		{ "<F3>", "<cmd>Flog<cr>", desc = "git graph" },
	},
	dependencies = {
		"tpope/vim-fugitive",
	},
}
