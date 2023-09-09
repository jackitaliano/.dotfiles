return {
	"numToStr/FTerm.nvim",
	opts = function()
		require'FTerm'.setup({
				border = 'single',
				dimensions  = {
					height = 0.7,
					width = 0.7,
				},
		})

		-- Example keybindings
		vim.keymap.set('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
