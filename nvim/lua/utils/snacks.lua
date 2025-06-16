local M = {}

---@type snacks.picker.layout.Config[]
M.layouts = {
  select = {
    layout = {
      backdrop = false,
      width = 0.4,
      min_width = 40,
      height = 0.25,
      min_height = 3,
      box = 'vertical',
      border = 'rounded',
      title = '{title}',
      title_pos = 'center',
      { win = 'input', height = 1, border = 'bottom' },
      { win = 'list', border = 'none' },
    },
  },
  ivy = {
    layout = {
      box = 'vertical',
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
    },
  },
  ivy_fullscreen = {
    layout = {
      fullscreen = true,
      box = 'vertical',
      border = 'none',
      title = ' {title} {live} {flags}',
      title_pos = 'left',
      { win = 'input', height = 1, border = 'bottom' },
      {
        box = 'horizontal',
        { win = 'list', border = 'none' },
        { win = 'preview', title = '{preview}', width = 0.5, border = 'left' },
      },
    },
  },
}

-- local layouts = require 'snacks.picker.config.layouts'
--
-- layouts.select = vim.tbl_deep_extend('keep', M.layouts.select, layouts.select)
-- layouts.ivy = vim.tbl_deep_extend('keep', M.layouts.ivy, layouts.ivy)
-- layouts.ivy_fullscreen = vim.tbl_deep_extend('keep', M.layouts.ivy_fullscreen, layouts.ivy)
--
-- local idx = 1
-- local preferred = {
--   'select',
--   'ivy',
--   'ivy_fullscreen',
-- }
--
-- M.preferred_layout = function()
--   return preferred[idx]
-- end
--
-- M.set_next_preferred_layout = function(picker)
--   idx = idx % #preferred + 1
--   picker:set_layout(preferred[idx])
-- end

return M
