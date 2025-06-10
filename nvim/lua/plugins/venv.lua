local prefixes = require 'utils.prefixes'
local prefix = prefixes.code_actions.keys

return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  branch = 'regexp',
  keys = {
    { prefix .. 'v', mode = { 'n' }, '<cmd>VenvSelect<cr>' },
  },
  ---@type venv-selector.Config
  opts = {},
}
