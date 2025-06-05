local M = {}

---@param prefix string
---@param default_opts? vim.keymap.set.Opts
function M.get_prefix_map(prefix, default_opts)
  ---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|.
  ---                            Can also be list of modes to create mapping on multiple modes.
  ---@param lhs string           Left-hand side |{lhs}| of the mapping.
  ---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
  ---
  ---@param opts? vim.keymap.set.Opts
  return function(mode, lhs, rhs, desc, opts)
    opts = opts or {}
    if default_opts then
      opts = vim.tbl_deep_extend('force', {}, opts, default_opts or {})
    end

    M.map(mode, prefix .. lhs, rhs, desc, opts)
  end
end

---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|.
---                            Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---
---@param desc? string
---@param opts? vim.keymap.set.Opts
function M.map(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc or opts.desc or ''

  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
