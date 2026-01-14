local keymap = vim.keymap

local COPILOT_ENABLED = os.getenv 'COPILOT_ENABLED' or 'False' == 'True'

return {
  {
    lazy = false,
    'github/copilot.vim',
    -- enabled = COPILOT_ENABLED,
    config = function()
      keymap.set('n', '<leader>cp', '<cmd>Copilot panel<cr>', { noremap = true, silent = true })
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<c-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ''
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    enabled = COPILOT_ENABLED,
    config = function()
      require('codecompanion').setup()
      keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat<cr>', { noremap = true, silent = true })
      keymap.set('n', 'ga', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
      keymap.set('n', 'gA', "<cmd>lua require('codecompanion').add()<cr>", { noremap = true, silent = true })
    end,
  },
}
