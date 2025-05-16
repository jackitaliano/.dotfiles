return {
	"Wansmer/treesj",
	keys = {
		{ "<leader>cm", "<cmd>TSJToggle<cr>", desc = "Toggle TreesJ" },
	},
	cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	opts = {
		use_default_keymaps = false,
	}
}
