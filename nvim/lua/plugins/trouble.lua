return {
  'folke/trouble.nvim',
  specs = {
    'folke/snacks.nvim',
    opts = function(_, opts)
      return vim.tbl_deep_extend('force', opts or {}, {
        picker = {
          actions = require('trouble.sources.snacks').actions,
          win = {
            input = {
              keys = {
                ['<c-q>'] = {
                  'trouble_open',
                  mode = { 'n', 'i' },
                },
              },
            },
          },
        },
      })
    end,
  },
  config = function()
    ---@type trouble.Config
    local opts = {
      preview = {
        type = 'split',
        relative = 'win',
        position = 'right',
        size = 0.4,
      },
    } -- for default options, refer to the configuration section for custom setup.
    vim.api.nvim_create_autocmd('QuickFixCmdPost', {
      callback = function()
        vim.cmd [[Trouble qflist open]]
      end,
    })

    vim.api.nvim_create_autocmd('BufRead', {
      callback = function(ev)
        if vim.bo[ev.buf].buftype == 'quickfix' then
          vim.schedule(function()
            vim.cmd [[cclose]]
            vim.cmd [[Trouble qflist open]]
          end)
        end
      end,
    })
    local trouble = require 'trouble'
    trouble.setup(opts)

    local grey = '#161616'
    local light_grey = '#2f2f31'

    local hl_groups = {
      TroubleFsCount = grey,
      TroubleFzfCount = grey,
      TroubleQfCount = grey,
      TroubleLspCount = grey,
      TroubleTodoCount = grey,
      TroubleSnacksCount = grey,
      TroubleDiagnosticsCount = grey,
      TroubleTelescopeCount = grey,
      TroubleProfilerCount = grey,
      TroublePreview = grey,
      TroubleNormalNC = grey,
      TroubleNormal = grey,
      TroubleCount = grey,
    }

    for hl_group, color in pairs(hl_groups) do
      vim.api.nvim_set_hl(0, hl_group, { bg = color })
    end
  end,
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
