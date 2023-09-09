return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	'lewis6991/gitsigns.nvim',
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
		on_attach = function(bufnr)
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			local gs = require('gitsigns')

			map('n', '[h', gs.prev_hunk, { buffer = bufnr, desc = 'Previous Hunk' })
			map('n', ']h', gs.next_hunk, { buffer = bufnr, desc = 'Next Hunk' })
			map('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'Blame Line' })
			map('n', '<leader>gs', gs.stage_buffer, { desc = 'Stage Buffer' })
			map('n', '<leader>gr', gs.reset_buffer, { desc = 'Reset Buffer' })
			map('n', '<leader>gd', function() gs.diffthis('~') end, { desc = 'Diff Buffer' })

			map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage Hunk' })
			map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset Hunk' })
			map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Stage Hunk' })
			map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Reset Hunk' })

			map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage' })
			map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
			map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Blame Hunk' })
			map('n', '<leader>hd', gs.diffthis, { desc = 'Diff Hunk' })
			-- map('n', '<leader>td', gs.toggle_deleted)
		end,
	},
}
