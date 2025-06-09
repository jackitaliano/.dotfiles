local utils = require 'utils.common'
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  opts = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }

    local ignore_opts = { desc = 'which_key_ignore' }
    local map = utils.get_prefix_map('', {})
    local map_silent = utils.get_prefix_map('', ignore_opts)

    map('n', '<leader>H', function()
      harpoon:list():add()
    end, '[H]arpoon')
    map('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, 'View [H]arpoon')

    map_silent('n', '<leader>1', function()
      harpoon:list():select(1)
    end)
    map_silent('n', '<leader>2', function()
      harpoon:list():select(2)
    end)
    map_silent('n', '<leader>3', function()
      harpoon:list():select(3)
    end)
    map_silent('n', '<leader>4', function()
      harpoon:list():select(4)
    end)
    map_silent('n', '<leader>5', function()
      harpoon:list():select(5)
    end)
    map_silent('n', '<leader>6', function()
      harpoon:list():select(6)
    end)
    map_silent('n', '<leader>7', function()
      harpoon:list():select(7)
    end)
    map_silent('n', '<leader>8', function()
      harpoon:list():select(8)
    end)
    map_silent('n', '<leader>9', function()
      harpoon:list():select(9)
    end)

    -- vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)
  end,
  lazy = false,
}
