local opts = {
	default_config = {
		-- Update the path to prosemd-lsp
		cmd = { "/usr/local/bin/prosemd-lsp", "--stdio" },
		filetypes = { "markdown" },
		root_dir = function(fname)
			return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
		end,
		settings = {},
	},
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
