return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()

		local dap, dapui, dapgo = require("dap"), require("dapui"), require("dap-go")

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

		-- Unfortunatly cappuccin doesn't have a pre-configured setting for this using a background
		-- Since I prefer high contrast, I am rolling out this custom config
		vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "DapBreakpoint", numhl = "" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "→", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)

		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "[D]AP: Toggle [B]reakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[D]AP: Run/[C]ontinue" })
		vim.keymap.set("n", "<Leader>dx", dap.disconnect, { desc = "[D]AP: Terminate" })
		vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "[D]AP: Step [o]ver" })
		vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "[D]AP: Step [O]ut" })
		vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "[D]AP: Step [I]nto" })

		-- This mapping only works for Go. It is a custom mapping to run the test close to the cursor
		-- All other operations can be done by the above mappings
		vim.keymap.set("n", "<Leader>gd", dapgo.debug_test, { desc = "[G]o: [D]ebug Test" })
	end,
}
