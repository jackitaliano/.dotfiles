local minifiles_toggle = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

return {
  {

    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = true,
        width_focus = 35,
      },
    },
    keys = {
      { '<leader>e', minifiles_toggle, desc = 'explore' },
    },
  },
  {
    'echasnovski/mini.ai',
    opts = {
      n_lines = 500,
    },
  },
}
