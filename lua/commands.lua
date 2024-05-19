-- Command to Disable Format on a buffer
-- FormatDisable! will disable formatting just for this buffer
-- FormatDisable will disable formatting for all buffers
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
		vim.notify("Buffer format disabled!")
	else
		vim.g.disable_autoformat = true
		vim.notify("Buffer format disabled!")
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false

	vim.notify("Format enabled!")
end, {
	desc = "Re-enable autoformat-on-save",
})

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
