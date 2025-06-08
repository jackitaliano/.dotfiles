-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

local minifiles_toggle = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

return {
  {

    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = true,
        width_focus = 35,
      },
    },
    keys = {
      { '<leader>e', minifiles_toggle, desc = '[e]xplore' },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>E', '<cmd>Neotree toggle<CR>', desc = 'NeoTree', silent = true },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        content_layout = {
          width = 22,
        },
      },
      window = {
        width = 25,
        mappings = {
          ['l'] = 'open',
          -- ['h'] = 'close',
          ['/'] = 'noop',
        },
      },
    },
  },
}
