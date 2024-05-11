-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tab configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set termguicolors to vim
vim.o.termguicolors = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
-- gitsigns and other plugins use this
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Set completeopt to have a better completion experience
-- TODO: consider remove it
vim.o.completeopt = "menuone,noselect"

-- Disable LSP log
vim.lsp.set_log_level("off")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Save the current handler: which is used by vim.lsp.buf.definition() function
local old_handler = vim.lsp.handlers["textDocument/definition"]

-- Override the current handler by adding a call to `zz` to center the screen
vim.lsp.handlers["textDocument/definition"] = function(err, method, result, client_id, bufnr, config)
	old_handler(err, method, result, client_id, bufnr, config)
	vim.schedule(function()
		vim.cmd("normal! zz")
	end)
end
