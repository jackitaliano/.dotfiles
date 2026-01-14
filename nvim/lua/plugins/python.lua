return {
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python',
      { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    branch = 'regexp',
    keys = {
      { '<leader>cv', mode = { 'n' }, '<cmd>VenvSelect<cr>' },
    },
    ---@type venv-selector.Config
    opts = {},
  },
}
