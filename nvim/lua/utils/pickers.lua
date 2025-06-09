local M = {}

-- local ts_themes = require 'telescope.themes'
--
-- local preview_opts = { winblend = 10, previewer = true }
-- local no_preview_opts = { winblend = 10, previewer = false }
--
-- local drop_picker = ts_themes.get_dropdown(preview_opts)
-- local ivy_picker = ts_themes().get_ivy(no_preview_opts)
--
-- ---@param func function
-- ---@param opts? table
-- function M.drop(func, opts)
--   return function()
--     opts = vim.tbl_deep_extend('force', {}, drop_picker, opts or {})
--     func(opts)
--   end
-- end
--
-- ---@param func function
-- ---@param opts? table
-- function M.ivy(func, opts)
--   return function()
--     opts = vim.tbl_deep_extend('force', {}, ivy_picker, opts or {})
--     func(opts)
--   end
-- end

return M
