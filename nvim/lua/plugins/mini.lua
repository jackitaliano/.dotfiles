local minifiles_toggle = function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end
end

return {
  {

    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = false,
        width_focus = 20,
        max_number = 3,
      },
    },
    keys = {
      { '<leader>e', minifiles_toggle, desc = 'explore' },
    },
  },
  -- {
  --   'echasnovski/mini.ai',
  --   opts = {
  --     n_lines = 500,
  --   },
  -- },
}
