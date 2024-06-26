return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				filtered_items = {
					hide_dotfiles = false,
					hide_by_pattern = { ".git", "node_modules", ".cache" },
				},
			},
		})

		vim.keymap.set("n", "<leader>tf", [[:Neotree toggle<CR>]], { desc = "[T]oggle [F]iletree" })
	end,
}
