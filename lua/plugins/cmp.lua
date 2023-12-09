local setCompHL = function()
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
	vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

	vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
	vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
	vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

	vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
	vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
	vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

	vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
	vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
	vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

	vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
	vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
	vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
	vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
	vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

	vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
	vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

	vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
	vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
	vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

	vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
	vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
	vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

	vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
	vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
	vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
	vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#D8EEEB", bg = "#58B5A8" })
	-- vim.api.nvim_set_hl(0, "CmpItemKindLine", { fg = "#FFFFFF", bg = "#82AAFF" })
	vim.api.nvim_set_hl(0, "CmpItemKindLine", { fg = "#D8EEEB", bg = "#B5585F" })
	vim.api.nvim_set_hl(0, "CmpItemBG", { fg = "#FFFFFF", bg = "#262626" })
end

local icons = {
	Array = " ",
	Boolean = "󰨙 ",
	Class = " ",
	Codeium = "󰘦 ",
	Color = " ",
	Control = " ",
	Collapsed = " ",
	Constant = "󰏿 ",
	Constructor = " ",
	Copilot = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = "󰊕 ",
	Interface = " ",
	Key = "󰌆 ",
	Keyword = " ",
	Method = "󰊕 ",
	Module = " ",
	Namespace = "󰦮 ",
	Null = " ",
	Number = "󰎠 ",
	Object = " ",
	Operator = " ",
	Package = " ",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	String = " ",
	Struct = "󰆼 ",
	TabNine = "󰏚 ",
	Text = "󰭷 ",
	TypeParameter = " ",
	Unit = " ",
	Value = "󱡍 ",
	Variable = "󰀫 ",
}

local cmp = require("cmp")

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline({
		["<A-n>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_next_item()
				else
					cmp.complete()
				end
			end,
		},
		["<A-p>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_prev_item()
				else
					cmp.complete()
				end
			end,
		},
		["<Tab>"] = {
			c = cmp.mapping.confirm({ select = true }),
		},
	}),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {

	mapping = cmp.mapping.preset.cmdline({
		["<A-n>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_next_item()
				else
					cmp.complete()
				end
			end,
		},
		["<A-p>"] = {
			c = function()
				if cmp.visible() then
					cmp.select_prev_item()
				else
					cmp.complete()
				end
			end,
		},
		["<Tab>"] = {
			c = cmp.mapping.confirm({ select = true }),
		},
	}),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"octaltree/cmp-look",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"hrsh7th/nvim-cmp",
	},

	opts = function(_, opts)
		setCompHL()
		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			performance = {
				throttle = 100,
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:CmpItemKindLine",
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					winhighlight = "Normal:CmpItemBG,FloatBorder:Pmenu,Search:None",
				},
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", priorit = 9 },
				{ name = "buffer" },
				{ name = "cmp_tabnine", priorit = 10 },
				{ name = "nvim_lua" },
				{ name = "path" },
				{
					name = "look",
					keyword_length = 2,
					option = {
						convert_case = true,
						loud = true,
					},
				},
				{ name = "emoji" },
				{ name = "calc" },
			},
			mapping = cmp.mapping.preset.insert({
				["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<A-p>"] = cmp.mapping.scroll_docs(-4),
				["<A-n>"] = cmp.mapping.scroll_docs(4),
				["<A-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping({
					i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				["<CR>"] = cmp.mapping({
					i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(_, item)
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
						local strings = vim.split(item.kind, "%s", { trimempty = true })
						item.kind = " " .. (strings[1] or "") .. " "
					end
					item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						look = "[Dic]",
						cmp_tabnine = "[Tabnine]",
						path = "[Path]",
						emoji = "[Emoji]",
						calc = "[Calculate]",
						nvim_lua = "[Lua]",
					})[_.source.name]
					return item
				end,
			},
		}
	end,
}
