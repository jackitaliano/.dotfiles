return {
  {
    'kevinhwang91/nvim-bqf',
    config = function()
      local open = true
      vim.keymap.set('n', '<C-q>', function()
        if open then
          vim.cmd.cclose()
          open = false
          return
        end

        vim.cmd.copen()
        open = true
      end)
      vim.keymap.set('n', ']q', vim.cmd.cnext)
      vim.keymap.set('n', '[q', vim.cmd.cprevious)
      vim.keymap.set('n', ']Q', vim.cmd.cnewer)
      vim.keymap.set('n', '[Q', vim.cmd.colder)
    end,
  },
  {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end,
  },
  -- optional, highly recommended
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
}
