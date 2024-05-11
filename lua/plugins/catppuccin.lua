return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				mason = true,
				notify = true,
				neotree = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
