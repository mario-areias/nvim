local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()

	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

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
			-- add sectin for macro recording:
			-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
			sections = {
				lualine_x = {
					{ "show_macro_recording", fmt = show_macro_recording },
					-- these 3 are the default sections
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
