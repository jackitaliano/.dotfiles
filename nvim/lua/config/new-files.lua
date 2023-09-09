local new_file_input = function()
  vim.ui.input({ prompt = "File name: " }, function(input)
    if input and input ~= "" then
      local cwd = vim.fn.expand("%:p:h")
      local newFileName = string.format("%s/%s", cwd, input)

      local fileExists = vim.fn.filereadable(newFileName)
      if not fileExists then
        -- vim.cmd({ cmd = "echo", args = { "File already exists." } })
      else
        vim.cmd({ cmd = "enew" })
        vim.cmd({ cmd = "w", args = { string.format("%s", newFileName) } })
      end
    end
  end)
end

local new_md_input = function()
  vim.ui.input({ prompt = "File name: " }, function(input)
    if input and input ~= "" then
      local cwd = vim.fn.expand("%:p:h")
      local fileExtension = ".md"
      local newFileName = string.format("%s/%s%s", cwd, input, fileExtension)

      local fileExists = vim.fn.filereadable(newFileName)
      if not fileExists then
        -- vim.cmd({ cmd = "echo", args = { "File already exists." } })
      else
        vim.cmd({ cmd = "enew" })
        vim.cmd({ cmd = "w", args = { string.format("%s", newFileName) } })
      end
    end
  end)
end

local new_qn_input = function()
  vim.ui.input({ prompt = "File name: " }, function(input)
    if input and input ~= "" then
      local cwd = vim.fn.expand("~/notes/2023/quickNotes")
      local fileExtension = ".md"
      local newFileName = string.format("%s/%s%s", cwd, input, fileExtension)

      local fileExists = vim.fn.filereadable(newFileName)
      if not fileExists then
        -- vim.cmd({ cmd = "echo", args = { "File already exists." } })
      else
        vim.cmd({ cmd = "enew" })
        vim.cmd({ cmd = "w", args = { string.format("%s", newFileName) } })
      end
    end
  end)
end

return {
  vim.keymap.set({ "n" }, "<leader>fn", function()
    new_file_input()
  end, { desc = "New file" }),
  vim.keymap.set({ "n", "v" }, "<leader>mm", function()
    new_qn_input()
  end, { desc = "New Quick Note", remap = true }),
  vim.keymap.set({ "n", "v" }, "<leader>mn", function()
    new_md_input()
  end, { desc = "New Note", remap = true }),
}
