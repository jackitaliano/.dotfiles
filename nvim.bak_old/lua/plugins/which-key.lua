return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  lazy = false,
  opts = function()
    local wk = require('which-key')

    wk.add({
      { "<leader>c", group = "Code" },
      { "<leader>s", group = "Search" },
      { "<leader>b", group = "Buffer" },
      { "<leader>g", group = "Git" },
      { "<leader>f", group = "Files" },
      { "<leader>d", group = "Document" },
      { "<leader>w", group = "Write" },
      { "<leader>m", group = "Notes" },
    })
  end,
} 
