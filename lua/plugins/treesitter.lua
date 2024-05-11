return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"gomod",
					"gosum",
					"kdl",
					"lua",
					"python",
					"rust",
					"tsx",
					"typescript",
					"vimdoc",
					"vim",
					"terraform",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
