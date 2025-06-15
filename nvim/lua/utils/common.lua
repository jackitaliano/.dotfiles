local M = {}

function M.toggle_plugin(plugin_name)
  local plugins = require('lazy.core.config').plugins
  vim.notify(vim.inspect(plugins))
  local plugin = plugins[plugin_name]
  if plugin then
    -- Toggle the `enabled` flag
    plugin.enabled = not plugin.enabled
    -- Notify user
    vim.notify(plugin_name .. ' enabled = ' .. tostring(plugin.enabled))
    -- Reload Lazy to apply changes
    require('lazy.core.loader').reload()
  else
    vim.notify('Plugin ' .. plugin_name .. ' not found!', vim.log.levels.ERROR)
  end
end

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

---@param default_mode string|string[]
---@param default_opts? vim.keymap.set.Opts
function M.get_mode_map(default_mode, default_opts)
  ---@param lhs string           Left-hand side |{lhs}| of the mapping.
  ---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
  ---
  ---@param opts? vim.keymap.set.Opts
  ---@param mode? string|string[] Mode short-name, see |nvim_set_keymap()|.
  return function(lhs, rhs, desc, opts, mode)
    opts = opts or {}
    if default_opts then
      opts = vim.tbl_deep_extend('force', {}, opts, default_opts or {})
    end

    mode = mode or default_mode

    M.map(mode, lhs, rhs, desc, opts)
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
