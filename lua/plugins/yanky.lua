return {
	"gbprod/yanky.nvim",
	opts = {
		highlight = {
			on_yank = false,
			on_put = false,
			timer = 200,
		},
	},
	keys = {
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
	},
}
