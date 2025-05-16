return {
  'navarasu/onedark.nvim',
  priority = 1000,
  -- opts = {
  --   transparent = true
  -- },
  config = function()
    vim.cmd.colorscheme 'onedark'
    require('onedark').setup {
      transparent = true
    }
    require('onedark').load()
  end,
}
