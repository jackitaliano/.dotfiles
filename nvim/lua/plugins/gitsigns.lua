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
        end, 'Jump to next git [c]hange')

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, 'Jump to previous git [c]hange')

        -- Actions
        -- visual mode
        hunk_map('v', 's', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'git [s]tage hunk')
        hunk_map('v', 'r', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'git [r]eset hunk')

        hunk_map('n', 'd', gitsigns.preview_hunk_inline, '[T]oggle git show [D]eleted')

        -- normal mode
        git_map('n', 's', gitsigns.stage_hunk, 'git [s]tage hunk')
        git_map('n', 'r', gitsigns.reset_hunk, 'git [r]eset hunk')
        git_map('n', 'S', gitsigns.stage_buffer, 'git [S]tage buffer')
        git_map('n', 'u', gitsigns.stage_hunk, 'git [u]ndo stage hunk')
        git_map('n', 'R', gitsigns.reset_buffer, 'git [R]eset buffer')
        git_map('n', 'p', gitsigns.preview_hunk, 'git [p]review hunk')
        git_map('n', 'b', gitsigns.blame_line, 'git [b]lame line')
        git_map('n', 'd', gitsigns.diffthis, 'git [d]iff against index')
        git_map('n', 'D', function()
          gitsigns.diffthis '@'
        end, 'git [D]iff against last commit')
        -- Toggles
        git_ui_map('n', 'b', gitsigns.toggle_current_line_blame, 'Toggle [B]lame')
      end,
    },
  },
}
