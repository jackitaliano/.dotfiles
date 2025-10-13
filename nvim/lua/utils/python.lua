local M = {}

function M.get_python_path()
  -- Use activated virtualenv
  if vim.env.VIRTUAL_ENV then
    vim.notify 'using VIRTUAL_ENV'
    return vim.env.VIRTUAL_ENV .. '/bin/python'
  end

  -- Default to system Python
  return vim.fn.exepath 'python3' or vim.fn.exepath 'python' or 'python'
end

return M
