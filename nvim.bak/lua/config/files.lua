local function new_file_input()
  vim.ui.input({ prompt = "Create File: " }, function(input)
    if not input or input == "" then
      return
    end

    local cwd = vim.fn.expand("%:p:h")
    local newFileName = string.format("%s/%s", cwd, input)

    local fileExists = vim.fn.filereadable(newFileName)
    if fileExists == 1 then
      print("File already exists.")
      return
    end

    vim.cmd({ cmd = "enew" })
    vim.cmd({ cmd = "w", args = { string.format("%s", newFileName) } })
  end)
end

local function rename_file()
  vim.ui.input({ prompt = "New File Name:" }, function(input)
    if not input or input == "" then
      return
    end

    local currFileName = vim.fn.expand("%:p:t")
    if input == currFileName then
      return
    end

    local cwd = vim.fn.expand("%:p:h")
    local newFilePath = string.format("%s/%s", cwd, input)
    local currFilePath = string.format("%s/%s", cwd, currFileName)

    local fileExists = vim.fn.filereadable(newFilePath)
    if fileExists == 1 then
      print("File already exists.")
      return
    end

    local ok, result = pcall(
      vim.cmd,
      { cmd = "sav", args = { string.format("%s", newFilePath) } }
    )

    if ok then
      print("Saving to:", newFilePath )
      vim.cmd({ cmd = "bdelete", args = { string.format("%s", currFileName) } })
      os.remove(currFilePath)
    else
      print("Failed to save new file (", result, ")")
    end
  end)
end

return {
  vim.keymap.set({ "n" }, "<leader>fn", new_file_input, { desc = "New File" }),
  vim.keymap.set({ "n" }, "<leader>fr", rename_file, { desc = "Rename File" }),
}
