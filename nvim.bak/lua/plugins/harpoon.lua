return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  opts = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true
      }
    })

    vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)
  end,
  lazy = false
}
