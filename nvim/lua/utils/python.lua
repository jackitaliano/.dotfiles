local M = {}

function M.get_python_path()
  -- Use activated virtualenv
  if vim.env.VIRTUAL_ENV then
    vim.notify 'using VIRTUAL_ENV'
    return vim.env.VIRTUAL_ENV .. '/bin/python'
  end

  -- Find and use pyenv environment
  local pyenv_path = vim.fn.system('pyenv which python'):gsub('\n', '')
  if vim.fn.filereadable(pyenv_path) == 1 then
    vim.notify 'using PYENV'
    return pyenv_path
  end

  -- Default to system Python
  return vim.fn.exepath 'python3' or vim.fn.exepath 'python' or 'python'
end

return M
