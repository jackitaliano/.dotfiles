-- Alternatively, use `config = function() ... end` for full control over the configuration.
-- If you prefer to call `setup` explicitly, use:
--    {
--        'lewis6991/gitsigns.nvim',
--        config = function()
--            require('gitsigns').setup({
--                -- Your gitsigns configuration here
--            })
--        end,
--    }
--
-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do

local prefixes = require 'utils.prefixes'
local utils = require 'utils.common'

local git_prefix = prefixes.git.keys
local hunk_prefix = prefixes.git.hunk.keys
local git_ui_prefix = prefixes.ui.git.keys

return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        -- local function map(mode, l, r, opts)
        --   opts = opts or {}
        --   opts.buffer = bufnr
        --   vim.keymap.set(mode, l, r, opts)
        -- end
        --
        local default_opts = { buffer = bufnr }

        local git_map = utils.get_prefix_map(git_prefix, default_opts)
        local git_ui_map = utils.get_prefix_map(git_ui_prefix, default_opts)
        local hunk_map = utils.get_prefix_map(hunk_prefix, default_opts)
        local map = utils.get_prefix_map('', default_opts)

        -- Navigation
        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, 'Jump to next git change')

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, 'Jump to previous git change')

        -- Actions
        -- visual mode
        hunk_map('v', 's', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'git stage hunk')
        hunk_map('v', 'r', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'git reset hunk')

        hunk_map('n', 'd', gitsigns.preview_hunk_inline, 'Toggle git show Deleted')

        -- normal mode
        git_map('n', 's', gitsigns.stage_hunk, 'git stage hunk')
        git_map('n', 'r', gitsigns.reset_hunk, 'git reset hunk')
        git_map('n', 'S', gitsigns.stage_buffer, 'git Stage buffer')
        git_map('n', 'u', gitsigns.stage_hunk, 'git undo stage hunk')
        git_map('n', 'R', gitsigns.reset_buffer, 'git Reset buffer')
        git_map('n', 'p', gitsigns.preview_hunk, 'git preview hunk')
        -- git_map('n', 'b', gitsigns.blame_line, 'git blame line')
        git_map('n', 'd', gitsigns.diffthis, 'git diff against index')
        git_map('n', 'D', function()
          gitsigns.diffthis '@'
        end, 'git Diff against last commit')
        -- Toggles
        git_ui_map('n', 'b', gitsigns.toggle_current_line_blame, 'Toggle Blame')
      end,
    },
  },
}
