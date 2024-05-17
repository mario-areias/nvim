return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]AP: Toggle [B]reakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[D]AP: Run/[C]ontinue" })
		vim.keymap.set("n", "<Leader>dx", dap.disconnect, { desc = "[D]AP: Terminate" })
		vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "[D]AP: Step [O]ver" })
		vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "[D]AP: Step [I]nto" })
	end,
}
