return {
  'cbochs/grapple.nvim',
  config = function()
    local opts = {
      scope = 'git',
      icons = true,
      status = true,
      quick_select = 'hjkl',
    }

    local grapple = require 'grapple'
    grapple.setup(opts)

    local map = function(key, index)
      vim.keymap.set('n', ';' .. key, function()
        if not grapple.exists { index = index } then
          return
        end

        grapple.select { index = index }
      end, { desc = 'Grapple' .. index })
    end

    vim.keymap.set('n', ';;', grapple.toggle, { desc = 'Tag File' })
    vim.keymap.set('n', ';m', grapple.toggle_tags, { desc = 'Toggle Menu' })

    map('h', 1)
    map('j', 2)
    map('k', 3)
    map('l', 4)
    map('a', 5)
    map('s', 6)
    map('d', 7)
    map('f', 8)
  end,
}
