-- dirs
local root = "/Users/jackitaliano"
local notesDir = root .. "/notes/2023"
local projectsDir = root .. "/projects"
local configDir = root .. "/.config"

-- return {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   keys = {
--     { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
--   },
--   opts = function()
--     -- OR setup with some options
--     require("nvim-tree").setup({
--       view = {
--         width = 30,
--       },
--       renderer = {
--         group_empty = true,
--       },
--       filters = {
--         dotfiles = true,
--       },
--     })
--   end,
-- }

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  -- oil filetree
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>me", "<cmd>Oil --float " .. notesDir .. "<cr>", desc = "[e]xplore notes" },

    },
  },
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
    },
    config = function()
      require('neo-tree').setup {
        content_layout = {
          width = 50,
        },
      }
    end,
  }
}
