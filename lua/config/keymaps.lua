local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
	local keys = require("lazy.core.handler").handlers.keys

	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or {}
		opts.silent = opts.silent ~= false
		if opts.remap and not vim.g.vscode then
			opts.remap = nil
		end
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- close page
map("n", "qq", "<cmd>q <CR>", { desc = "close page" })

-- 移动行
map("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- map("i", "<S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

-- 切换 buffer
if Util.has("bufferline.nvim") then
	map("n", "<A-9>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
	map("n", "<A-0>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
	map("n", "<A-9>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
	map("n", "<A-0>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- save
map({ "i", "x", "n", "s" }, "<A-s>", function()
	vim.lsp.buf.format()
end, { desc = "format file" })

-- 移动光标
map("n", "<S-h>", "^", { desc = "move cursor to begin" })
map("n", "<S-l>", "$", { desc = "move cursor to end" })
map("v", "<S-h>", "^", { desc = "move cursor to begin" })
map("v", "<S-l>", "$h", { desc = "move cursor to end" })

-- 删除行
map("n", "dh", "d^x", { desc = "move cursor to end" })
map("n", "dl", "d$", { desc = "move cursor to end" })

-- w  b 跳过标点符号
map({ "x", "n", "s", "o" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "spider-w" })
map({ "x", "n", "s", "o" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "spider-b" })

-- fold
map("n", "zz", "zc", { desc = "fold close" })
map("n", "Z", "zR", { desc = "fold open" })

-- todo
map("n", "<A-t>", "<cmd> TodoTelescope<CR>", { desc = "Todo list" })
-- bookmark
map("n", "<A-b>", "<cmd> Telescope bookmarks list<CR>", { desc = "Todo list" })

-- git conflict
map("n", "<leader>co", "<cmd>ConflictMarkerOurselves<CR>", { desc = "Todo list" })
map("n", "<leader>ct", "<cmd>ConflictMarkerThemselves<CR>", { desc = "Todo list" })
map("n", "<leader>cb", "<cmd>ConflictMarkerBoth<CR>", { desc = "Todo list" })

-- rest
map("n", "<F1>", function()
	require("rest-nvim").run()
end, { desc = "rest" })

-- html
-- map("n", "<F4>", "<cmd>BrowserPreview -f --port 9229<CR>", { desc = "preview html file" })
-- map("n", "<leader>sh", "<cmd>BrowserStop<CR>", { desc = "close html file" })

-- flash
map({ "x", "n", "o" }, "f", function()
	require("flash").jump()
end, { desc = "Flash" })

map({ "n", "o", "x" }, "R", function()
	require("flash").treesitter()
end, { desc = "Toggle Flash Search" })

map("n", "s", "=", { desc = "replace s" })
map("n", "sh", "<cmd> vertical resize +5<CR>", { desc = "resize s" })
map("n", "sl", "<cmd> vertical resize -5<CR>", { desc = "resize s" })
map("n", "sk", "<cmd> resize +5<CR>", { desc = "resize s" })
map("n", "sj", "<cmd> resize -5<CR>", { desc = "resize s" })
