return {
	{
		'kevinhwang91/nvim-bqf',
		keys = {
			{ "<leader>co", "<cmd>copen<cr>", desc = "Quickfix [Open]" },
			{ "<C-n>", "<cmd>cnext<cr>", desc = "Quickfix Next" },
			{ "<C-p>", "<cmd>cprevious<cr>", desc = "Quickfix Previous" },
		},
		lazy = false,
	},
	-- optional
	{
		'junegunn/fzf',
		run = function()
			vim.fn['fzf#install']()
		end
	},

	-- optional, highly recommended
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
}
