return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-mocha",
				refresh = {
					statusline = 200, -- Note these are in mili second and default is 1000
				},
			},
			-- add section for macro recording:
			-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					-- these 3 are the default sections
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
