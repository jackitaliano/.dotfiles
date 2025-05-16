local M = {}

---@param prefix string
---@param opts? vim.keymap.set.Opts
function M.get_prefix_map(prefix, default_opts)
  ---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|.
  ---                            Can also be list of modes to create mapping on multiple modes.
  ---@param lhs string           Left-hand side |{lhs}| of the mapping.
  ---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
  ---
  ---@param opts? vim.keymap.set.Opts
  return function(mode, lhs, rhs, opts)
    if default_opts then
      opts = vim.tbl_deep_extend('force', {}, opts, default_opts or {})
    end

    vim.keymap.set(mode, prefix .. lhs, rhs, opts)
  end
end

function M.map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

return M
