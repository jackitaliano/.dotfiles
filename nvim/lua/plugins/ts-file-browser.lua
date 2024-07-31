return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	opts = function()
		require("telescope-file-browser").setup({ depth = false })
		require("telescope").load_extension("file_browser")
	end,
	keys = {
		{ "<leader>fb", "<cmd>Telescope file_browser depth=false<cr>", desc = "Browser" },
	}
}
