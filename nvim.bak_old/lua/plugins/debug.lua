return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" }
		}
	},
	{
		"rcarriga/nvim-dap-ui"
	},
	{
		"nvim-neotest/nvim-nio"
	},
	{
		"theHamsta/nvim-dap-virtual-text"
	}
}
