vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

local minifiles_toggle = function(...)
  if not MiniFiles.close() then MiniFiles.open(...) end
end

return {
  {
    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = true,
        width_focus = 35
      }
    },
    keys = {
      { "<leader>e", minifiles_toggle, desc = "e[xplore]" }
    },
    lazy=false
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>E", "<cmd>Neotree toggle<cr>", desc = "[E]xplore" },
    },
    config = function()
      require('neo-tree').setup {
        content_layout = {
          width = 50,
        },
      }
    end,
    lazy = true
  }
  -- oil filetree
  -- {
  --   'stevearc/oil.nvim',
  --   opts = {
  --     default_file_exporer = true,
  --     float = {
  --       padding = 4
  --     }
  --   },
  --   -- Optional dependencies
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   keys = {
  --     { "<leader>ce", "<cmd>Oil --float<cr>", desc = "[e]xplore " },
  --
  --   },
  --   lazy=false
  -- },
  -- Neotree
}
