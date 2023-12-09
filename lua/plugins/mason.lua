return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	cmd = "Mason",
	keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
  },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"node-debug2-adapter",
			-- "ltex-ls",
			"grammarly-languageserver",
			"svelte-language-server",
			"angular-language-server",
			"bash-language-server",
			"prisma-language-server",
			"nginx-language-server",
			"black",
			"markdownlint",
			"cspell",
			"css-lsp",
			"cssmodules-language-server",
			"debugpy",
			"docker-compose-language-service",
			"dockerfile-language-server",
			"emmet-language-server",
			"eslint-lsp",
			"eslint_d",
			"graphql-language-service-cli",
			"html-lsp",
			"js-debug-adapter",
			"json-lsp",
			"lua-language-server",
			"prettierd",
			"pyright",
			"rust-analyzer",
			"rustfmt",
			"shfmt",
			"stylua",
			"tailwindcss-language-server",
			"typescript-language-server",
			"unocss-language-server",
			"vue-language-server",
			"yaml-language-server",
			"sqlls",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		local function ensure_installed()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end
		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
