local ivy = {
  box = 'vertical',
  backdrop = false,
  row = -1,
  width = 0,
  height = 0.4,
  border = 'top',
  title = ' {title} {live} {flags}',
  title_pos = 'left',
  { win = 'input', height = 1, border = 'bottom' },
  {
    box = 'horizontal',
    { win = 'list', border = 'none' },
    { win = 'preview', title = '{preview}', width = 0.6, border = 'left' },
  },
}

local dropdown = {
  layout = {
    backdrop = false,
    row = 1,
    width = 0.4,
    min_width = 80,
    height = 0.8,
    border = 'none',
    box = 'vertical',
    { win = 'preview', title = '{preview}', height = 0.4, border = 'rounded' },
    {
      box = 'vertical',
      border = 'rounded',
      title = '{title} {live} {flags}',
      title_pos = 'center',
      { win = 'input', height = 1, border = 'bottom' },
      { win = 'list', border = 'none' },
    },
  },
}

return {
  -- lazy.nvim
  {
    'folke/snacks.nvim',
    ---@type snacks.Config

    opts = {
      layout = ivy,
    },

    keys = {
      {
        '<leader>gb',
        function()
          require('snacks').picker.git_log_line()
        end,
        'Git Blame Line',
      },
      {
        '<leader>fs',
        function()
          -- opts = {}
          require('snacks').picker.files {
            layout = {
              preview = 'none',
            },
          }
        end,
      },
    },
    -- map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
  },
}
