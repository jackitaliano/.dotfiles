return {
  'preservim/vim-markdown',
  lazy = true,
  ft = 'markdown',
  init = function()
    vim.g.vim_markdown_folding_disabled = 1
  end,
}
