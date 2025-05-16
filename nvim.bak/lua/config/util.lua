local M = {}

function M.remap(table)
  vim.keymap.set(table.modes or { "n" }, table.from, table.to, {
    buffer = table.bufrn or false,
    silent = true,
    desc = table.desc or "",
  })
end

return M
