return {
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				vim.keymap.set("n", "[c", gitsigns.prev_hunk, { buffer = bufnr, desc = "Go to Previous Hunk" })
				vim.keymap.set("n", "]c", gitsigns.next_hunk, { buffer = bufnr, desc = "Go to Next Hunk" })
				vim.keymap.set("n", "<leader>ph", gitsigns.preview_hunk, { buffer = bufnr, desc = "[P]review [H]unk" })
				vim.keymap.set("n", "<leader>rh", gitsigns.reset_hunk, { buffer = bufnr, desc = "[R]eset [H]unk" })
			end,
		},
	},
}
