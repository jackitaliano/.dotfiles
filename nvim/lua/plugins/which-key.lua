return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  lazy = false,
  opts = function()
    local wk = require('which-key')

    wk.register({["<leader>c"] = { name = "Code" }})
    wk.register({["<leader>m"] = { name = "Notes" }})
    wk.register({["<leader>s"] = { name = "Search" }})
    wk.register({["<leader>g"] = { name = "Git" }})
    wk.register({["<leader>w"] = { name = "Workspace" }})
    wk.register({["<leader>d"] = { name = "Document" }})
    wk.register({["<leader>f"] = { name = "Files" }})
  end,
}
